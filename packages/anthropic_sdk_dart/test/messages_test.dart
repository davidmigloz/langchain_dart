@TestOn('vm')
library; // Uses dart:io

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

    test('Test call messages API', () async {
      const models = Models.values;
      for (final model in models) {
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
        expect(
          res.model?.replaceAll(RegExp(r'[-.]'), ''),
          model.name.toLowerCase(),
        );
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

    test('Test call messages streaming API', () async {
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
            expect(v.contentBlock.text, isEmpty);
            expect(v.contentBlock.type, 'text');
          },
          contentBlockDelta: (v) {
            expect(res.type, MessageStreamEventType.contentBlockDelta);
            expect(v.index, greaterThanOrEqualTo(0));
            expect(v.delta.text, isNotEmpty);
            expect(v.delta.type, 'text_delta');
            text += v.delta.text.replaceAll(RegExp(r'[\s\n]'), '');
          },
          contentBlockStop: (v) {
            expect(res.type, MessageStreamEventType.contentBlockStop);
            expect(v.index, greaterThanOrEqualTo(0));
          },
          ping: (v) {
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
  });
}
