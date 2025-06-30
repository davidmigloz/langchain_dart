// ignore_for_file: avoid_print

import 'package:langchain_compat/src/providers.dart';

Future<void> main() async {
  var totalProviders = 0;
  var totalModels = 0;
  for (final provider in Provider.all) {
    totalProviders++;
    print('\n# ${provider.displayName} (${provider.name})');
    try {
      final models = await provider.listModels();
      final modelList = models.toList();
      totalModels += modelList.length;
      if (modelList.isEmpty) {
        print('  (no models found)');
      } else {
        for (final model in modelList) {
          print('  - id: ${model.id}');
          if (model.name != null && model.name != model.id) {
            print('    name: ${model.name}');
          }
          if (model.description != null) {
            print('    desc: ${model.description}');
          }
          if (model.contextWindow != null) {
            print('    contextWindow: ${model.contextWindow}');
          }
        }
        print('  (${modelList.length} models)');
      }
    } on Exception catch (e) {
      print('  Error: $e');
    }
  }
  print('\nTotal providers: $totalProviders');
  print('Total models: $totalModels');
}
