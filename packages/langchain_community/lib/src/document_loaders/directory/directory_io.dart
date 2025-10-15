import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:cross_file/cross_file.dart' show XFile;
import 'package:glob/glob.dart';
import 'package:langchain_core/document_loaders.dart';
import 'package:langchain_core/documents.dart';
import 'package:path/path.dart' as path;

import '../csv.dart';
import '../json.dart';
import '../text.dart';

/// {@template directory_loader}
/// A versatile document loader that loads [Document]s from a directory.
///
/// This loader can:
/// - Load files from a specified directory
/// - Apply glob patterns to filter files
/// - Recursively search subdirectories
/// - Exclude specific files or patterns
/// - Use custom loaders for different file types
/// - Sample files randomly or by a specific count
/// - Build custom metadata for loaded documents
///
/// ## Default Supported File Types
///
/// By default, the DirectoryLoader supports the following file types:
/// - `.txt`: Text files (loaded using [TextLoader])
///   - Loads the entire file content as a single document
/// - `.json`: JSON files (loaded using [JsonLoader] with root schema)
///   - Extracts all JSON objects or values at the root level
/// - `.csv` and `.tsv`: CSV/TSV files (loaded using [CsvLoader])
///   - Converts each row into a separate document
///
/// Example usage:
/// ```dart
/// // Load all text and JSON files from a directory recursively
/// final loader = DirectoryLoader(
///   '/path/to/documents',
///   glob: '*.{txt,json}',
///   recursive: true,
/// );
/// final documents = await loader.load();
///
/// // Load a random sample of 10 CSV files, excluding hidden files
/// final sampleLoader = DirectoryLoader(
///   '/path/to/csvs',
///   glob: '*.csv',
///   loadHidden: false,
///   sampleSize: 10,
///   randomizeSample: true,
/// );
/// final sampleDocuments = await sampleLoader.load();
/// ```
///
/// The loader supports customization through various parameters:
/// - [filePath]: The directory path to load documents from
/// - [glob]: Glob pattern to match files (defaults to all files)
/// - [recursive]: Whether to search recursively in subdirectories
/// - [exclude]: Patterns to exclude from loading
/// - [loaderMap]: Map of file extensions to specific loaders
/// - [loadHidden]: Whether to load hidden files
/// - [sampleSize]: Maximum number of files to load
/// - [randomizeSample]: Whether to randomize the file sample
/// - [sampleSeed]: Seed for reproducible random sampling
/// - [metadataBuilder]: Custom metadata building function
///
/// You can extend the default loader support by providing a custom [loaderMap].
/// {@endtemplate}
class DirectoryLoader extends BaseDocumentLoader {
  /// {@macro directory_loader}
  const DirectoryLoader(
    this.filePath, {
    this.glob = '*',
    this.recursive = true,
    this.exclude = const [],
    this.loaderMap = const {},
    this.loadHidden = false,
    this.sampleSize = 0,
    this.randomizeSample = false,
    this.sampleSeed,
    this.metadataBuilder,
  });

  /// The path to the directory to load documents from.
  final String filePath;

  /// Glob pattern to match files.
  /// Use '*' to match all files.
  final String glob;

  /// Whether to search recursively in subdirectories.
  final bool recursive;

  /// Patterns to exclude from loading.
  final List<String> exclude;

