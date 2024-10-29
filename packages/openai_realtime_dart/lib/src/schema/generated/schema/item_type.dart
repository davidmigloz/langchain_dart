// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// ENUM: ItemType
// ==========================================

/// The type of the item.
enum ItemType {
  @JsonValue('message')
  message,
  @JsonValue('function_call')
  functionCall,
  @JsonValue('function_call_output')
  functionCallOutput,
}
