// ignore_for_file: avoid_redundant_argument_values
@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Google AI count tokens API tests', () {
    late GoogleAIClient client;

    setUp(() async {
      client = GoogleAIClient(
        apiKey: Platform.environment['GOOGLEAI_API_KEY'],
      );
    });

    tearDown(() {
      client.endSession();
    });

    test('Test Count tokens with gemini-pro', () async {
      final res = await client.countTokens(
        modelId: 'gemini-pro',
        request: const CountTokensRequest(
          contents: [
            Content(
              parts: [
                Part(
                  text: 'List the numbers from 1 to 9 in order '
                      'without any spaces, commas or additional explanations.',
                ),
              ],
            ),
          ],
        ),
      );
      expect(res.totalTokens, 20);
    });
  });
}
