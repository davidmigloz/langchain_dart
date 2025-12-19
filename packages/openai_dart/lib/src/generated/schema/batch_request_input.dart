// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: BatchRequestInput
// ==========================================

/// The per-line object of the batch input file
@freezed
abstract class BatchRequestInput with _$BatchRequestInput {
  const BatchRequestInput._();

  /// Factory constructor for BatchRequestInput
  const factory BatchRequestInput({
    /// A developer-provided per-request id that will be used to match outputs to inputs. Must be unique for each request in a batch.
    @JsonKey(name: 'custom_id', includeIfNull: false) String? customId,

    /// The HTTP method to be used for the request. Currently only `POST` is supported.
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    BatchRequestInputMethod? method,

    /// The OpenAI API relative URL to be used for the request. Currently `/v1/chat/completions`, `/v1/embeddings`, and `/v1/completions` are supported.
    @JsonKey(includeIfNull: false) String? url,
  }) = _BatchRequestInput;

  /// Object construction from a JSON representation
  factory BatchRequestInput.fromJson(Map<String, dynamic> json) =>
      _$BatchRequestInputFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['custom_id', 'method', 'url'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'custom_id': customId, 'method': method, 'url': url};
  }
}

// ==========================================
// ENUM: BatchRequestInputMethod
// ==========================================

/// The HTTP method to be used for the request. Currently only `POST` is supported.
enum BatchRequestInputMethod {
  @JsonValue('POST')
  post,
}