  /// Map of file extensions to specific loaders.
  ///
  /// This map allows customization of how different file types are loaded:
  /// - Keys are file extensions (including the dot, e.g., '.txt', '.json').
  /// - Values are functions that create a [BaseDocumentLoader] for a given
  ///   file path.
  ///
  /// If not provided, [defaultLoaderMap] will be used, which supports:
  /// - `.txt`: [TextLoader]
  /// - `.json`: [JsonLoader] (with root schema)
  /// - `.csv` and `.tsv`: [CsvLoader]
  ///
  /// Example of extending or customizing loaders:
  /// ```dart
  /// final loader = DirectoryLoader(
  ///   '/path/to/docs',
  ///   loaderMap: {
  ///     // Add a custom loader for XML files
  ///     '.xml': (path) => CustomXmlLoader(path),
  ///
  ///     // Override default JSON loader with a custom implementation
  ///     '.json': (path) => CustomJsonLoader(path),
  ///
  ///     // Combine with default loaders
  ///     ...DirectoryLoader.defaultLoaderMap,
  ///   },
  /// );
  /// ```
  ///
  /// If no loader is found for a file type, [TextLoader] will be used as a
  /// fallback.
  final Map<String, BaseDocumentLoader Function(String)> loaderMap;

  /// Whether to load hidden files (starting with '.').
  final bool loadHidden;

  /// Maximum number of files to load.
  /// Use 0 to load all files.
  final int sampleSize;

  /// Whether to randomize the sample of files.
  final bool randomizeSample;

  /// Seed for random sampling to ensure reproducibility.
  final int? sampleSeed;

  /// Optional function to build custom metadata for each document.
  final Map<String, dynamic> Function(
    XFile file,
    Map<String, dynamic> defaultMetadata,
  )?
  metadataBuilder;

  /// Default loader map with common file type loaders.
  ///
  /// Provides out-of-the-box support for:
  /// - Plain text files (`.txt`)
  /// - JSON files (`.json`) - uses root schema
  /// - CSV and TSV files (`.csv`, `.tsv`)
  ///
  /// Can be extended or overridden when creating a [DirectoryLoader].
  static Map<String, BaseDocumentLoader Function(String)> defaultLoaderMap = {
    '.txt': TextLoader.new,
    '.json': (path) => JsonLoader(path, jpSchema: r'$'),
    '.csv': CsvLoader.new,
    '.tsv': CsvLoader.new,
  };

  bool _shouldLoadFile(File file) {
    if (!loadHidden && path.basename(file.path).startsWith('.')) {
      return false;
    }

    final globMatcher = Glob(glob);
    if (!globMatcher.matches(path.basename(file.path))) {
      return false;
    }

    for (final excludePattern in exclude) {
      if (Glob(excludePattern).matches(path.basename(file.path))) {
        return false;
      }
    }

    return true;
  }

  Future<Map<String, dynamic>> _buildDefaultMetadata(XFile file) async {
    return {
      'source': file.path,
      'name': path.basename(file.path),
      'extension': path.extension(file.path),
      'size': await file.length(),
      'lastModified': (await file.lastModified()).millisecondsSinceEpoch,
    };
  }

  @override
  Stream<Document> lazyLoad() async* {
    if (glob.isEmpty) {
      throw ArgumentError('Glob pattern must not be empty');
    }

    final directory = Directory(filePath);

    var files = directory
        .listSync(recursive: recursive)
        .whereType<File>()
        .where(_shouldLoadFile)
        .map((e) => XFile(e.path));

    if (sampleSize > 0) {
      if (randomizeSample) {
        final seed = sampleSeed ?? DateTime.now().millisecondsSinceEpoch;
        files = files.toList(growable: false)..shuffle(Random(seed));
      }
      files = files.take(sampleSize);
    }

    for (final file in files) {
      final ext = path.extension(file.path).toLowerCase();

      final loaders = loaderMap.isNotEmpty ? loaderMap : defaultLoaderMap;
      final loader = loaders[ext]?.call(file.path) ?? TextLoader(file.path);

      final defaultMetadata = await _buildDefaultMetadata(file);
      final metadata =
          metadataBuilder?.call(file, defaultMetadata) ?? defaultMetadata;

      await for (final doc in loader.lazyLoad()) {
        final finalDoc = Document(
          pageContent: doc.pageContent,
          metadata: doc.metadata['source'] == file.path
              ? metadata
              : {...metadata, ...doc.metadata},
        );
        yield finalDoc;
      }
    }
  }
}
