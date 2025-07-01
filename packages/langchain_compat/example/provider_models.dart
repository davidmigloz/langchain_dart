// ignore_for_file: avoid_print

import 'dart:io';

import 'package:langchain_compat/providers.dart';

Future<void> main() async {
  var totalProviders = 0;
  var totalModels = 0;
  for (final provider in Provider.all) {
    totalProviders++;
    print('\n# ${provider.displayName} (${provider.name})');
    final models = await provider.listModels();
    final modelList = models.toList();
    totalModels += modelList.length;
    for (final model in modelList) {
      final kinds = model.kinds.map((k) => k.name).join(', ');
      print(
        '- ${provider.name}:${model.name} '
        '${model.displayName != null ? '"${model.displayName}" ' : ''}'
        '($kinds) ',
      );
      // if (model.description != null) {
      //   print('    ${model.description}');
      // }
      // if (model.extra.isNotEmpty) {
      //   print('    extra:');
      //   _printExtra(model.extra, indent: 6);
      // }
    }
    print('  (${modelList.length} models)');
  }
  print('\nTotal providers: $totalProviders');
  print('Total models: $totalModels');
}

// ignore: unused_element
void _printExtra(Map<String, dynamic> extra, {int indent = 0}) {
  final pad = ' ' * indent;
  extra.forEach((key, value) {
    if (value == null) return; // Skip null values
    if (value is Map<String, dynamic>) {
      print('$pad$key:');
      _printExtra(value, indent: indent + 2);
    } else if (value is List) {
      print('$pad$key: [');
      for (final item in value) {
        if (item is Map<String, dynamic>) {
          _printExtra(item, indent: indent + 4);
        } else {
          print('${' ' * (indent + 4)}$item');
        }
      }
      print('$pad]');
    } else {
      print('$pad$key: $value');
    }
  });
  exit(0);
}
