import '../copy_with_sentinel.dart';
import 'function_calling_config.dart';

/// The Tool configuration containing parameters for specifying Tool use
/// in the request.
class ToolConfig {
  /// Function calling config.
  final FunctionCallingConfig? functionCallingConfig;

  /// Creates a [ToolConfig].
  const ToolConfig({this.functionCallingConfig});

  /// Creates a [ToolConfig] from JSON.
  factory ToolConfig.fromJson(Map<String, dynamic> json) => ToolConfig(
    functionCallingConfig: json['functionCallingConfig'] != null
        ? FunctionCallingConfig.fromJson(
            json['functionCallingConfig'] as Map<String, dynamic>,
          )
        : null,
  );

  /// Converts to JSON.
  Map<String, dynamic> toJson() => {
    if (functionCallingConfig != null)
      'functionCallingConfig': functionCallingConfig!.toJson(),
  };

  /// Creates a copy with replaced values.
  ToolConfig copyWith({Object? functionCallingConfig = unsetCopyWithValue}) {
    return ToolConfig(
      functionCallingConfig: functionCallingConfig == unsetCopyWithValue
          ? this.functionCallingConfig
          : functionCallingConfig as FunctionCallingConfig?,
    );
  }
}
