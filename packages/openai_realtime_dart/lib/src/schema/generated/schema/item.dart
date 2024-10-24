// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// CLASS: Item
// ==========================================

/// The item to add to the conversation.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class Item with _$Item {
  const Item._();

  // ------------------------------------------
  // UNION: ItemMessage
  // ------------------------------------------

  /// A message item.

  @FreezedUnionValue('message')
  const factory Item.message({
    /// The unique ID of the item.
    required String id,

    /// The object type, must be "realtime.item".
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    ObjectType? object,

    /// The type of the item.
    @Default(ItemType.message) ItemType type,

    /// The status of the item.
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    ItemStatus? status,

    /// The role of the message sender.
    required ItemRole role,

    /// The content of the message.
    required List<ContentPart> content,
  }) = ItemMessage;

  // ------------------------------------------
  // UNION: ItemFunctionCall
  // ------------------------------------------

  /// A function call item.

  @FreezedUnionValue('function_call')
  const factory Item.functionCall({
    /// The unique ID of the item.
    required String id,

    /// The object type.
    @Default(ObjectType.realtimeItem) ObjectType object,

    /// The type of the item.
    @Default(ItemType.functionCall) ItemType type,

    /// The status of the item.
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    ItemStatus? status,

    /// The ID of the function call.
    @JsonKey(name: 'call_id') required String callId,

    /// The name of the function being called.
    required String name,

    /// The arguments of the function call.
    required String arguments,
  }) = ItemFunctionCall;

  // ------------------------------------------
  // UNION: ItemFunctionCallOutput
  // ------------------------------------------

  /// A function call output item.

  @FreezedUnionValue('function_call_output')
  const factory Item.functionCallOutput({
    /// The unique ID of the item.
    required String id,

    /// The object type. Always "realtime.item".
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    ObjectType? object,

    /// The type of the item.
    @Default(ItemType.functionCallOutput) ItemType type,

    /// The status of the item.
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    ItemStatus? status,

    /// The ID of the function call.
    @JsonKey(name: 'call_id') required String callId,

    /// The output of the function call.
    required String output,
  }) = ItemFunctionCallOutput;

  /// Object construction from a JSON representation
  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

// ==========================================
// ENUM: ItemEnumType
// ==========================================

enum ItemEnumType {
  @JsonValue('message')
  message,
  @JsonValue('function_call')
  functionCall,
  @JsonValue('function_call_output')
  functionCallOutput,
}
