// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of mistral_a_i_schema;

// ==========================================
// CLASS: EmbeddingRequest
// ==========================================

/// Request class for the embedding endpoint.
@freezed
class EmbeddingRequest with _$EmbeddingRequest {
  const EmbeddingRequest._();

  /// Factory constructor for EmbeddingRequest
  const factory EmbeddingRequest({
    /// ID of the model to use. You can use the [List Available Models](https://docs.mistral.ai/api#operation/listModels) API to see all of your available models, or see our [Model overview](https://docs.mistral.ai/models) for model descriptions.
    @_EmbeddingModelConverter() required EmbeddingModel model,

    /// The list of strings to embed.
    required List<String> input,

    /// The format of the output data.
    @JsonKey(name: 'encoding_format')
    @Default(EmbeddingEncodingFormat.float)
    EmbeddingEncodingFormat encodingFormat,
  }) = _EmbeddingRequest;

  /// Object construction from a JSON representation
  factory EmbeddingRequest.fromJson(Map<String, dynamic> json) =>
      _$EmbeddingRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'model',
    'input',
    'encoding_format'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'model': model,
      'input': input,
      'encoding_format': encodingFormat,
    };
  }
}

// ==========================================
// ENUM: EmbeddingModels
// ==========================================

/// Available embedding models. Mind that the list may not be exhaustive nor up-to-date.
enum EmbeddingModels {
  @JsonValue('mistral-embed')
  mistralEmbed,
}

// ==========================================
// CLASS: EmbeddingModel
// ==========================================

/// ID of the model to use. You can use the [List Available Models](https://docs.mistral.ai/api#operation/listModels) API to see all of your available models, or see our [Model overview](https://docs.mistral.ai/models) for model descriptions.
@freezed
sealed class EmbeddingModel with _$EmbeddingModel {
  const EmbeddingModel._();

  /// Available embedding models. Mind that the list may not be exhaustive nor up-to-date.
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
// ENUM: EmbeddingEncodingFormat
// ==========================================

/// The format of the output data.
enum EmbeddingEncodingFormat {
  @JsonValue('float')
  float,
}
