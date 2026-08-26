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

    expect(message.contentBlocks.map((block) => block.runtimeType), [
      AIChatMessageReasoningBlock,
      AIChatMessageTextBlock,
      AIChatMessageToolCall,
      AIChatMessageNonStandardBlock,
    ]);
    expect(message.toolCalls.single.id, 'call-1');
    expect(
      ((message.contentBlocks.first.providerData['firebase']
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
}
