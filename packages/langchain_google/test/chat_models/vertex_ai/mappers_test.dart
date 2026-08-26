import 'dart:convert';

import 'package:googleai_dart/googleai_dart.dart' as g;
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_google/src/chat_models/vertex_ai/mappers.dart';
import 'package:test/test.dart';

void main() {
  group('GenerateContentResponseMapper thought signatures', () {
    test(
      'round-trips FunctionCallPart.thoughtSignature through provider data',
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
          (result.output.toolCalls.single.providerData['google']
              as Map)['thoughtSignature'],
          base64Encode(signature),
        );

        final replayed = <ChatMessage>[result.output].toContentList();
        final replayedPart = replayed.single.parts.single as g.FunctionCallPart;
        expect(replayedPart.thoughtSignature, signature);
      },
    );

    test('leaves tool-call provider data empty when there is no signature', () {
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

      expect(result.output.toolCalls.single.providerData, isEmpty);
    });

    test('preserves thoughtSignature through streamed concatenation', () {
      final signature = utf8.encode('signature-bytes');
      final response = g.GenerateContentResponse(
        candidates: [
          g.Candidate(
            content: g.Content(
              role: 'model',
              parts: [
                g.FunctionCallPart(
                  const g.FunctionCall(name: 'getWeather', args: {}),
                  thoughtSignature: signature,
                ),
              ],
            ),
          ),
        ],
      );
      final first = response.toChatResult('id-1', 'gemini-2.5-flash').output;
      final merged = first.concat(
        AIChatMessage(
          content: '',
          toolCalls: [
            AIChatMessageToolCall(
              id: first.toolCalls.single.id,
              name: '',
              argumentsRaw: '',
              arguments: const {'city': 'Madrid'},
            ),
          ],
        ),
      );

      final replayed = <ChatMessage>[merged].toContentList();
      final replayedPart = replayed.single.parts.single as g.FunctionCallPart;
      expect(replayedPart.thoughtSignature, signature);
    });
  });

  group('ChatMessagesMapper thought signatures', () {
    test(
      'replays tool-call provider data as FunctionCallPart.thoughtSignature',
      () {
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
                providerData: {
                  'google': {'thoughtSignature': base64Encode(signature)},
                },
              ),
            ],
          ),
        ];

        final content = messages.toContentList();

        final part = content.single.parts.single as g.FunctionCallPart;
        expect(part.thoughtSignature, signature);
      },
    );

    test('maps no thoughtSignature when provider data lacks one', () {
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
