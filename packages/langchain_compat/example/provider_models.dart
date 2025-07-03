// ignore_for_file: avoid_print

import 'dart:io';

import 'package:langchain_compat/src/chat/chat_providers/chat_providers.dart';

Future<void> main() async {
  var totalProviders = 0;
  var totalChatModels = 0;
  var totalEmbeddingModels = 0;
  var totalOtherModels = 0;

  for (final provider in ChatProvider.all) {
    totalProviders++;
    print('\n# ${provider.displayName} (${provider.name})');
    final models = await provider.listModels();
    final modelList = models.toList();

    // Categorize models by type
    final chatModels = modelList
        .where((m) => m.kinds.contains(ModelKind.chat))
        .toList();
    final embeddingModels = modelList
        .where((m) => m.kinds.contains(ModelKind.embedding))
        .toList();
    final otherModels = modelList
        .where(
          (m) =>
              !m.kinds.contains(ModelKind.chat) &&
              !m.kinds.contains(ModelKind.embedding),
        )
        .toList();

    totalChatModels += chatModels.length;
    totalEmbeddingModels += embeddingModels.length;
    totalOtherModels += otherModels.length;

    // Print chat models
    if (chatModels.isNotEmpty) {
      print('\n## Chat Models (${chatModels.length})');
      for (final model in chatModels) {
        final kinds = model.kinds.map((k) => k.name).join(', ');
        print(
          '- ${provider.name}:${model.name} '
          '${model.displayName != null ? '"${model.displayName}" ' : ''}'
          '($kinds)',
        );
      }
    }

    // Print embedding models
    if (embeddingModels.isNotEmpty) {
      print('\n## Embedding Models (${embeddingModels.length})');
      for (final model in embeddingModels) {
        final kinds = model.kinds.map((k) => k.name).join(', ');
        print(
          '- ${provider.name}:${model.name} '
          '${model.displayName != null ? '"${model.displayName}" ' : ''}'
          '($kinds)',
        );
      }
    }

    // Print other models
    if (otherModels.isNotEmpty) {
      print('\n## Other Models (${otherModels.length})');
      for (final model in otherModels) {
        final kinds = model.kinds.map((k) => k.name).join(', ');
        print(
          '- ${provider.name}:${model.name} '
          '${model.displayName != null ? '"${model.displayName}" ' : ''}'
          '($kinds)',
        );
      }
    }

    print('\n  Total: ${modelList.length} models');
  }

  print('\n=== Summary ===');
  print('Total providers: $totalProviders');
  print('Total chat models: $totalChatModels');
  print('Total embedding models: $totalEmbeddingModels');
  print('Total other models: $totalOtherModels');
  print(
    'Grand total: '
    '${totalChatModels + totalEmbeddingModels + totalOtherModels} models',
  );
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
