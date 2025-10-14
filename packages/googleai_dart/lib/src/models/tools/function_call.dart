import '../copy_with_sentinel.dart';

/// A predicted function call returned from the model.
class FunctionCall {
  /// The name of the function to call.
  final String name;

  /// The function parameters and values.
  final Map<String, dynamic>? args;

  /// Creates a [FunctionCall].
  const FunctionCall({
    required this.name,
    this.args,
  });

  /// Creates a [FunctionCall] from JSON.
  factory FunctionCall.fromJson(Map<String, dynamic> json) => FunctionCall(
        name: json['name'] as String,
        args: json['args'] as Map<String, dynamic>?,
      );

  /// Converts to JSON.
  Map<String, dynamic> toJson() => {
        'name': name,
        if (args != null) 'args': args,
      };

  /// Creates a copy with replaced values.
  FunctionCall copyWith({
    Object? name = unsetCopyWithValue,
    Object? args = unsetCopyWithValue,
  }) {
    return FunctionCall(
      name: name == unsetCopyWithValue ? this.name : name! as String,
      args: args == unsetCopyWithValue
          ? this.args
          : args as Map<String, dynamic>?,
    );
  }
}
