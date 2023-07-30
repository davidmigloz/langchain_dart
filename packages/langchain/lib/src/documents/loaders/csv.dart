import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';

import '../models/models.dart';
import 'base.dart';

/// A document loader for loading documents from CSV files.
///
/// This class extends the [BaseDocumentLoader] and is used to load documents from
/// CSV files. It reads the CSV file specified by the `filePath` and transforms each
/// row into a [Document] object, which represents a single document with metadata
/// and page content.
class CsvLoader extends BaseDocumentLoader {
  /// Creates a new instance of [CsvLoader].
  ///
  /// The `filePath` parameter is required and represents the file path of the CSV file
  /// to be loaded. The `delimiter`, `quoteChar`, and `eol` parameters are optional and
  /// can be customized to match the CSV file's formatting. The `fieldNames` parameter allows
  /// specifying the column names in the CSV file, and `metadataBuilder` allows building custom
  /// metadata for each document. If not provided, the default metadata is used.
  CsvLoader(
    this.filePath, {
    this.sourceColumn,
    this.useCols,
    this.delimiter = ',',
    this.quoteChar = '"',
    this.eol = '\n',
    this.fieldNames,
    // this.metadataBuilder,
  });

  /// The file path of the CSV file to be loaded.
  ///
  /// This property holds the file path of the CSV file from which the documents
  /// will be loaded. The loader reads the CSV file and processes each row to
  /// create [Document] objects.
  final String filePath;

  /// Use the sourceColumn argument to specify a source for the document created from each row. Otherwise file_path will be used as the source for all documents created from the CSV file.
  ///
  /// This is useful when using documents loaded from CSV files for chains that answer questions using sources.
  final String? sourceColumn;

  /// Use the useCols argument to specify which columns to use from the CSV file.
  final List<String>? useCols;

  /// The delimiter used to separate fields in the CSV file.
  ///
  /// This property specifies the delimiter used in the CSV file to separate fields.
  /// By default, it is set to a comma (`,`), which is the most commonly used delimiter
  /// for CSV files. You can change this value to match the delimiter used in your CSV file.
  final String delimiter;

  /// The character used to quote fields containing special characters.
  ///
  /// This property holds the quote character used to enclose fields containing special
  /// characters like the delimiter itself. By default, it is set to double quotation marks
  /// (`"`), which is the standard quote character for CSV files. You can change this value
  /// to match the quote character used in your CSV file.
  final String quoteChar;

  /// The end-of-line character used to separate rows in the CSV file.
  ///
  /// This property specifies the end-of-line (EOL) character used to separate rows in the CSV
  /// file. By default, it is set to the newline character (`\n`), which is commonly used as
  /// the EOL character in CSV files. You can change this value to match the EOL character
  /// used in your CSV file.
  final String eol;

  /// The list of field names for the CSV file.
  ///
  /// This property holds the list of field names that define the columns in the CSV file.
  /// If provided, it is used to create a space-separated `pageContent` for each document,
  /// combining the values of the fields specified in `fieldNames`. If not provided, each
  /// row in the CSV file is treated as a separate `pageContent`.
  List<String>? fieldNames;

  /// A function to build custom metadata for each document.
  ///
  /// This property holds a function that allows building custom metadata for each document
  /// based on the CSV row data and the metadata base. The function takes two parameters:
  /// `line`, which is a map containing the field names and data for the CSV row, and
  /// `fileMetadata`, which is a map containing base metadata for all documents in the CSV file.
  /// If not provided, the default metadata is used, including the file path, file name, file size,
  /// and last modified date.
  // final Map<String, dynamic> Function(
  //   Map<String, dynamic> line,
  //   Map<String, dynamic> fileMetadata,
  // )? metadataBuilder;

  /// Loads documents from the CSV file and returns a lazy-loading stream.
  ///
  /// This method overrides the `lazyLoad` method of the [BaseDocumentLoader] class. It reads
  /// the CSV file specified in `filePath`, processes each row, and yields a stream of [Document]
  /// objects representing the documents in the CSV file. Each document contains the metadata and
  /// page content based on the `fieldNames` and `metadataBuilder`, if provided.
  @override
  Stream<Document> lazyLoad() async* {
    final file = File(filePath);

    final csvLines = await file
        .openRead()
        .transform(utf8.decoder)
        .transform(
          CsvToListConverter(
            fieldDelimiter: delimiter,
            textDelimiter: quoteChar,
            eol: eol,
          ),
        )
        .toList();

    var firstRow = true;

    final fieldNameAndPosition = <String, int>{};

    for (final line in csvLines) {
      if (firstRow) {
        final overrideFieldNames = line.length == fieldNames?.length;

        final overrideCols = useCols != null && useCols!.isNotEmpty;

        if (fieldNames != null && !overrideFieldNames) {
          throw Exception(
            'The length of the line in the csv file is not equal to the length of the fieldNames.',
          );
        }

        // Extract field names and their positions
        for (var i = 0; i < line.length; i++) {
          final fieldName =
              overrideFieldNames ? fieldNames![i] : line[i] as String;

          if (!overrideCols) {
            fieldNameAndPosition[fieldName] = i;

            continue;
          }

          if (useCols!.contains(line[i] as String)) {
            fieldNameAndPosition[fieldName] = i;
          }
        }

        if (useCols != null && useCols!.length != fieldNameAndPosition.length) {
          throw Exception(
            'Not all columns listed in useCols were found in the csv file.',
          );
        }

        firstRow = false;
      } else {
        final metadata = <String, dynamic>{
          'source': filePath,
        };

        if (sourceColumn != null &&
            fieldNameAndPosition[sourceColumn!] != null) {
          metadata['source'] = line[fieldNameAndPosition[sourceColumn!]!];
        }

        final doc = Document(
          pageContent: fieldNameAndPosition.keys
              .map(
                (final name) => '$name: ${line[fieldNameAndPosition[name]!]}',
              )
              .join('\n'),
          metadata: metadata,
        );

        yield doc;
      }
    }
  }
}
