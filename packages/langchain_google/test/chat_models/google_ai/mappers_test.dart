import 'dart:convert';

import 'package:googleai_dart/googleai_dart.dart' as g;
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_google/src/chat_models/google_ai/mappers.dart';
import 'package:test/test.dart';

void main() {
  group('GenerateContentResponseMapper thought signatures', () {
    test(
      'captures FunctionCallPart.thoughtSignature into tool-call metadata',
      () {
        final signature = utf8.encode('signature-bytes');
        final response = g.GenerateContentResponse(
          candidates: [
            g.Candidate(
              content: g.Content(
                role: 'model',
                parts: [
                  g.FunctionCallPart(
                    const g.FunctionCall(
                      name: 'getWeather',
                      args: {'city': 'Madrid'},
                    ),
                    thoughtSignature: signature,
                  ),
                ],
              ),
            ),
          ],
        );

        final result = response.toChatResult('id-1', 'gemini-2.5-flash');

        expect(
          result.output.toolCalls.single.metadata['thought_signature'],
          base64Encode(signature),
        );
      },
    );

    test('leaves tool-call metadata empty when there is no signature', () {
      const response = g.GenerateContentResponse(
        candidates: [
          g.Candidate(
            content: g.Content(
              role: 'model',
              parts: [
                g.FunctionCallPart(
                  g.FunctionCall(name: 'getWeather', args: {'city': 'Madrid'}),
                ),
              ],
            ),
          ),
        ],
      );

      final result = response.toChatResult('id-1', 'gemini-2.5-flash');

      expect(result.output.toolCalls.single.metadata, isEmpty);
    });
  });

  group('ChatMessagesMapper thought signatures', () {
    test('replays tool-call metadata as FunctionCallPart.thoughtSignature', () {
      final signature = utf8.encode('signature-bytes');
      final messages = <ChatMessage>[
        AIChatMessage(
          content: '',
          toolCalls: [
            AIChatMessageToolCall(
              id: 'getWeather',
              name: 'getWeather',
              argumentsRaw: '{"city":"Madrid"}',
              arguments: const {'city': 'Madrid'},
              metadata: {'thought_signature': base64Encode(signature)},
            ),
          ],
        ),
      ];

      final content = messages.toContentList();

      final part = content.single.parts.single as g.FunctionCallPart;
      expect(part.thoughtSignature, signature);
    });

    test('maps no thoughtSignature when metadata lacks one', () {
      final messages = <ChatMessage>[
        const AIChatMessage(
          content: '',
          toolCalls: [
            AIChatMessageToolCall(
              id: 'getWeather',
              name: 'getWeather',
              argumentsRaw: '{"city":"Madrid"}',
              arguments: {'city': 'Madrid'},
            ),
          ],
        ),
      ];

      final content = messages.toContentList();

      final part = content.single.parts.single as g.FunctionCallPart;
      expect(part.thoughtSignature, isNull);
    });
  });
}
