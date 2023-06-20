import 'package:cross_file/cross_file.dart';

import '../models/models.dart';
import 'base.dart';

/// {@template text_loader}
/// A document loader that loads a [Document] from a text file.
/// {@endtemplate}
class TextLoader extends BaseDocumentLoader {
  /// {@macro text_loader}
  const TextLoader(this.path);

  final String path;

  @override
  Stream<Document> lazyLoad() async* {
    final file = XFile(path);

    final fileName = file.name;
    final fileSize = await file.length();
    final fileLastModified = await file.lastModified();
    final fileContent = await file.readAsString();

    final doc = Document(
      pageContent: fileContent,
      metadata: {
        'path': path,
        'name': fileName,
        'size': fileSize,
        'lastModified': fileLastModified,
      },
    );
    yield doc;
  }
}
