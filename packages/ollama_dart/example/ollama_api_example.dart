// ignore_for_file: avoid_print
import 'package:ollama_dart/ollama_dart.dart';

Future<void> main() async {
  final client = OllamaClient();

  await _generateCompletion(client);
  await _generateCompletionStream(client);
  await _generateEmbedding(client);

  client.endSession();
}

Future<void> _generateCompletion(final OllamaClient client) async {
  final generated = await client.generateCompletion(
    request: const GenerateCompletionRequest(
      model: 'mistral:latest',
      prompt: 'Why is the sky blue?',
    ),
  );
  print(generated.response);
}

Future<void> _generateCompletionStream(final OllamaClient client) async {
  final stream = client.generateCompletionStream(
    request: const GenerateCompletionRequest(
      model: 'mistral:latest',
      prompt: 'Why is the sky blue?',
    ),
  );
  String text = '';
  await for (final res in stream) {
    text += res.response?.trim() ?? '';
  }
  print(text);
}

Future<void> _generateEmbedding(final OllamaClient client) async {
  final generated = await client.generateEmbedding(
    request: const GenerateEmbeddingRequest(
      model: 'mistral:latest',
      prompt: 'Why is the sky blue?',
    ),
  );
  print(generated.embedding);
}

// TODO update
Future<void> _models(final OllamaClient client) async {
  ///
  /// PULL A MODEL
  ///

  // const String modelName = 'codellama:13b';

  // Stream<PullResponse> response =
  //     client.pullModelStream(request: PullRequest(name: modelName));

  // response.listen((PullResponse response) {
  //   if (response.status != null && response == PullResponseStatus.success) {
  //     print('finished pulling model: $modelName!!');
  //   } else {
  //     int completed = response.completed ?? 0;
  //     int total = response.total ?? 1;
  //     double finished = (completed.toDouble() / total.toDouble()) * 100;
  //     print(
  //       "$modelName: (${response.status ?? 'downloading'}) ${finished.toInt()}% [${"|" * finished.toInt()}] ${(total / 1024e3.toDouble()).toStringAsFixed(2)} GB",
  //     );
  //   }
  // });

  ///
  /// CREATE A NEW MODEL
  ///

  // const String createModelName = 'supermario';
  // client
  //     .createModelStream(
  //   request: const CreateRequest(
  //     name: createModelName,
  //     modelfile:
  //         'FROM mistral:latest\nSYSTEM You are mario from Super Mario Bros.',
  //   ),
  // )
  //     .listen((final CreateResponse generated) {
  //   print(
  //     '🤖 creating model: $createModelName (${generated.status ?? 'processing'})',
  //   );
  // });

  // const String modelName = 'mario';
  // const String modelfile =
  //     'FROM mistral:latest\nSYSTEM You are mario from Super Mario Bros.';

  // final CreateResponse response = await client.create(
  //   request: const CreateRequest(
  //     name: modelName,
  //     modelfile: modelfile,
  //     stream: false,
  //   ),
  // );
  // print(response.status);

  ///
  /// COPY A MODEL
  ///

  // const String copyName = '$modelName-backup2';

  // await client.copyModel(
  //   request: CopyRequest(source: modelName, destination: copyName),
  // );

  // final Response response = await client.copyModelWithResponse(
  //   request: const CopyRequest(
  //     source: modelName,
  //     destination: copyName,
  //   ),
  // );

  // print(response.statusCode);

  ///
  /// DELETE A MODEL
  ///
  ///
  // await client.deleteModel(
  //   request: DeleteRequest(name: copyName),
  // );

  // final Response deleteResponse = await client.deleteModelWithResponse(
  //   request: const DeleteRequest(name: copyName),
  // );
  // print(deleteResponse.statusCode);

  ///
  /// LIST LOCAL MODELS
  ///

  // final TagResponse tags = await client.listTags();
  // print(tags.models);

  // final ShowResponse response = await client.showModel(
  //   request: const ShowRequest(name: modelName),
  // );

  // print(response.toMap());
}
