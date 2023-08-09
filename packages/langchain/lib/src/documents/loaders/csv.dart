import 'dart:convert';

import 'package:cross_file/cross_file.dart';
import 'package:csv/csv.dart';

import '../models/models.dart';
import 'base.dart';

/// {@template csv_loader}
/// A document loader for loading documents from CSV or TSV files.
///
/// It reads the CSV file specified by [filePath] and transforms each row into
/// a [Document] object.
///
/// You can customize the [fields] that you want to extract or rename them
/// using [fieldsOverride]. The field, text, and line delimiters can also be
/// customized using [fieldDelimiter], [fieldTextDelimiter], [fieldTextEndDelimiter],
/// and [eol].
///
/// The fields are added to the page content in the following format:
/// ```
/// {field1Name}: {field1Value}
/// {field2Name}: {field2Value}
/// ...
/// {fieldNName}: {fieldNValue}
/// ```
///
/// You can specify a [sourceField] to use as the source metadata field for
/// each document. Otherwise, the [filePath] will be used as source.
///
/// For loading TSV files, set the [fieldDelimiter] as `\t`.
///
/// Example:
/// ```dart
/// final loader = CsvLoader('path/to/file.csv');
/// final documents = await loader.load();
/// ```
/// {@endtemplate}
class CsvLoader extends BaseDocumentLoader {
  /// {@macro csv_loader}
  CsvLoader(
    this.filePath, {
    this.fields,
    this.fieldsOverride,
    this.fieldDelimiter = ',',
    this.fieldTextDelimiter = '"',
    this.fieldTextEndDelimiter,
    this.eol = '\n',
    this.sourceField,
    this.metadataBuilder,
  });

  /// The file path of the CSV file to be loaded.
  final String filePath;

  /// Optional field to specify which fields from the row to extract and add to
  /// the page content of the document.
  ///
  /// If not provided, all row fields are extracted.
  /// ```
  final List<String>? fields;

  /// Optional field to override the field names from the CSV file.
  ///
  /// If not provided, the column names from the CSV file are used.
  List<String>? fieldsOverride;

  /// The delimiter used to separate fields in the CSV file.
  ///
  /// By default, it is set to comma (`,`).
  final String fieldDelimiter;

  /// The delimiter which (optionally) surrounds text / fields.
  ///
  /// By default, it is set to double quotation marks (`"`).
  final String fieldTextDelimiter;

  /// Optional end delimiter for text. This allows text to be quoted with
  /// different start / end delimiters: Example:  «abc».
  ///
  /// If null, [fieldTextDelimiter] is used as the end delimiter.
  final String? fieldTextEndDelimiter;

  /// The end-of-line character used to separate rows in the CSV file. The eol
  /// is optional for the last row.
  ///
  /// By default, it is set to the newline character (`\n`).
  final String eol;

  /// Optional field to specify a source for the document created from each
  /// row. Otherwise [filePath] will be used as the source for all documents
  /// created from the CSV file.
  ///
  /// This is useful when using documents loaded from CSV files for chains that
  /// answer questions using sources.
  final String? sourceField;

  /// An optional function to build custom metadata for each document based on
  /// the row content and the default metadata.
  ///
  /// If null, the default row metadata will be used.
  final Map<String, dynamic> Function(
    Map<String, dynamic> row,
    Map<String, dynamic> rowMetadata,
  )? metadataBuilder;

  @override
  Stream<Document> lazyLoad() async* {
    final file = XFile(filePath);

    final csvLinesStream =
        file.openRead().cast<List<int>>().transform(utf8.decoder).transform(
              CsvToListConverter(
                fieldDelimiter: fieldDelimiter,
                textDelimiter: fieldTextDelimiter,
                textEndDelimiter: fieldTextEndDelimiter,
                eol: eol,
              ),
            );

    final fieldsToPositions = <String, int>{};
    final pageContentFields = <String>[];
    await for (final row in csvLinesStream) {
      // Process CSV header
      if (fieldsToPositions.isEmpty) {
        assert(row.isNotEmpty, 'Header row cannot be empty');
        assert(
          fields == null &&
                  (fieldsOverride == null ||
                      fieldsOverride!.length == row.length) ||
              fields != null &&
                  (fieldsOverride == null ||
                      fieldsOverride!.length == fields!.length),
          'You have specified more field names than fields',
        );

        for (int i = 0; i < row.length; i++) {
          final field = row[i] as String;
          if (field == sourceField || (fields?.contains(field) ?? true)) {
            final fieldName =
                fieldsOverride?[fieldsToPositions.length] ?? field;
            fieldsToPositions[fieldName] = i;
          }
        }

        assert(
          fields == null ||
              (fieldsOverride ?? fields)!.every(
                (final field) => fieldsToPositions[field] != null,
              ),
          'You have specified a field that does not exist in your csv file.',
        );

        pageContentFields.addAll(
          fields == null || sourceField == null || fields!.contains(sourceField)
              ? fieldsToPositions.keys
              : fields!.where((final field) => field != sourceField),
        );
        continue;
      }

      // Process rows
      final rowMetadata = <String, dynamic>{
        if (sourceField == null)
          'source': filePath
        else
          'source': row[fieldsToPositions[sourceField!]!],
      };
      final rowContent = {
        for (final field in pageContentFields)
          field: row[fieldsToPositions[field]!],
      };

      final doc = Document(
        pageContent: rowContent.entries
            .map((final field) => '${field.key}: ${field.value}')
            .join('\n'),
        metadata: metadataBuilder?.call(rowContent, rowMetadata) ?? rowMetadata,
      );

      yield doc;
    }
  }
}
