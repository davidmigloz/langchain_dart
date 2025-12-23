// ============================================================================
// Sealed Message Class Template for WebSocket Messages
// ============================================================================
// Usage: Copy and adapt for client or server message hierarchies
// Pattern: Sealed base class with concrete subclasses for each message type
// ============================================================================

import '../copy_with_sentinel.dart';

// ----------------------------------------------------------------------------
// SEALED BASE CLASS
// ----------------------------------------------------------------------------

/// Base sealed class for [CLIENT/SERVER] WebSocket messages.
///
/// Exactly one message type will be present in each WebSocket frame.
sealed class BidiGenerateContent[Client/Server]Message {
  /// Creates a message.
  const BidiGenerateContent[Client/Server]Message();

  /// Creates a message from JSON.
  ///
  /// Dispatches to the appropriate subclass based on the JSON key.
  factory BidiGenerateContent[Client/Server]Message.fromJson(
    Map<String, dynamic> json,
  ) {
    // Check each message type key in order
    if (json.containsKey('setup')) {
      return BidiGenerateContentSetup.fromJson(
        json['setup'] as Map<String, dynamic>,
      );
    }
    if (json.containsKey('clientContent')) {
      return BidiGenerateContentClientContent.fromJson(
        json['clientContent'] as Map<String, dynamic>,
      );
    }
    // ... add more message types
    throw FormatException('Unknown message type: ${json.keys}');
  }

  /// Converts to JSON with the message type wrapper key.
  Map<String, dynamic> toJson();
}

// ----------------------------------------------------------------------------
// CONCRETE MESSAGE CLASSES
// ----------------------------------------------------------------------------

/// [Description of what this message does]
///
/// Sent when [describe when this is sent].
class BidiGenerateContentSetup extends BidiGenerateContentClientMessage {
  /// Required. The model to use.
  final String model;

  /// Optional. Generation configuration.
  final LiveGenerationConfig? generationConfig;

  /// Optional. System instruction.
  final Content? systemInstruction;

  /// Optional. Available tools.
  final List<Tool>? tools;

  // Add more fields as needed...

  /// Creates a [BidiGenerateContentSetup].
  const BidiGenerateContentSetup({
    required this.model,
    this.generationConfig,
    this.systemInstruction,
    this.tools,
  });

  /// Creates from JSON (inner object, not wrapped).
  factory BidiGenerateContentSetup.fromJson(Map<String, dynamic> json) {
    return BidiGenerateContentSetup(
      model: json['model'] as String,
      generationConfig: json['generationConfig'] != null
          ? LiveGenerationConfig.fromJson(
              json['generationConfig'] as Map<String, dynamic>,
            )
          : null,
      systemInstruction: json['systemInstruction'] != null
          ? Content.fromJson(
              json['systemInstruction'] as Map<String, dynamic>,
            )
          : null,
      tools: json['tools'] != null
          ? (json['tools'] as List<dynamic>)
              .map((e) => Tool.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
    'setup': {
      'model': model,
      if (generationConfig != null)
        'generationConfig': generationConfig!.toJson(),
      if (systemInstruction != null)
        'systemInstruction': systemInstruction!.toJson(),
      if (tools != null) 'tools': tools!.map((e) => e.toJson()).toList(),
    },
  };

  /// Creates a copy with replaced values.
  BidiGenerateContentSetup copyWith({
    Object? model = unsetCopyWithValue,
    Object? generationConfig = unsetCopyWithValue,
    Object? systemInstruction = unsetCopyWithValue,
    Object? tools = unsetCopyWithValue,
  }) {
    return BidiGenerateContentSetup(
      model: model == unsetCopyWithValue ? this.model : model! as String,
      generationConfig: generationConfig == unsetCopyWithValue
          ? this.generationConfig
          : generationConfig as LiveGenerationConfig?,
      systemInstruction: systemInstruction == unsetCopyWithValue
          ? this.systemInstruction
          : systemInstruction as Content?,
      tools: tools == unsetCopyWithValue ? this.tools : tools as List<Tool>?,
    );
  }

  @override
  String toString() =>
      'BidiGenerateContentSetup(model: $model, '
      'generationConfig: $generationConfig, '
      'systemInstruction: $systemInstruction, '
      'tools: $tools)';
}

// ----------------------------------------------------------------------------
// PATTERN NOTES
// ----------------------------------------------------------------------------
//
// 1. SEALED BASE CLASS:
//    - Use `sealed class` for exhaustive switch statements
//    - Factory constructor dispatches based on JSON keys
//    - Each message type has its own JSON wrapper key
//
// 2. CONCRETE CLASSES:
//    - Extend the sealed base class
//    - Have both `fromJson` (inner) and `toJson` (with wrapper)
//    - Include copyWith with sentinel pattern
//    - Include toString for debugging
//
// 3. JSON STRUCTURE:
//    Client sends: { "setup": { ... } } or { "realtimeInput": { ... } }
//    Server sends: { "serverContent": { ... } } or { "toolCall": { ... } }
//
// 4. NESTED TYPES:
//    - Reference existing types (Content, Tool, etc.) when possible
//    - Create new types for Live API-specific structures
//
// 5. BINARY DATA:
//    - Use List<int> for raw bytes
//    - Use base64 encoding in JSON: base64Encode(bytes) / base64Decode(str)
//
// 6. OPTIONAL FIELDS:
//    - Use nullable types (Type?) for optional fields
//    - Use `if (field != null)` in toJson
//    - Handle null in fromJson with ternary
