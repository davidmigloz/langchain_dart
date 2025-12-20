// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: DocumentBlockSource
// ==========================================

/// The source of a document block.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class DocumentBlockSource with _$DocumentBlockSource {
  const DocumentBlockSource._();

  // ------------------------------------------
  // UNION: Base64PdfSource
  // ------------------------------------------

  /// A document source using base64-encoded PDF data.

  @FreezedUnionValue('base64')
  const factory DocumentBlockSource.base64PdfSource({
    /// The type of document source.
    required String type,

    /// The media type of the document.
    @JsonKey(name: 'media_type') required Base64PdfSourceMediaType mediaType,

    /// The base64-encoded PDF data.
    required String data,
  }) = Base64PdfSource;

  // ------------------------------------------
  // UNION: PlainTextSource
  // ------------------------------------------

  /// A document source using plain text.

  @FreezedUnionValue('text')
  const factory DocumentBlockSource.plainTextSource({
    /// The type of document source.
    required String type,

    /// The media type of the content.
    @JsonKey(name: 'media_type') required PlainTextSourceMediaType mediaType,

    /// The text content.
    required String data,
  }) = PlainTextSource;

  // ------------------------------------------
  // UNION: ContentBlockSource
  // ------------------------------------------

  /// A document source referencing a content block.

  @FreezedUnionValue('content')
  const factory DocumentBlockSource.contentBlockSource({
    /// The type of document source.
    required String type,

    /// The content block reference.
    required String content,
  }) = ContentBlockSource;

  // ------------------------------------------
  // UNION: UrlPdfSource
  // ------------------------------------------

  /// A document source using a URL to a PDF.

  @FreezedUnionValue('url')
  const factory DocumentBlockSource.urlPdfSource({
    /// The type of document source.
    required String type,

    /// The URL of the PDF document.
    required String url,
  }) = UrlPdfSource;

  /// Object construction from a JSON representation
  factory DocumentBlockSource.fromJson(Map<String, dynamic> json) =>
      _$DocumentBlockSourceFromJson(json);
}

// ==========================================
// ENUM: DocumentBlockSourceEnumType
// ==========================================

enum DocumentBlockSourceEnumType {
  @JsonValue('base64')
  base64,
  @JsonValue('text')
  text,
  @JsonValue('content')
  content,
  @JsonValue('url')
  url,
}

// ==========================================
// ENUM: Base64PdfSourceMediaType
// ==========================================

/// The media type of the document.
enum Base64PdfSourceMediaType {
  @JsonValue('application/pdf')
  applicationPdf,
}

// ==========================================
// ENUM: PlainTextSourceMediaType
// ==========================================

/// The media type of the content.
enum PlainTextSourceMediaType {
  @JsonValue('text/plain')
  textPlain,
}
