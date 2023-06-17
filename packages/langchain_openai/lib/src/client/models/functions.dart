import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

/// {@template openai_function_model}
/// The description of a function that can be called by the model.
/// {@endtemplate
@immutable
class OpenAIFunction {
  /// {@macro openai_function_model}
  const OpenAIFunction({
    required this.name,
    this.description,
    this.parameters,
  });

  /// The name of the function to be called. Must be a-z, A-Z, 0-9, or contain
  /// underscores and dashes, with a maximum length of 64.
  final String name;

  /// The description of what the function does.
  final String? description;

  /// The parameters the functions accepts, described as a
  /// [JSON Schema](https://json-schema.org/understanding-json-schema) object.
  final OpenAIFunctionParameters? parameters;

  @override
  bool operator ==(covariant final OpenAIFunction other) =>
      identical(this, other) ||
      name == other.name &&
          description == other.description &&
          parameters == other.parameters;

  @override
  int get hashCode =>
      name.hashCode ^ description.hashCode ^ parameters.hashCode;

  @override
  String toString() {
    return 'OpenAIFunction('
        'name: $name, '
        'description: $description, '
        'parameters: $parameters)';
  }
}

/// {@template openai_function_parameters}
/// The parameters the functions accepts, described as a
/// [JSON Schema](https://json-schema.org/understanding-json-schema) object.
/// {@endtemplate}
@immutable
class OpenAIFunctionParameters {
  const OpenAIFunctionParameters(this.map);

  final Map<String, dynamic> map;

  @override
  bool operator ==(covariant final OpenAIFunctionParameters other) {
    final mapEquals = const MapEquality<String, dynamic>().equals;

    return identical(this, other) || mapEquals(map, other.map);
  }

  @override
  int get hashCode => map.hashCode;

  @override
  String toString() {
    return 'OpenAIFunctionParameters(map: $map)';
  }
}

/// {@template openai_function_call}
/// Controls how the model responds to function calls.
/// {@endtemplate}
@immutable
class OpenAIFunctionCall {
  /// Force the model to respond to the end-user instead of calling a function.
  static const none = OpenAIFunctionCall._(value: 'none');

  /// The model can pick between an end-user or calling a function.
  static const auto = OpenAIFunctionCall._(value: 'auto');

  /// {@macro openai_function_call}
  const OpenAIFunctionCall._({required this.value});

  /// Specifying a particular function forces the model to call that function.
  factory OpenAIFunctionCall.forFunction(final String functionName) {
    return OpenAIFunctionCall._(
      value: {
        'name': functionName,
      },
    );
  }

  /// The value of the function call.
  final dynamic value;

  @override
  bool operator ==(covariant final OpenAIFunctionCall other) =>
      identical(this, other) || value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return 'OpenAIFunctionCall(value: $value)';
  }
}

/// {@template openai_function_call_response}
/// The response from the model requesting to call a function.
/// {@endtemplate}
@immutable
class OpenAIFunctionCallResponse {
  /// {@macro openai_function_call_response}
  const OpenAIFunctionCallResponse({
    required this.name,
    required this.arguments,
  });

  /// The name of the function that the model wants to call.
  final String name;

  /// The arguments that the model wants to pass to the function.
  final Map<String, dynamic> arguments;

  @override
  bool operator ==(covariant final OpenAIFunctionCallResponse other) {
    final mapEquals = const MapEquality<String, dynamic>().equals;
    return identical(this, other) ||
        name == other.name && mapEquals(arguments, other.arguments);
  }

  @override
  int get hashCode => name.hashCode ^ arguments.hashCode;

  @override
  String toString() =>
      'OpenAIFunctionCallResponse(name: $name, arguments: $arguments)';
}
