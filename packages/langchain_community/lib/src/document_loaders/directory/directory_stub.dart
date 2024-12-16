// ignore_for_file: public_member_api_docs
import 'dart:async';
import 'dart:io';
import 'package:langchain_core/document_loaders.dart';
import 'package:langchain_core/documents.dart';

// This is a stub class
// DirectoryLoader is not supported on web platform
class DirectoryLoader extends BaseDocumentLoader {
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

  final String filePath;
  final String glob;
  final bool recursive;
  final List<String> exclude;
  final Map<String, BaseDocumentLoader Function(String)> loaderMap;
  final bool loadHidden;
  final int sampleSize;
  final bool randomizeSample;
  final int? sampleSeed;
  final Map<String, dynamic> Function(
    File file,
    Map<String, dynamic> defaultMetadata,
  )? metadataBuilder;
  static Map<String, BaseDocumentLoader Function(String)> defaultLoaderMap = {};

  @override
  Stream<Document> lazyLoad() async* {
    throw UnsupportedError('DirectoryLoader is not supported on web platform.');
  }
}
