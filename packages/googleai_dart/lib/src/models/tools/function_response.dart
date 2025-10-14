import '../copy_with_sentinel.dart';

/// The result output from a function call.
class FunctionResponse {
  /// The name of the function that was called.
  final String name;

  /// The function response.
  final Map<String, dynamic> response;

  /// Creates a [FunctionResponse].
  const FunctionResponse({
    required this.name,
    required this.response,
  });

  /// Creates a [FunctionResponse] from JSON.
  factory FunctionResponse.fromJson(Map<String, dynamic> json) =>
      FunctionResponse(
        name: json['name'] as String,
        response: json['response'] as Map<String, dynamic>,
      );

  /// Converts to JSON.
  Map<String, dynamic> toJson() => {
        'name': name,
        'response': response,
      };

  /// Creates a copy with replaced values.
  FunctionResponse copyWith({
    Object? name = unsetCopyWithValue,
    Object? response = unsetCopyWithValue,
  }) {
    return FunctionResponse(
      name: name == unsetCopyWithValue ? this.name : name! as String,
      response: response == unsetCopyWithValue
          ? this.response
          : response! as Map<String, dynamic>,
    );
  }
}
