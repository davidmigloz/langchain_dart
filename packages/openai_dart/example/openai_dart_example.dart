// ignore_for_file: avoid_print
import 'dart:async';
import 'dart:io';

import 'package:openai_dart/openai_dart.dart';

Future<void> main() async {
  final client = OpenAIClient(apiKey: Platform.environment['OPENAI_API_KEY']);

  await _chatCompletions(client);
  await _completions(client);
  await _embeddings(client);
  await _fineTuning(client);
  await _images(client);
  await _models(client);
  await _moderations(client);

  client.endSession();
}

Future<void> _chatCompletions(final OpenAIClient client) async {
  final res = await client.createChatCompletion(
    request: const CreateChatCompletionRequest(
      model: ChatCompletionModel.modelId('gpt-4'),
      messages: [
        ChatCompletionMessage.system(
          content: 'You are a helpful assistant.',
        ),
        ChatCompletionMessage.user(
          content: ChatCompletionUserMessageContent.string('Hello!'),
        ),
      ],
      temperature: 0,
    ),
  );
  print(res.choices.first.message.content);
}

Future<void> _completions(final OpenAIClient client) async {
  final res = await client.createCompletion(
    request: const CreateCompletionRequest(
      model: CompletionModel.modelId('gpt-3.5-turbo-instruct'),
      prompt: CompletionPrompt.string('Say this is a test'),
      maxTokens: 7,
      temperature: 0,
    ),
  );
  print(res.choices.first.text);
}

Future<void> _embeddings(final OpenAIClient client) async {
  final res = await client.createEmbedding(
    request: const CreateEmbeddingRequest(
      model: EmbeddingModel.modelId('text-embedding-3-small'),
      input: EmbeddingInput.string('The food was delicious and the waiter...'),
    ),
  );
  print(res.data.first.embeddingVector);
}

Future<void> _fineTuning(final OpenAIClient client) async {
  final res = await client.listPaginatedFineTuningJobs();
  print(res.data.first.id);
}

Future<void> _images(final OpenAIClient client) async {
  final res = await client.createImage(
    request: const CreateImageRequest(
      model: CreateImageRequestModel.model(ImageModels.dallE3),
      prompt: 'A cute baby sea otter',
      quality: ImageQuality.hd,
      size: ImageSize.v1024x1792,
      style: ImageStyle.natural,
    ),
  );
  print(res.data.first.url);
}

Future<void> _models(final OpenAIClient client) async {
  final res1 = await client.listModels();
  print(res1.data.first.id);
  final res2 = await client.retrieveModel(model: 'gpt-4');
  print(res2.ownedBy);
}

Future<void> _moderations(final OpenAIClient client) async {
  final res = await client.createModeration(
    request: const CreateModerationRequest(
      input: ModerationInput.string('I want to kill them.'),
    ),
  );
  print(res.results.first.categories.violence);
  print(res.results.first.categoryScores.violence);
}
