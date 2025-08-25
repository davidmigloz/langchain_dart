// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: CreateResponseRequest
// ==========================================

/// Request object for the Create response endpoint.
@freezed
class CreateResponseRequest with _$CreateResponseRequest {
  const CreateResponseRequest._();

  /// Factory constructor for CreateResponseRequest
  const factory CreateResponseRequest({
    /// The ID of the model to use.
    required String model,

    /// Text or items to generate a response for.
    @_CreateResponseRequestInputConverter()
    required CreateResponseRequestInput input,

    /// No Description
    @JsonKey(includeIfNull: false) List<Map<String, dynamic>>? tools,

    /// No Description
    @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,

    /// No Description
    @JsonKey(includeIfNull: false) bool? stream,

    /// No Description
    @JsonKey(includeIfNull: false) double? temperature,

    /// No Description
    @JsonKey(name: 'top_p', includeIfNull: false) double? topP,
  }) = _CreateResponseRequest;

  /// Object construction from a JSON representation
  factory CreateResponseRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateResponseRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'model',
    'input',
    'tools',
    'metadata',
    'stream',
    'temperature',
    'top_p'
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
      'tools': tools,
      'metadata': metadata,
      'stream': stream,
      'temperature': temperature,
      'top_p': topP,
    };
  }
}

// ==========================================
// CLASS: CreateResponseRequestInput
// ==========================================

/// Text or items to generate a response for.
@freezed
sealed class CreateResponseRequestInput with _$CreateResponseRequestInput {
  const CreateResponseRequestInput._();

  /// No Description
  const factory CreateResponseRequestInput.listMapStringDynamic(
    List<Map<String, dynamic>> value,
  ) = CreateResponseRequestInputListMapStringDynamic;

  /// No Description
  const factory CreateResponseRequestInput.string(
    String value,
  ) = CreateResponseRequestInputString;

  /// Object construction from a JSON representation
  factory CreateResponseRequestInput.fromJson(Map<String, dynamic> json) =>
      _$CreateResponseRequestInputFromJson(json);
}

/// Custom JSON converter for [CreateResponseRequestInput]
class _CreateResponseRequestInputConverter
    implements JsonConverter<CreateResponseRequestInput, Object?> {
  const _CreateResponseRequestInputConverter();

  @override
  CreateResponseRequestInput fromJson(Object? data) {
    if (data is List && data.every((item) => item is Map)) {
      return CreateResponseRequestInputListMapStringDynamic(data
          .map((i) => Map<String, dynamic>.fromJson(i as Map<String, dynamic>))
          .toList(growable: false));
    }
    if (data is String) {
      return CreateResponseRequestInputString(data);
    }
    throw Exception(
      'Unexpected value for CreateResponseRequestInput: $data',
    );
  }

  @override
  Object? toJson(CreateResponseRequestInput data) {
    return switch (data) {
      CreateResponseRequestInputListMapStringDynamic(value: final v) => v,
      CreateResponseRequestInputString(value: final v) => v,
    };
  }
}
