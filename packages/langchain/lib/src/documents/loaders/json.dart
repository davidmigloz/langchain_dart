import 'dart:convert';

import 'package:cross_file/cross_file.dart';
import 'package:json_path/json_path.dart';

import '../models/models.dart';
import 'base.dart';

/// {@template json_loader}
/// A document loader that loads a [Document]s from a JSON file.
///
/// This loader reads a JSON file located at [filePath] and extracts [Document]s based on the provided JSON path schema [jpSchema].
/// Each [Document] represents a matching JSON object or value found in the file.
///
/// The [JsonLoader] supports optional features such as reading specific content using [contentKey], parsing JSON lines with [jsonLines],
/// and providing additional metadata using the [metadataFunc] function.
///
/// Example usage:
/// ```dart
/// final loader = JsonLoader(filePath: 'path/to/file.json', jpSchema: '$..yourJsonPath');
/// final documents = await loader.lazyLoad().toList();
/// ```
///
/// Documentation that gives an explanation of JSON path expressions can be found here:
/// https://goessner.net/articles/JsonPath/index.html#e2
/// {@endtemplate}
class JsonLoader extends BaseDocumentLoader {
  final String filePath;

  final String jpSchema;

  final String? contentKey;

  final bool jsonLines;

  final Map<String, dynamic> Function(Object)? metadataFunc;

  const JsonLoader({
    required this.filePath,
    required this.jpSchema,
    this.contentKey,
    this.jsonLines = false,
    this.metadataFunc,
  });

  @override
  Stream<Document> lazyLoad() async* {
    final file = XFile(filePath);

    final fileName = file.name;

    final fileSize = await file.length();

    final fileLastModified = await file.lastModified();

    final fileContent = await file.readAsString();

    final jsonData = json.decode(fileContent);

    final basePath = JsonPath(jpSchema);

    final metadataBase = <String, dynamic>{
      'source': '$filePath/$fileName',
      'path': filePath,
      'name': fileName,
      'size': fileSize,
      'lastModified': fileLastModified,
    };

    for (final match in basePath.read(jsonData)) {
      final baseJson = match.value is String
          ? '${match.value}'
          : match.value ?? <String, dynamic>{};

      String? pageContent;

      final metadata = {...metadataBase};

      if (contentKey != null) {
        final contentPath = JsonPath('\$$contentKey');

        contentPath.read(baseJson).forEach((final match) {
          pageContent = match.value.toString();
        });
      }

      if (metadataFunc != null) {
        metadata.addAll(metadataFunc!(baseJson));
      }

      final doc = Document(
        pageContent: pageContent ?? baseJson.toString(),
        metadata: metadata,
      );

      yield doc;
    }
  }
}
