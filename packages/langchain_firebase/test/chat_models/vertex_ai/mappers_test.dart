import 'dart:convert';

import 'package:firebase_ai/firebase_ai.dart' as f;
import 'package:flutter_test/flutter_test.dart';
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_firebase/src/chat_models/vertex_ai/mappers.dart';

void main() {
  test('preserves ordered parts, thoughts, signatures, and unknown data', () {
    final signature = base64Encode(utf8.encode('signature'));
    final parts = <f.Part>[
      f.TextPart.forTest(
        'reasoning',
        isThought: true,
        thoughtSignature: signature,
      ),
      const f.TextPart('answer'),
      const f.FunctionCall.forTest(
        'weather',
        {'city': 'Madrid'},
        id: 'call-1',
        thoughtSignature: 'tool-signature',
      ),
      f.UnknownPart({
        'futurePart': {'value': 1},
      }),
    ];
    final response = f.GenerateContentResponse([
      f.Candidate(f.Content.model(parts), null, null, null, null),
    ], null);

    final message = response.toChatResult('response-1', 'gemini').output;
    final replayed = <ChatMessage>[message].toContentList().single.parts;

    expect(message.content.map((block) => block.runtimeType), [
      AIChatMessageReasoningBlock,
      AIChatMessageTextBlock,
      AIChatMessageToolCall,
      AIChatMessageNonStandardBlock,
    ]);
    expect(message.toolCalls.single.id, 'call-1');
    expect(
      ((message.content.first.providerData['firebase']
              as Map<String, dynamic>)['part']
          as Map<String, dynamic>)['thoughtSignature'],
      signature,
    );
    expect(
      (replayed[0].toJson() as Map<String, Object?>)['thoughtSignature'],
      signature,
    );
    expect(
      (replayed[2].toJson() as Map<String, Object?>)['thoughtSignature'],
      'tool-signature',
    );
  });

  test('keeps parallel same-name calls separate by native id', () {
    f.GenerateContentResponse chunk(
      final Map<String, Object?> madrid,
      final Map<String, Object?> paris,
    ) => f.GenerateContentResponse([
      f.Candidate(
        f.Content.model([
          f.FunctionCall('weather', madrid, id: 'call-madrid'),
          f.FunctionCall('weather', paris, id: 'call-paris'),
        ]),
        null,
        null,
        null,
        null,
      ),
    ], null);

    final starts = chunk(
      const {},
      const {},
    ).toChatResult('response-1', 'gemini').output;
    final finishes = chunk(
      const {'city': 'Madrid'},
      const {'city': 'Paris'},
    ).toChatResult('response-1', 'gemini').output;
    final calls = starts.concat(finishes).toolCalls;

    expect(calls.map((call) => call.id), ['call-madrid', 'call-paris']);
    expect(calls.map((call) => call.arguments['city']), ['Madrid', 'Paris']);
  });

  test('keeps a final signed text part separate while streaming', () {
    const signature = 'final-text-signature';
    f.GenerateContentResponse response(final f.Part part) =>
        f.GenerateContentResponse([
          f.Candidate(f.Content.model([part]), null, null, null, null),
        ], null);

    final first = response(
      const f.TextPart('visible answer'),
    ).toChatResult('stream-id', 'gemini').output;
    final signedBoundary = response(
      const f.TextPart.forTest('', thoughtSignature: signature),
    ).toChatResult('stream-id', 'gemini').output;
    final merged = first.concat(signedBoundary);

    expect(merged.content, hasLength(2));
    expect(
      merged.content.last,
      isA<AIChatMessageTextBlock>()
          .having((block) => block.text, 'text', isEmpty)
          .having((block) => block.isMergeable, 'isMergeable', isFalse),
    );

    final replayed = <ChatMessage>[merged].toContentList().single.parts;
    expect(replayed, hasLength(2));
    expect(
      (replayed.first.toJson() as Map<String, Object?>)['thoughtSignature'],
      isNull,
    );
    expect(
      (replayed.last.toJson() as Map<String, Object?>)['thoughtSignature'],
      signature,
    );
  });

  test('maps opaque tool-call IDs separately from function names', () {
    final content = <ChatMessage>[
      ChatMessage.tool(
        toolCallId: 'call-1',
        name: 'weather',
        content: '{"temperature":22}',
      ),
    ].toContentList();

    final response = content.single.parts.single as f.FunctionResponse;
    expect(response.id, 'call-1');
    expect(response.name, 'weather');
  });
}
