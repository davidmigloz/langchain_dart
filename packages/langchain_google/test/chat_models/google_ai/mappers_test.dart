import 'dart:convert';

import 'package:googleai_dart/googleai_dart.dart' as g;
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/tools.dart';
import 'package:langchain_google/src/chat_models/google_ai/mappers.dart';
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

  group('googleai_dart 12 typed APIs', () {
    test('maps every tool choice to typed ToolConfig', () {
      expect(ChatToolChoice.none.toToolConfig().toJson(), {
        'functionCallingConfig': {'mode': 'NONE'},
      });
      expect(ChatToolChoice.auto.toToolConfig().toJson(), {
        'functionCallingConfig': {'mode': 'AUTO'},
      });
      expect(ChatToolChoice.required.toToolConfig().toJson(), {
        'functionCallingConfig': {'mode': 'ANY'},
      });
      expect(
        ChatToolChoice.forced(name: 'getWeather').toToolConfig().toJson(),
        {
          'functionCallingConfig': {
            'mode': 'ANY',
            'allowedFunctionNames': ['getWeather'],
          },
        },
      );
    });

    test('maps code execution to the typed marker', () {
      final tools = const <ToolSpec>[].toToolList(enableCodeExecution: true);

      expect(tools, hasLength(1));
      expect(tools!.single.codeExecution, isA<g.CodeExecution>());
    });

    test('accepts metadata-only and unknown parts', () {
      final response = g.GenerateContentResponse(
        candidates: [
          g.Candidate(
            content: g.Content(
              parts: [
                const g.TextPart('visible'),
                const g.MetadataPart(thought: true),
                g.UnknownPart({
                  'futurePart': {'value': 1},
                }),
              ],
            ),
          ),
        ],
      );

      final result = response.toChatResult('id-1', 'gemini-2.5-flash');

      expect(result.output.content, startsWith('visible'));
    });

    test('maps every finish reason introduced through v12', () {
      const expected = <g.FinishReason, FinishReason>{
        g.FinishReason.language: FinishReason.contentFilter,
        g.FinishReason.imageSafety: FinishReason.contentFilter,
        g.FinishReason.imageProhibitedContent: FinishReason.contentFilter,
        g.FinishReason.imageOther: FinishReason.unspecified,
        g.FinishReason.noImage: FinishReason.unspecified,
        g.FinishReason.imageRecitation: FinishReason.recitation,
        g.FinishReason.unexpectedToolCall: FinishReason.unspecified,
        g.FinishReason.tooManyToolCalls: FinishReason.unspecified,
        g.FinishReason.missingThoughtSignature: FinishReason.unspecified,
        g.FinishReason.malformedResponse: FinishReason.unspecified,
        g.FinishReason.escalation: FinishReason.unspecified,
      };

      for (final MapEntry(key: reason, value: finishReason)
          in expected.entries) {
        final result = g.GenerateContentResponse(
          candidates: [
            g.Candidate(
              content: const g.Content(parts: [g.TextPart('result')]),
              finishReason: reason,
            ),
          ],
        ).toChatResult('id-1', 'gemini-2.5-flash');

        expect(result.finishReason, finishReason, reason: reason.name);
      }
    });
  });
}
