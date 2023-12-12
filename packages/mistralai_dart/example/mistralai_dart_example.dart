// ignore_for_file: avoid_print
import 'dart:io';

import 'package:mistralai_dart/mistralai_dart.dart';

Future<void> main() async {
  final client = MistralAIClient(
    apiKey: Platform.environment['MISTRAL_API_KEY'],
  );

  // Chat Completions
  await _createChatCompletion(client);
  await _createChatCompletionStream(client);

  // Embeddings
  await _createEmbedding(client);

  // Models
  await _listModels(client);

  client.endSession();
}

Future<void> _createChatCompletion(final MistralAIClient client) async {
  final res = await client.createChatCompletion(
    request: const ChatCompletionRequest(
      model: ChatCompletionModel.model(ChatCompletionModels.mistralMedium),
      temperature: 0,
      messages: [
        ChatCompletionMessage(
          role: ChatCompletionMessageRole.user,
          content: 'Why is the sky blue?',
        ),
      ],
    ),
  );
  print(res.choices.first.message?.content);
  // The sky appears blue due to a phenomenon called Rayleigh scattering...
}

Future<void> _createChatCompletionStream(final MistralAIClient client) async {
  final stream = client.createChatCompletionStream(
    request: const ChatCompletionRequest(
      model: ChatCompletionModel.model(ChatCompletionModels.mistralMedium),
      temperature: 0,
      messages: [
        ChatCompletionMessage(
          role: ChatCompletionMessageRole.user,
          content: 'Why is the sky blue?',
        ),
      ],
    ),
  );
  String text = '';
  await for (final res in stream) {
    text += res.choices.first.delta.content?.trim() ?? '';
  }
  print(text);
  // The sky appears blue due to a phenomenon called Rayleigh scattering...
}

Future<void> _createEmbedding(final MistralAIClient client) async {
  final generated = await client.createEmbedding(
    request: const EmbeddingRequest(
      model: EmbeddingModel.model(EmbeddingModels.mistralEmbed),
      input: ['Why is the sky blue?'],
    ),
  );
  print(generated.data.first.embedding);
  // [-0.0182342529296875, 0.03594970703125, 0.0286102294921875, ...]
}

Future<void> _listModels(final MistralAIClient client) async {
  final res = await client.listModels();
  print(res.data);
  // [Model(id: mistral-medium, object: model, created: 1702396611, ownedBy: mistralai), ...]
}
