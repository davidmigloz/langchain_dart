// ignore_for_file: avoid_print, avoid_redundant_argument_values
import 'dart:convert';
import 'dart:io';

import 'package:googleai_dart/googleai_dart.dart';

Future<void> main() async {
  final client = GoogleAIClient(
    apiKey: Platform.environment['GOOGLEAI_API_KEY'],
  );

  // Generate content
  await _generateContentTextInput(client);
  await _generateContentTextAndImageInput(client);
  await _generateContentMultiTurnConversations(client);

  // Count tokens
  await _countTokens(client);

  // Embed content
  await _embedContent(client);

  // Models
  await _listModels(client);
  await _getModel(client);

  client.endSession();
}

Future<void> _generateContentTextInput(final GoogleAIClient client) async {
  final res = await client.generateContent(
    modelId: 'gemini-pro',
    request: const GenerateContentRequest(
      contents: [
        Content(
          parts: [
            Part(text: 'Write a story about a magic backpack.'),
          ],
        ),
      ],
      generationConfig: GenerationConfig(
        temperature: 0.8,
      ),
    ),
  );
  print(res.candidates?.first.content?.parts?.first.text);
  // In a quaint little town nestled amidst rolling hills, there lived a...
}

Future<void> _generateContentTextAndImageInput(
  final GoogleAIClient client,
) async {
  final res = await client.generateContent(
    modelId: 'gemini-pro-vision',
    request: GenerateContentRequest(
      contents: [
        Content(
          parts: [
            const Part(text: 'What is this picture?'),
            Part(
              inlineData: Blob(
                mimeType: 'image/png',
                data: base64.encode(
                  await File('./test/assets/1.png').readAsBytes(),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
  print(res.candidates?.first.content?.parts?.first.text);
  // The picture shows some scones with blueberries and flowers...
}

Future<void> _generateContentMultiTurnConversations(
  final GoogleAIClient client,
) async {
  final res = await client.generateContent(
    modelId: 'gemini-pro',
    request: const GenerateContentRequest(
      contents: [
        Content(
          role: 'user',
          parts: [
            Part(
              text: 'Write the first line of a story about a magic backpack.',
            ),
          ],
        ),
        Content(
          role: 'model',
          parts: [
            Part(
              text:
                  'In the bustling city of Meadow brook, lived a young girl named Sophie. '
                  'She was a bright and curious soul with an imaginative mind.',
            ),
          ],
        ),
        Content(
          role: 'user',
          parts: [
            Part(
              text: 'Can you set it in a quiet village in 1600s France?',
            ),
          ],
        ),
      ],
    ),
  );
  print(res.candidates?.first.content?.parts?.first.text);
  // In the heart of a tranquil village nestled amidst the rolling hills of 17th century France...
}

Future<void> _countTokens(final GoogleAIClient client) async {
  final res = await client.countTokens(
    modelId: 'gemini-pro',
    request: const CountTokensRequest(
      contents: [
        Content(
          parts: [
            Part(
              text: 'Write a story about a magic backpack.',
            ),
          ],
        ),
      ],
    ),
  );
  print(res.totalTokens);
  // 8
}

Future<void> _embedContent(final GoogleAIClient client) async {
  final res = await client.embedContent(
    modelId: 'embedding-001',
    request: const EmbedContentRequest(
      content: Content(
        parts: [
          Part(text: 'Write a story about a magic backpack.'),
        ],
      ),
    ),
  );
  print(res.embedding?.values);
  // [0.008624583, -0.030451821, -0.042496547, ...]
}

Future<void> _listModels(final GoogleAIClient client) async {
  final res = await client.listModels();
  print(res.models);
  // [Model(name: models/gemini-pro, displayName: Gemini Pro, description: The best model...
}

Future<void> _getModel(final GoogleAIClient client) async {
  final res = await client.getModel(modelId: 'gemini-pro');
  print(res);
  // Model(name: models/gemini-pro, displayName: Gemini Pro, description: The best model...
}
