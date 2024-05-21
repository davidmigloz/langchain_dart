// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_a_i_schema;

// ==========================================
// CLASS: MessageParam
// ==========================================

/// No Description
@freezed
class MessageParam with _$MessageParam {
  const MessageParam._();

  /// Factory constructor for MessageParam
  const factory MessageParam({
    /// No Description
    @_MessageParamContentConverter() required MessageParamContent content,

    ///
    required MessageParamRole role,
  }) = _MessageParam;

  /// Object construction from a JSON representation
  factory MessageParam.fromJson(Map<String, dynamic> json) =>
      _$MessageParamFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['content', 'role'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'role': role,
    };
  }
}

// ==========================================
// CLASS: MessageParamContent
// ==========================================

/// No Description
@freezed
sealed class MessageParamContent with _$MessageParamContent {
  const MessageParamContent._();

  /// No Description
  const factory MessageParamContent.listMapStringDynamic(
    List<Map<String, dynamic>> value,
  ) = MessageParamContentListMapStringDynamic;

  /// No Description
  const factory MessageParamContent.string(
    String value,
  ) = MessageParamContentString;

  /// Object construction from a JSON representation
  factory MessageParamContent.fromJson(Map<String, dynamic> json) =>
      _$MessageParamContentFromJson(json);
}

/// Custom JSON converter for [MessageParamContent]
class _MessageParamContentConverter
    implements JsonConverter<MessageParamContent, Object?> {
  const _MessageParamContentConverter();

  @override
  MessageParamContent fromJson(Object? data) {
    if (data is List && data.every((item) => item is Map<String, dynamic>)) {
      return MessageParamContentListMapStringDynamic(data.cast());
    }
    if (data is String) {
      return MessageParamContentString(data);
    }
    throw Exception(
      'Unexpected value for MessageParamContent: $data',
    );
  }

  @override
  Object? toJson(MessageParamContent data) {
    return switch (data) {
      MessageParamContentListMapStringDynamic(value: final v) => v,
      MessageParamContentString(value: final v) => v,
    };
  }
}

// ==========================================
// ENUM: MessageParamRole
// ==========================================

/// No Description
enum MessageParamRole {
  @JsonValue('user')
  user,
  @JsonValue('assistant')
  assistant,
}
