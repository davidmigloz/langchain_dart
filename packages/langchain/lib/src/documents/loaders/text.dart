import 'package:cross_file/cross_file.dart';

import '../models/models.dart';
import 'base.dart';

/// {@template text_loader}
/// A document loader that loads a [Document] from a text file.
///
/// Example usage:
/// ```dart
/// final loader = TextLoader('path/to/file.txt');
/// final documents = await loader.load();
/// ```
/// {@endtemplate}
class TextLoader extends BaseDocumentLoader {
  /// {@macro text_loader}
  const TextLoader(this.filePath);

  /// The path to the text file.
  final String filePath;

  @override
  Stream<Document> lazyLoad() async* {
    final file = XFile(filePath);

    final fileName = file.name;
    final fileSize = await file.length();
    final fileLastModified = await file.lastModified();
    final fileContent = await file.readAsString();

    final doc = Document(
      pageContent: fileContent,
      metadata: {
        'source': filePath,
        'name': fileName,
        'size': fileSize,
        'lastModified': fileLastModified.millisecondsSinceEpoch,
      },
    );
    yield doc;
  }
}
