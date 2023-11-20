// ignore_for_file: avoid_print
// import 'package:http/http.dart';
import 'package:ollama_dart/ollama_dart.dart';

void main() async {
  final client = OllamaClient();

  // final GenerateResponse response = await client.postGenerate(
  //   request: const GenerateRequest(
  //     model: 'mistral:latest',
  //     prompt: 'Why is the sky blue?',
  //     stream: false,
  //   ),
  // );
  // print(response);

  // final Stream<GenerateResponse> responseStreamed = client.generateStream(
  //   request: const GenerateRequest(
  //     model: 'mistral:latest',
  //     prompt: 'Why is the sky blue?',
  //   ),
  // );

  // String generatedText = '';
  // final DateTime start = DateTime.now();
  // responseStreamed.listen((final GenerateResponse generated) {
  //   if (generated.createdAt?.isNotEmpty ?? false) {
  //     print(
  //       '🤖 thinking: ${DateTime.parse(generated.createdAt ?? '').difference(start).inMilliseconds / 1000} seconds elapsed',
  //     );
  //   }

  //   if (generated.done ?? false) {
  //     print(generatedText);
  //   } else {
  //     generatedText += generated.response ?? '';
  //   }
  // });

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

  // await client.deleteModel(
  //   request: DeleteRequest(name: copyName),
  // );

  // final Response deleteResponse = await client.deleteModelWithResponse(
  //   request: const DeleteRequest(name: copyName),
  // );
  // print(deleteResponse.statusCode);

  // final TagResponse tags = await client.listTags();
  // print(tags.models);

  // final ShowResponse response = await client.showModel(
  //   request: const ShowRequest(name: modelName),
  // );

  // print(response.toMap());
}
