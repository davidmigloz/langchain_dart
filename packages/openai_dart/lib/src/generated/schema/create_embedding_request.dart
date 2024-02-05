// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: CreateEmbeddingRequest
// ==========================================

/// Request object for the Create embedding endpoint.
@freezed
class CreateEmbeddingRequest with _$CreateEmbeddingRequest {
  const CreateEmbeddingRequest._();

  /// Factory constructor for CreateEmbeddingRequest
  const factory CreateEmbeddingRequest({
    /// ID of the model to use. You can use the [List models](https://platform.openai.com/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](https://platform.openai.com/docs/models/overview) for descriptions of them.
    @_EmbeddingModelConverter() required EmbeddingModel model,

    /// Input text to embed, encoded as a string or array of tokens. To embed multiple inputs in a single request, pass an array of strings or array of token arrays. The input must not exceed the max input tokens for the model (8192 tokens for `text-embedding-ada-002`), cannot be an empty string, and any array must be 2048 dimensions or less. [Example Python code](https://cookbook.openai.com/examples/how_to_count_tokens_with_tiktoken) for counting tokens.
    @_EmbeddingInputConverter() required EmbeddingInput input,

    /// The format to return the embeddings in. Can be either `float` or [`base64`](https://pypi.org/project/pybase64/).
    @JsonKey(name: 'encoding_format')
    @Default(EmbeddingEncodingFormat.float)
    EmbeddingEncodingFormat encodingFormat,

    /// The number of dimensions the resulting output embeddings should have. Only supported in `text-embedding-3` and later models.
    @JsonKey(includeIfNull: false) int? dimensions,

    /// A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices/end-user-ids).
    @JsonKey(includeIfNull: false) String? user,
  }) = _CreateEmbeddingRequest;

  /// Object construction from a JSON representation
  factory CreateEmbeddingRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateEmbeddingRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'model',
    'input',
    'encoding_format',
    'dimensions',
    'user'
  ];

  /// Validation constants
  static const dimensionsMinValue = 1;

  /// Perform validations on the schema property values
  String? validateSchema() {
    if (dimensions != null && dimensions! < dimensionsMinValue) {
      return "The value of 'dimensions' cannot be < $dimensionsMinValue";
    }
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'model': model,
      'input': input,
      'encoding_format': encodingFormat,
      'dimensions': dimensions,
      'user': user,
    };
  }
}

// ==========================================
// ENUM: EmbeddingModels
// ==========================================

/// Available completion models. Mind that the list may not be exhaustive nor up-to-date.
enum EmbeddingModels {
  @JsonValue('text-embedding-ada-002')
  textEmbeddingAda002,
  @JsonValue('text-embedding-3-small')
  textEmbedding3Small,
  @JsonValue('text-embedding-3-large')
  textEmbedding3Large,
}

// ==========================================
// CLASS: EmbeddingModel
// ==========================================

/// ID of the model to use. You can use the [List models](https://platform.openai.com/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](https://platform.openai.com/docs/models/overview) for descriptions of them.
@freezed
sealed class EmbeddingModel with _$EmbeddingModel {
  const EmbeddingModel._();

  /// Available completion models. Mind that the list may not be exhaustive nor up-to-date.
  const factory EmbeddingModel.model(
    EmbeddingModels value,
  ) = EmbeddingModelEnumeration;

  /// The ID of the model to use for this request.
  const factory EmbeddingModel.modelId(
    String value,
  ) = EmbeddingModelString;

  /// Object construction from a JSON representation
  factory EmbeddingModel.fromJson(Map<String, dynamic> json) =>
      _$EmbeddingModelFromJson(json);
}

/// Custom JSON converter for [EmbeddingModel]
class _EmbeddingModelConverter
    implements JsonConverter<EmbeddingModel, Object?> {
  const _EmbeddingModelConverter();

  @override
  EmbeddingModel fromJson(Object? data) {
    if (data is String && _$EmbeddingModelsEnumMap.values.contains(data)) {
      return EmbeddingModelEnumeration(
        _$EmbeddingModelsEnumMap.keys.elementAt(
          _$EmbeddingModelsEnumMap.values.toList().indexOf(data),
        ),
      );
    }
    if (data is String) {
      return EmbeddingModelString(data);
    }
    throw Exception(
      'Unexpected value for EmbeddingModel: $data',
    );
  }

  @override
  Object? toJson(EmbeddingModel data) {
    return switch (data) {
      EmbeddingModelEnumeration(value: final v) => _$EmbeddingModelsEnumMap[v]!,
      EmbeddingModelString(value: final v) => v,
    };
  }
}

// ==========================================
// CLASS: EmbeddingInput
// ==========================================

/// Input text to embed, encoded as a string or array of tokens. To embed multiple inputs in a single request, pass an array of strings or array of token arrays. The input must not exceed the max input tokens for the model (8192 tokens for `text-embedding-ada-002`), cannot be an empty string, and any array must be 2048 dimensions or less. [Example Python code](https://cookbook.openai.com/examples/how_to_count_tokens_with_tiktoken) for counting tokens.
@freezed
sealed class EmbeddingInput with _$EmbeddingInput {
  const EmbeddingInput._();

  /// A list of tokenized prompts.
  const factory EmbeddingInput.listTokens(
    List<List<int>> value,
  ) = EmbeddingInputListListInt;

  /// A tokenized prompt.
  const factory EmbeddingInput.tokens(
    List<int> value,
  ) = EmbeddingInputListInt;

  /// A list of string prompts.
  const factory EmbeddingInput.listString(
    List<String> value,
  ) = EmbeddingInputListString;

  /// A string prompt.
  const factory EmbeddingInput.string(
    String value,
  ) = EmbeddingInputString;

  /// Object construction from a JSON representation
  factory EmbeddingInput.fromJson(Map<String, dynamic> json) =>
      _$EmbeddingInputFromJson(json);
}

/// Custom JSON converter for [EmbeddingInput]
class _EmbeddingInputConverter
    implements JsonConverter<EmbeddingInput, Object?> {
  const _EmbeddingInputConverter();

  @override
  EmbeddingInput fromJson(Object? data) {
    if (data is List && data.every((item) => item is List<int>)) {
      return EmbeddingInputListListInt(data.cast());
    }
    if (data is List && data.every((item) => item is int)) {
      return EmbeddingInputListInt(data.cast());
    }
    if (data is List && data.every((item) => item is String)) {
      return EmbeddingInputListString(data.cast());
    }
    if (data is String) {
      return EmbeddingInputString(data);
    }
    throw Exception(
      'Unexpected value for EmbeddingInput: $data',
    );
  }

  @override
  Object? toJson(EmbeddingInput data) {
    return switch (data) {
      EmbeddingInputListListInt(value: final v) => v,
      EmbeddingInputListInt(value: final v) => v,
      EmbeddingInputListString(value: final v) => v,
      EmbeddingInputString(value: final v) => v,
    };
  }
}

// ==========================================
// ENUM: EmbeddingEncodingFormat
// ==========================================

/// The format to return the embeddings in. Can be either `float` or [`base64`](https://pypi.org/project/pybase64/).
enum EmbeddingEncodingFormat {
  @JsonValue('float')
  float,
  @JsonValue('base64')
  base64,
}
