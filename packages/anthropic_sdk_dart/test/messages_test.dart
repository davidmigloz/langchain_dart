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

    setUp(() async {
      client = AnthropicClient(
        apiKey: Platform.environment['ANTHROPIC_API_KEY'],
      );
    });

    tearDown(() {
      client.endSession();
    });

    test('Test call messages API', timeout: const Timeout(Duration(minutes: 5)),
        () async {
      const models = Models.values;
      for (final model in models) {
        print('Testing model: ${model.name}');
        final res = await client.createMessage(
          request: CreateMessageRequest(
            model: Model.model(model),
            temperature: 0,
            maxTokens: 1024,
            system:
                'You are a helpful assistant that replies only with numbers '
                'in order without any spaces, commas or additional explanations.',
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
    });

    test('Test call messages streaming API',
        timeout: const Timeout(Duration(minutes: 5)), () async {
      final stream = client.createMessageStream(
        request: const CreateMessageRequest(
          model: Model.model(Models.claudeInstant12),
          temperature: 0,
          maxTokens: 1024,
          system: 'You are a helpful assistant that replies only with numbers '
              'in order without any spaces, commas or additional explanations.',
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
      String text = '';
      await for (final res in stream) {
        res.map(
          messageStart: (v) {
            expect(res.type, MessageStreamEventType.messageStart);
            expect(v.message.id, isNotEmpty);
            expect(v.message.role, MessageRole.assistant);
            expect(
              v.message.model?.replaceAll(RegExp(r'[-.]'), ''),
              Models.claudeInstant12.name.toLowerCase(),
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
            text += v.delta
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
        );
      }
      expect(text, contains('123456789'));
    });

    test('Test response max tokens', () async {
      const request = CreateMessageRequest(
        model: Model.model(Models.claudeInstant12),
        maxTokens: 1,
        messages: [
          Message(
            role: MessageRole.user,
            content: MessageContent.text(
              'Tell me a joke.',
            ),
          ),
        ],
      );

      final res = await client.createMessage(request: request);
      expect(res.stopReason, StopReason.maxTokens);
    });

    const tool = Tool(
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
        model: const Model.model(Models.claude35Sonnet20241022),
        messages: [
          const Message(
            role: MessageRole.user,
            content: MessageContent.text(
              'What’s the weather like in Boston right now?',
            ),
          ),
        ],
        tools: [tool],
        toolChoice: ToolChoice(
          type: ToolChoiceType.tool,
          name: tool.name,
        ),
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
        model: const Model.model(Models.claude35Sonnet20241022),
        messages: [
          const Message(
            role: MessageRole.user,
            content: MessageContent.text(
              'What’s the weather like in Boston right now?',
            ),
          ),
          Message(
            role: MessageRole.assistant,
            content: aiMessage1.content,
          ),
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

    test('Test tool use streaming',
        timeout: const Timeout(Duration(minutes: 5)), () async {
      final request1 = CreateMessageRequest(
        model: const Model.model(Models.claude35Sonnet20241022),
        messages: [
          const Message(
            role: MessageRole.user,
            content: MessageContent.text(
              'What’s the weather like in Boston right now in Celsius?',
            ),
          ),
        ],
        tools: [tool],
        toolChoice: ToolChoice(
          type: ToolChoiceType.tool,
          name: tool.name,
        ),
        maxTokens: 1024,
      );
      final stream = client.createMessageStream(
        request: request1,
      );
      String inputJson = '';
      await for (final res in stream) {
        res.map(
          messageStart: (v) {
            expect(res.type, MessageStreamEventType.messageStart);
            expect(v.message.id, isNotEmpty);
            expect(v.message.role, MessageRole.assistant);
            expect(
              v.message.model?.replaceAll(RegExp(r'[-.]'), ''),
              Models.claude35Sonnet20241022.name.toLowerCase(),
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
        );
      }
      final input = json.decode(inputJson) as Map<String, dynamic>;
      expect(input['location'], contains('Boston'));
      expect(input['unit'], 'celsius');
    });

    test('Test createMessageBatch API',
        skip: true, timeout: const Timeout(Duration(minutes: 5)), () async {
      const batchRequest = CreateMessageBatchRequest(
        requests: [
          BatchMessageRequest(
            customId: 'request1',
            params: CreateMessageRequest(
              model: Model.model(Models.claudeInstant12),
              temperature: 0,
              maxTokens: 1024,
              system:
                  'You are a helpful assistant that replies only with numbers in order without any spaces, commas or additional explanations.',
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
              model: Model.model(Models.claudeInstant12),
              temperature: 0,
              maxTokens: 1024,
              system:
                  'You are a helpful assistant that replies only with numbers in order without any spaces, commas or additional explanations.',
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
      } while (
          batch.processingStatus == MessageBatchProcessingStatus.inProgress);

      batch = await client.retrieveMessageBatch(id: batch.id);
      expect(batch.processingStatus, MessageBatchProcessingStatus.ended);
      expect(batch.resultsUrl, isNotEmpty);
    });
  });
}
