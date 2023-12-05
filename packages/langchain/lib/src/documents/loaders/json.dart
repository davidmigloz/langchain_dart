import 'dart:convert';

import 'package:cross_file/cross_file.dart';
import 'package:json_path/json_path.dart';

import '../models/models.dart';
import 'base.dart';

/// {@template json_loader}
/// A document loader that loads a [Document]s from a JSON file.
///
/// This loader reads a JSON file located at [filePath] and extracts
/// [Document]s based on the provided JSON path schema [jpSchema].
/// Each [Document] represents a matching JSON object or value found in the
/// file.
///
/// If you want to customize the metadata for each [Document], you can provide
/// a [metadataBuilder] function that takes in the JSON object extracted by the
/// [jpSchema] and the default file metadata and returns a map of the updated
/// metadata.
///
/// Example usage:
/// ```dart
/// final loader = JsonLoader(
///   'path/to/file.json',
///   jpSchema: '$..yourJsonPath',
/// );
/// final documents = await loader.load();
/// ```
///
/// Documentation related to JSON path schemas:
/// - https://pub.dev/packages/json_path
/// - https://goessner.net/articles/JsonPath
/// {@endtemplate}
class JsonLoader extends BaseDocumentLoader {
  /// {@macro json_loader}
  const JsonLoader(
    this.filePath, {
    required this.jpSchema,
    this.metadataBuilder,
  });

  /// The path to the JSON file.
  final String filePath;

  /// The JSON path schema to use to extract the data or text from the JSON.
  final String jpSchema;

  /// A function that takes in the JSON object extracted by the [jpSchema] and
  /// the default file metadata and returns a map of the updated metadata.
  /// If this function is not provided, the default file metadata will be used.
  final Map<String, dynamic> Function(
    Object? matchValue,
    Map<String, dynamic> fileMetadata,
  )? metadataBuilder;

  @override
  Stream<Document> lazyLoad() async* {
    final file = XFile(filePath);

    final fileName = file.name;
    final fileSize = await file.length();
    final fileLastModified = await file.lastModified();
    final basePath = JsonPath(jpSchema);
    final fileMetadata = <String, dynamic>{
      'source': filePath,
      'name': fileName,
      'size': fileSize,
      'lastModified': fileLastModified.millisecondsSinceEpoch,
    };

    final fileContent = await file.readAsString();
    final jsonData = json.decode(fileContent);

    for (final value in basePath.readValues(jsonData)) {
      final doc = Document(
        pageContent: value.toString(),
        metadata: metadataBuilder?.call(value, fileMetadata) ?? fileMetadata,
      );
      yield doc;
    }
  }
}
