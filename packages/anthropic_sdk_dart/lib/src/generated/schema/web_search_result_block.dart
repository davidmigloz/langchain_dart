// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: WebSearchResultBlock
// ==========================================

/// A single web search result.
@freezed
abstract class WebSearchResultBlock with _$WebSearchResultBlock {
  const WebSearchResultBlock._();

  /// Factory constructor for WebSearchResultBlock
  const factory WebSearchResultBlock({
    /// The type of block.
    required String type,

    /// The title of the search result.
    required String title,

    /// The URL of the search result.
    required String url,

    /// Encrypted content from the search result.
    @JsonKey(name: 'encrypted_content') required String encryptedContent,

    /// The age of the page.
    @JsonKey(name: 'page_age', includeIfNull: false) String? pageAge,
  }) = _WebSearchResultBlock;

  /// Object construction from a JSON representation
  factory WebSearchResultBlock.fromJson(Map<String, dynamic> json) =>
      _$WebSearchResultBlockFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'type',
    'title',
    'url',
    'encrypted_content',
    'page_age',
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'title': title,
      'url': url,
      'encrypted_content': encryptedContent,
      'page_age': pageAge,
    };
  }
}
