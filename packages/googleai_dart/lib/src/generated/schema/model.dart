// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of google_a_i_schema;

// ==========================================
// CLASS: Model
// ==========================================

/// Information about a Generative Language Model.
@freezed
class Model with _$Model {
  const Model._();

  /// Factory constructor for Model
  const factory Model({
    /// Required. The resource name of the `Model`. Format: `models/{model}` with a `{model}` naming convention of: * "{base_model_id}-{version}" Examples: * `models/chat-bison-001`
    @JsonKey(includeIfNull: false) String? name,

    /// The human-readable name of the model. E.g. "Chat Bison". The name can be up to 128 characters long and can consist of any UTF-8 characters.
    @JsonKey(includeIfNull: false) String? displayName,

    /// A short description of the model.
    @JsonKey(includeIfNull: false) String? description,

    /// For Top-k sampling. Top-k sampling considers the set of `top_k` most probable tokens. This value specifies default to be used by the backend while making the call to the model.
    @JsonKey(includeIfNull: false) int? topK,

    /// Required. The version number of the model. This represents the major version
    @JsonKey(includeIfNull: false) String? version,

    /// Controls the randomness of the output. Values can range over `[0.0,1.0]`, inclusive. A value closer to `1.0` will produce responses that are more varied, while a value closer to `0.0` will typically result in less surprising responses from the model. This value specifies default to be used by the backend while making the call to the model.
    @JsonKey(includeIfNull: false) double? temperature,

    /// For Nucleus sampling. Nucleus sampling considers the smallest set of tokens whose probability sum is at least `top_p`. This value specifies default to be used by the backend while making the call to the model.
    @JsonKey(includeIfNull: false) double? topP,

    /// Required. The name of the base model, pass this to the generation request. Examples: * `chat-bison`
    @JsonKey(includeIfNull: false) String? baseModelId,

    /// Maximum number of input tokens allowed for this model.
    @JsonKey(includeIfNull: false) int? inputTokenLimit,

    /// Maximum number of output tokens available for this model.
    @JsonKey(includeIfNull: false) int? outputTokenLimit,

    /// The model's supported generation methods. The method names are defined as Pascal case strings, such as `generateMessage` which correspond to API methods.
    @JsonKey(includeIfNull: false) List<String>? supportedGenerationMethods,
  }) = _Model;

  /// Object construction from a JSON representation
  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'name',
    'displayName',
    'description',
    'topK',
    'version',
    'temperature',
    'topP',
    'baseModelId',
    'inputTokenLimit',
    'outputTokenLimit',
    'supportedGenerationMethods'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'displayName': displayName,
      'description': description,
      'topK': topK,
      'version': version,
      'temperature': temperature,
      'topP': topP,
      'baseModelId': baseModelId,
      'inputTokenLimit': inputTokenLimit,
      'outputTokenLimit': outputTokenLimit,
      'supportedGenerationMethods': supportedGenerationMethods,
    };
  }
}
