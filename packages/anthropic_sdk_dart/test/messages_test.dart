// ignore_for_file: avoid_print
@TestOn('vm')
library; // Uses dart:io

import 'dart:convert';
import 'dart:io';

import 'package:anthropic_sdk_dart/anthropic_sdk_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Anthropic Messages API tests', () {
    late AnthropicClient client;

    setUp(() {
      client = AnthropicClient(
        apiKey: Platform.environment['ANTHROPIC_API_KEY'],
      );
    });

    tearDown(() {
      client.endSession();
    });

    test(
      'Test call messages API',
      timeout: const Timeout(Duration(minutes: 5)),
      () async {
        // Filter to only working models (latest + legacy Haiku 3)
        const models = [
          Models.claudeHaiku4520251001,
          Models.claude3Haiku20240307,
        ];
        for (final model in models) {
          print('Testing model: ${model.name}');
          final res = await client.createMessage(
            request: CreateMessageRequest(
              model: Model.model(model),
              temperature: 0,
              maxTokens: 1024,
              system: const CreateMessageRequestSystem.text(
                'You are a helpful assistant that replies only with numbers '
                'in order without any spaces, commas or additional explanations.',
              ),
              messages: const [
                Message(
                  role: MessageRole.user,
                  content: MessageContent.text(
                    'List the numbers from 1 to 9 in order.',
                  ),
                ),
              ],
            ),
          );
          expect(res.id, isNotEmpty);
          expect(
            res.content.text.replaceAll(RegExp(r'[\s\n]'), ''),
            contains('123456789'),
          );
          expect(res.role, MessageRole.assistant);
          expect(res.model, isNotEmpty);
          expect(res.stopReason, StopReason.endTurn);
          expect(res.stopSequence, isNull);
          expect(res.type, 'message');
          expect(res.usage?.inputTokens, greaterThan(0));
          expect(res.usage?.outputTokens, greaterThan(0));
          await Future<void>.delayed(
            const Duration(seconds: 5),
          ); // To avoid rate limit
        }
      },
    );

    test(
      'Test call messages streaming API',
      timeout: const Timeout(Duration(minutes: 5)),
      () async {
        final stream = client.createMessageStream(
          request: const CreateMessageRequest(
            model: Model.model(Models.claudeHaiku4520251001),
            temperature: 0,
            maxTokens: 1024,
            system: CreateMessageRequestSystem.text(
              'You are a helpful assistant that replies only with numbers '
              'in order without any spaces, commas or additional explanations.',
            ),
            messages: [
              Message(
                role: MessageRole.user,
                content: MessageContent.text(
                  'List the numbers from 1 to 9 in order.',
                ),
              ),
            ],
          ),
        );
        var text = '';
        await for (final res in stream) {
          res.map(
            messageStart: (v) {
              expect(res.type, MessageStreamEventType.messageStart);
              expect(v.message.id, isNotEmpty);
              expect(v.message.role, MessageRole.assistant);
              expect(
                v.message.model?.replaceAll(RegExp(r'[-.]'), ''),
                Models.claudeHaiku4520251001.name.toLowerCase(),
              );
              expect(v.message.stopReason, isNull);
              expect(v.message.stopSequence, isNull);
              expect(v.message.usage?.inputTokens, greaterThan(0));
              expect(v.message.usage?.outputTokens, greaterThan(0));
            },
            messageDelta: (v) {
              expect(res.type, MessageStreamEventType.messageDelta);
              expect(v.delta.stopReason, StopReason.endTurn);
              expect(v.usage.outputTokens, greaterThan(0));
            },
            messageStop: (v) {
              expect(res.type, MessageStreamEventType.messageStop);
            },
            contentBlockStart: (v) {
              expect(res.type, MessageStreamEventType.contentBlockStart);
              expect(v.index, 0);
              expect(v.contentBlock.text, isNotNull);
              expect(v.contentBlock.type, 'text');
            },
            contentBlockDelta: (v) {
              expect(res.type, MessageStreamEventType.contentBlockDelta);
              expect(v.index, greaterThanOrEqualTo(0));
              expect(v.delta.text, isNotEmpty);
              expect(v.delta.type, 'text_delta');
              text +=
                  v.delta
                      .mapOrNull(textDelta: (v) => v.text)
                      ?.replaceAll(RegExp(r'[\s\n]'), '') ??
                  '';
            },
            contentBlockStop: (v) {
              expect(res.type, MessageStreamEventType.contentBlockStop);
              expect(v.index, greaterThanOrEqualTo(0));
            },
            ping: (PingEvent v) {
              expect(res.type, MessageStreamEventType.ping);
            },
            error: (ErrorEvent v) {
              expect(res.type, MessageStreamEventType.error);
            },
          );
        }
        expect(text, contains('123456789'));
      },
    );

    test('Test response max tokens', () async {
      const request = CreateMessageRequest(
        model: Model.model(Models.claudeHaiku4520251001),
        maxTokens: 1,
        messages: [
          Message(
            role: MessageRole.user,
            content: MessageContent.text('Tell me a joke.'),
          ),
        ],
      );

      final res = await client.createMessage(request: request);
      expect(res.stopReason, StopReason.maxTokens);
    });

    const tool = Tool.custom(
      name: 'get_current_weather',
      description: 'Get the current weather in a given location',
      inputSchema: {
        'type': 'object',
        'properties': {
          'location': {
            'type': 'string',
            'description': 'The city and state, e.g. San Francisco, CA',
          },
          'unit': {
            'type': 'string',
            'description': 'The unit of temperature to return',
            'enum': ['celsius', 'fahrenheit'],
          },
        },
        'required': ['location'],
      },
    );

    test('Test tool use', () async {
      final request1 = CreateMessageRequest(
        model: const Model.model(Models.claudeHaiku4520251001),
        messages: [
          const Message(
            role: MessageRole.user,
            content: MessageContent.text(
              'What’s the weather like in Boston right now?',
            ),
          ),
        ],
        tools: [tool],
        toolChoice: ToolChoice(type: ToolChoiceType.tool, name: tool.name),
        maxTokens: 1024,
      );
      final aiMessage1 = await client.createMessage(request: request1);
      expect(aiMessage1.role, MessageRole.assistant);

      var toolUse = aiMessage1.content.blocks.first;
      expect(toolUse, isA<ToolUseBlock>());
      toolUse = toolUse as ToolUseBlock;

      expect(toolUse.name, tool.name);
      expect(toolUse.input, isNotEmpty);
      expect(toolUse.input.containsKey('location'), isTrue);
      expect(toolUse.input['location'], contains('Boston'));

      final toolResult = json.encode({
        'temperature': '22',
        'unit': 'celsius',
        'description': 'Sunny',
      });

      final request2 = CreateMessageRequest(
        model: const Model.model(Models.claudeHaiku4520251001),
        messages: [
          const Message(
            role: MessageRole.user,
            content: MessageContent.text(
              "What's the weather like in Boston right now?",
            ),
          ),
          Message(role: MessageRole.assistant, content: aiMessage1.content),
          Message(
            role: MessageRole.user,
            content: MessageContent.blocks([
              Block.toolResult(
                toolUseId: toolUse.id,
                content: ToolResultBlockContent.text(toolResult),
              ),
            ]),
          ),
        ],
        tools: [tool],
        maxTokens: 1024,
      );
      final aiMessage2 = await client.createMessage(request: request2);

      expect(aiMessage2.role, MessageRole.assistant);
      expect(aiMessage2.content.text, contains('22'));
    });

    test(
      'Test streaming tool use ',
      timeout: const Timeout(Duration(minutes: 5)),
      () async {
        final request1 = CreateMessageRequest(
          model: const Model.model(Models.claudeHaiku4520251001),
          messages: [
            const Message(
              role: MessageRole.user,
              content: MessageContent.text(
                "What's the weather like in Boston right now in Celsius?",
              ),
            ),
          ],
          tools: [tool],
          toolChoice: ToolChoice(type: ToolChoiceType.tool, name: tool.name),
          maxTokens: 1024,
        );
        final stream = client.createMessageStream(request: request1);
        var inputJson = '';
        await for (final res in stream) {
          res.map(
            messageStart: (v) {
              expect(res.type, MessageStreamEventType.messageStart);
              expect(v.message.id, isNotEmpty);
              expect(v.message.role, MessageRole.assistant);
              expect(
                v.message.model?.replaceAll(RegExp(r'[-.]'), ''),
                Models.claudeHaiku4520251001.name.toLowerCase(),
              );
              expect(v.message.stopReason, isNull);
              expect(v.message.stopSequence, isNull);
              expect(v.message.usage?.inputTokens, greaterThan(0));
              expect(v.message.usage?.outputTokens, greaterThan(0));
            },
            messageDelta: (v) {
              expect(res.type, MessageStreamEventType.messageDelta);
              expect(v.delta.stopReason, StopReason.toolUse);
              expect(v.usage.outputTokens, greaterThan(0));
            },
            messageStop: (v) {
              expect(res.type, MessageStreamEventType.messageStop);
            },
            contentBlockStart: (v) {
              expect(res.type, MessageStreamEventType.contentBlockStart);
              expect(v.index, 0);
              expect(v.contentBlock.type, 'tool_use');
              expect(v.contentBlock.toolUse, isNotNull);
              expect(v.contentBlock.toolUse!.id, isNotEmpty);
              expect(v.contentBlock.toolUse!.name, tool.name);
            },
            contentBlockDelta: (v) {
              expect(res.type, MessageStreamEventType.contentBlockDelta);
              expect(v.index, greaterThanOrEqualTo(0));
              expect(v.delta.type, 'input_json_delta');
              inputJson += v.delta.inputJson;
            },
            contentBlockStop: (v) {
              expect(res.type, MessageStreamEventType.contentBlockStop);
              expect(v.index, greaterThanOrEqualTo(0));
            },
            ping: (PingEvent v) {
              expect(res.type, MessageStreamEventType.ping);
            },
            error: (ErrorEvent v) {
              expect(res.type, MessageStreamEventType.error);
            },
          );
        }
        final input = json.decode(inputJson) as Map<String, dynamic>;
        expect(input['location'], contains('Boston'));
        expect(input['unit'], 'celsius');
      },
    );

    test(
      'Test createMessageBatch API',
      skip: true,
      timeout: const Timeout(Duration(minutes: 5)),
      () async {
        const batchRequest = CreateMessageBatchRequest(
          requests: [
            BatchMessageRequest(
              customId: 'request1',
              params: CreateMessageRequest(
                model: Model.model(Models.claudeHaiku4520251001),
                temperature: 0,
                maxTokens: 1024,
                system: CreateMessageRequestSystem.text(
                  'You are a helpful assistant that replies only with numbers in order without any spaces, commas or additional explanations.',
                ),
                messages: [
                  Message(
                    role: MessageRole.user,
                    content: MessageContent.text(
                      'List the numbers from 1 to 9 in order.',
                    ),
                  ),
                ],
              ),
            ),
            BatchMessageRequest(
              customId: 'request2',
              params: CreateMessageRequest(
                model: Model.model(Models.claudeHaiku4520251001),
                temperature: 0,
                maxTokens: 1024,
                system: CreateMessageRequestSystem.text(
                  'You are a helpful assistant that replies only with numbers in order without any spaces, commas or additional explanations.',
                ),
                messages: [
                  Message(
                    role: MessageRole.user,
                    content: MessageContent.text(
                      'List the numbers from 10 to 19 in order.',
                    ),
                  ),
                ],
              ),
            ),
          ],
        );

        var batch = await client.createMessageBatch(request: batchRequest);
        expect(batch.id, isNotEmpty);
        expect(batch.createdAt, isNotEmpty);
        expect(batch.expiresAt, isNotEmpty);
        expect(batch.processingStatus, MessageBatchProcessingStatus.inProgress);
        expect(batch.requestCounts.processing, 2);
        expect(batch.type, MessageBatchType.messageBatch);

        do {
          await Future<void>.delayed(const Duration(seconds: 5));
          batch = await client.retrieveMessageBatch(id: batch.id);
        } while (batch.processingStatus ==
            MessageBatchProcessingStatus.inProgress);

        batch = await client.retrieveMessageBatch(id: batch.id);
        expect(batch.processingStatus, MessageBatchProcessingStatus.ended);
        expect(batch.resultsUrl, isNotEmpty);
      },
    );

    test(
      'Test computer tool use',
      skip:
          'claude-sonnet-4-5-20250929 does not support computer_20241022 tools',
      () async {
        const request = CreateMessageRequest(
          model: Model.model(Models.claudeSonnet4520250929),
          messages: [
            Message(
              role: MessageRole.user,
              content: MessageContent.text(
                'Save a picture of a cat to my desktop. '
                'After each step, take a screenshot and carefully evaluate if you '
                'have achieved the right outcome. Explicitly show your thinking: '
                '"I have evaluated step X..." If not correct, try again. '
                'Only when you confirm a step was executed correctly should '
                'you move on to the next one.',
              ),
            ),
          ],
          tools: [
            Tool.computerUse(displayWidthPx: 1024, displayHeightPx: 768),
            Tool.textEditor(),
            Tool.bash(),
          ],
          maxTokens: 1024,
        );
        final aiMessage = await client.createMessage(request: request);
        expect(aiMessage.role, MessageRole.assistant);

        final toolUse =
            aiMessage.content.blocks.firstWhere(
                  (block) => block is ToolUseBlock,
                )
                as ToolUseBlock;

        expect(toolUse.name, 'computer');
        expect(toolUse.input, isNotEmpty);
        expect(toolUse.input.containsKey('action'), isTrue);
        expect(toolUse.input['action'], 'screenshot');
      },
    );

    test(
      'Test Prompt caching',
      skip:
          'Prompt caching behavior varies by model and may not return expected cache metrics',
      () async {
        final testDir = Directory.current.path.endsWith('anthropic_sdk_dart')
            ? Directory.current.path
            : '${Directory.current.path}/packages/anthropic_sdk_dart';
        final work = await File(
          '$testDir/test/assets/shakespeare.txt',
        ).readAsString();
        final request = CreateMessageRequest(
          model: const Model.model(Models.claudeHaiku4520251001),
          system: CreateMessageRequestSystem.blocks([
            const Block.text(
              text:
                  'You are an AI assistant tasked with analyzing literary works. '
                  'Your goal is to provide insightful commentary on themes, characters, and writing style.',
            ),
            Block.text(cacheControl: const CacheControlEphemeral(), text: work),
          ]),
          messages: [
            const Message(
              role: MessageRole.user,
              content: MessageContent.text("What's the theme of the work?"),
            ),
          ],
          maxTokens: 1024,
        );
        final res1 = await client.createMessage(request: request);
        expect(res1.usage?.cacheCreationInputTokens, greaterThan(0));
        expect(res1.usage?.cacheReadInputTokens, 0);

        final res2 = await client.createMessage(request: request);
        expect(res2.usage?.cacheCreationInputTokens, 0);
        expect(res2.usage?.cacheReadInputTokens, greaterThan(0));
      },
    );

    // Test for issue #811: signature_delta events should be handled
    test('Test signature_delta deserialization (issue #811)', () {
      // This tests that signature_delta events from the streaming API
      // can be properly deserialized without throwing an error
      const signatureDeltaJson = '''
      {
        "type": "signature_delta",
        "signature": "EqQBCgIYAhIM0v..."
      }
      ''';
      final json = jsonDecode(signatureDeltaJson) as Map<String, dynamic>;
      final blockDelta = BlockDelta.fromJson(json);

      expect(blockDelta, isA<SignatureBlockDelta>());
      final signatureDelta = blockDelta as SignatureBlockDelta;
      expect(signatureDelta.type, SignatureBlockDeltaType.signatureDelta);
      expect(signatureDelta.signature, 'EqQBCgIYAhIM0v...');
    });

    test('Test ContentBlockDeltaEvent with signature_delta', () {
      // Test the full event structure as received from the streaming API
      const eventJson = '''
      {
        "type": "content_block_delta",
        "index": 0,
        "delta": {
          "type": "signature_delta",
          "signature": "EqQBCgIYAhIM0vZ3tu..."
        }
      }
      ''';
      final json = jsonDecode(eventJson) as Map<String, dynamic>;
      final event = MessageStreamEvent.fromJson(json);

      expect(event, isA<ContentBlockDeltaEvent>());
      final deltaEvent = event as ContentBlockDeltaEvent;
      expect(deltaEvent.index, 0);
      expect(deltaEvent.delta, isA<SignatureBlockDelta>());

      final signatureDelta = deltaEvent.delta as SignatureBlockDelta;
      expect(signatureDelta.signature, 'EqQBCgIYAhIM0vZ3tu...');
    });
  });
}
