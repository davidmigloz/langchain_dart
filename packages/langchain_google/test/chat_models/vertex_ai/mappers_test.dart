import 'dart:convert';

import 'package:googleai_dart/googleai_dart.dart' as g;
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/tools.dart';
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

    test('retains the raw part without inventing a signature', () {
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

      final googleData =
          result.output.toolCalls.single.providerData['google']
              as Map<String, dynamic>;
      expect(googleData, contains('part'));
      expect(googleData, isNot(contains('thoughtSignature')));
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

    test('keeps a final signed text part separate while streaming', () {
      final signature = utf8.encode('final-text-signature');
      const firstResponse = g.GenerateContentResponse(
        candidates: [
          g.Candidate(
            content: g.Content(parts: [g.TextPart('visible answer')]),
          ),
        ],
      );
      final finalResponse = g.GenerateContentResponse(
        candidates: [
          g.Candidate(
            content: g.Content(
              parts: [g.TextPart('', thoughtSignature: signature)],
            ),
          ),
        ],
      );

      final first = firstResponse
          .toChatResult('stream-id', 'gemini-3.1-pro-preview')
          .output;
      final signedBoundary = finalResponse
          .toChatResult('stream-id', 'gemini-3.1-pro-preview')
          .output;
      final merged = first.concat(signedBoundary);

      expect(merged.contentBlocks, hasLength(2));
      expect(
        merged.contentBlocks.last,
        isA<AIChatMessageTextBlock>()
            .having((block) => block.text, 'text', isEmpty)
            .having((block) => block.isMergeable, 'isMergeable', isFalse),
      );

      final replayed = <ChatMessage>[merged].toContentList().single.parts;
      expect(replayed, hasLength(2));
      expect(replayed.first.thoughtSignature, isNull);
      expect(replayed.last, isA<g.TextPart>());
      expect((replayed.last as g.TextPart).text, isEmpty);
      expect(replayed.last.thoughtSignature, signature);
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

    test('preserves ordered parts and common metadata through replay', () {
      final signature = utf8.encode('reasoning-signature');
      final parts = <g.Part>[
        g.TextPart(
          'reasoning',
          thought: true,
          thoughtSignature: signature,
          partMetadata: const {'phase': 'analysis'},
        ),
        const g.TextPart('answer', additionalProperties: {'future': 1}),
        const g.InlineDataPart(g.Blob(mimeType: 'image/png', data: 'aW1n')),
        const g.FileDataPart(
          g.FileData(fileUri: 'files/one', mimeType: 'text/plain'),
        ),
        const g.FunctionCallPart(
          g.FunctionCall(id: 'call-1', name: 'weather', args: {'city': 'A'}),
        ),
        const g.FunctionResponsePart(
          g.FunctionResponse(
            id: 'call-1',
            name: 'weather',
            response: {'temperature': 20},
          ),
        ),
        const g.ExecutableCodePart(
          g.ExecutableCode(
            id: 'code-1',
            language: g.Language.python,
            code: '1 + 1',
          ),
        ),
        const g.CodeExecutionResultPart(
          g.CodeExecutionResult(
            id: 'code-1',
            outcome: g.Outcome.ok,
            output: '2',
          ),
        ),
        const g.ToolCallPart(
          g.ToolCall(
            id: 'server-1',
            toolType: g.ToolType.googleSearchWeb,
            args: {'q': 'weather'},
          ),
        ),
        const g.ToolResponsePart(
          g.ToolResponse(
            id: 'server-1',
            toolType: g.ToolType.googleSearchWeb,
            response: {'result': 'sunny'},
          ),
        ),
        g.MetadataPart(thoughtSignature: signature),
        g.UnknownPart({
          'futurePart': {'value': 1},
        }),
      ];
      final response = g.GenerateContentResponse(
        candidates: [g.Candidate(content: g.Content(parts: parts))],
      );

      final message = response.toChatResult('response-1', 'gemini').output;
      final replayed = <ChatMessage>[message].toContentList().single.parts;

      expect(message.contentBlocks.map((block) => block.runtimeType), [
        AIChatMessageReasoningBlock,
        AIChatMessageTextBlock,
        AIChatMessageMediaBlock,
        AIChatMessageFileBlock,
        AIChatMessageToolCall,
        AIChatMessageServerToolResult,
        AIChatMessageServerToolCall,
        AIChatMessageServerToolResult,
        AIChatMessageServerToolCall,
        AIChatMessageServerToolResult,
        AIChatMessageProviderMetadataBlock,
        AIChatMessageNonStandardBlock,
      ]);
      expect(
        replayed.map((part) => part.toJson()),
        parts.map((p) => p.toJson()),
      );
    });

    test('keeps parallel same-name streamed calls separate', () {
      g.GenerateContentResponse chunk(
        Map<String, dynamic> first,
        Map<String, dynamic> second,
      ) => g.GenerateContentResponse(
        candidates: [
          g.Candidate(
            content: g.Content(
              parts: [
                g.FunctionCallPart(
                  g.FunctionCall(name: 'weather', args: first),
                ),
                g.FunctionCallPart(
                  g.FunctionCall(name: 'weather', args: second),
                ),
              ],
            ),
          ),
        ],
      );

      final starts = chunk(
        const {},
        const {},
      ).toChatResult('response-1', 'gemini').output;
      final finishes = chunk(
        const {'city': 'Madrid'},
        const {'city': 'Paris'},
      ).toChatResult('response-1', 'gemini').output;
      final calls = starts.concat(finishes).toolCalls;

      expect(calls, hasLength(2));
      expect(calls.map((call) => call.id), [
        'google:response-1:0:0',
        'google:response-1:0:1',
      ]);
      expect(calls.map((call) => call.arguments['city']), ['Madrid', 'Paris']);
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
