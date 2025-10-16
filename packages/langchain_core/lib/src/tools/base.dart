// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes, avoid_implementing_value_types, unsafe_variance
import 'dart:async';

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

import '../langchain/base.dart';
import '../utils/reduce.dart';
import 'string.dart';
import 'types.dart';

/// {@template tool_spec}
/// The specification of a LangChain tool without the actual implementation.
/// {@endtemplate}
class ToolSpec {
  /// {@macro tool_spec}
  const ToolSpec({
    required this.name,
    required this.description,
    required this.inputJsonSchema,
    this.strict = false,
  });

  /// The unique name of the tool that clearly communicates its purpose.
  final String name;

  /// Used to tell the model how/when/why to use the tool.
  /// You can provide few-shot examples as a part of the description.
  final String description;

  /// Schema to parse and validate tool's input arguments.
  /// Following the [JSON Schema specification](https://json-schema.org).
  ///
  /// Example:
  /// ```json
  /// {
  ///   'type': 'object',
  ///   'properties': {
  ///     'answer': {
  ///       'type': 'string',
  ///       'description': 'The answer to the question being asked',
  ///     },
  ///     'sources': {
  ///       'type': 'array',
  ///       'items': {'type': 'string'},
  ///       'description': 'The sources used to answer the question',
  ///     },
  ///   },
  ///   'required': ['answer', 'sources'],
  /// },
  /// ```
  final Map<String, dynamic> inputJsonSchema;

  /// Whether to enable strict schema adherence when generating the tool call.
  /// If set to true, the model will follow the exact schema defined in the
  /// [inputJsonSchema] field.
  ///
  /// This is only supported by some providers (e.g. OpenAI). Mind that when
  /// enabled, only a subset of JSON Schema may be supported. Check out the
  /// provider's tool calling documentation for more information.
  final bool strict;

  @override
  bool operator ==(covariant final ToolSpec other) {
    final mapEquals = const DeepCollectionEquality().equals;
    return identical(this, other) ||
        name == other.name &&
            description == other.description &&
            mapEquals(inputJsonSchema, other.inputJsonSchema) &&
            strict == other.strict;
  }

  @override
  int get hashCode =>
      name.hashCode ^
      description.hashCode ^
      inputJsonSchema.hashCode ^
      strict.hashCode;

  @override
  String toString() {
    return '''
ToolSpec{
  name: $name,
  description: $description,
  inputJsonSchema: $inputJsonSchema,
  strict: $strict,
}
''';
  }

  /// Converts the tool spec to a JSON-serializable map.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'inputJsonSchema': inputJsonSchema,
      'strict': strict,
    };
  }
}

/// {@template tool}
/// A LangChain tool.
///
/// The [Input] to the tool needs to be described by the [inputJsonSchema].
///
/// You can easily create a tool from a function using [Tool.fromFunction].
///
/// If you want to create a tool that accepts a single string input and returns
/// a string output, you can use [StringTool] or [StringTool.fromFunction].
/// {@endtemplate}
abstract base class Tool<
  Input extends Object,
  Options extends ToolOptions,
  Output extends Object
>
    extends BaseLangChain<Input, Options, Output>
    implements ToolSpec {
  /// {@macro tool}
  Tool({
    required this.name,
    required this.description,
    required this.inputJsonSchema,
    this.strict = false,
    this.returnDirect = false,
    this.handleToolError,
    final Options? defaultOptions,
  }) : assert(name.isNotEmpty, 'Tool name cannot be empty.'),
       assert(description.isNotEmpty, 'Tool description cannot be empty.'),
       super(defaultOptions: defaultOptions ?? const ToolOptions() as Options);

  @override
  final String name;

  @override
  final String description;

  @override
  final Map<String, dynamic> inputJsonSchema;

  @override
  final bool strict;

  /// Whether to return the tool's output directly.
  /// Setting this to true means that after the tool is called,
  /// the AgentExecutor will stop looping.
  final bool returnDirect;

  /// Handle the content of the [ToolException] thrown by the tool.
  final Output Function(ToolException)? handleToolError;

  /// Creates a [Tool] from a function.
  ///
  /// - [name] is the unique name of the tool that clearly communicates its
  ///   purpose.
  /// - [description] is used to tell the model how/when/why to use the tool.
  ///   You can provide few-shot examples as a part of the description.
  /// - [inputJsonSchema] is the schema to parse and validate tool's input.
  /// - [strict] whether to enable strict schema adherence when generating the
  ///   tool call (only supported by some providers).
  /// - [func] is the function that will be called when the tool is run.
  ///   arguments.
  /// - [getInputFromJson] is a function that parses the input JSON to the
  ///   tool's input type. By default, it assumes the input values is under
  ///   the key 'input'. Define your own deserialization logic if the input
  ///   is not a primitive type or is under a different key.
  /// - [returnDirect] whether to return the tool's output directly.
  ///   Setting this to true means that after the tool is called,
  ///   the AgentExecutor will stop looping.
  /// - [handleToolError] is a function that handles the content of the
  ///   [ToolException] thrown by the tool.
  static Tool fromFunction<Input extends Object, Output extends Object>({
    required final String name,
    required final String description,
    required final Map<String, dynamic> inputJsonSchema,
    final bool strict = false,
    required final FutureOr<Output> Function(Input input) func,
    Input Function(Map<String, dynamic> json)? getInputFromJson,
    final bool returnDirect = false,
    final Output Function(ToolException)? handleToolError,
  }) {
    return _ToolFunc<Input, Output>(
      name: name,
      description: description,
      inputJsonSchema: inputJsonSchema,
      strict: strict,
      function: func,
      getInputFromJson:
          getInputFromJson ??
          (json) {
            if (json.containsKey('input')) {
              return json['input'] as Input;
            }
            return json as Input;
          },
      returnDirect: returnDirect,
      handleToolError: handleToolError,
    );
  }

  /// Runs the tool.
  ///
  /// - [input] is the input to the tool.
  /// - [options] is the options to pass to the tool.
  @override
  Future<Output> invoke(final Input input, {final Options? options}) async {
    try {
      return invokeInternal(input, options: options);
    } on ToolException catch (e) {
      if (handleToolError != null) {
        return handleToolError!(e);
      } else {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Actual implementation of [invoke] method logic.
  @protected
  Future<Output> invokeInternal(final Input input, {final Options? options});

  /// Streams the tool's output for the input resulting from
  /// reducing the input stream.
  ///
  /// - [inputStream] - the input stream to reduce and use as the input.
  /// - [options] is the options to pass to the tool.
  @override
  Stream<Output> streamFromInputStream(
    final Stream<Input> inputStream, {
    final Options? options,
  }) async* {
    final input = await inputStream.toList();
    final reduced = reduce<Input>(input);
    yield* stream(reduced, options: options);
  }

  /// Parses the input JSON to the tool's input type.
  Input getInputFromJson(final Map<String, dynamic> json);

  @override
  bool operator ==(covariant final ToolSpec other) {
    final mapEquals = const DeepCollectionEquality().equals;
    return identical(this, other) ||
        name == other.name &&
            description == other.description &&
            mapEquals(inputJsonSchema, other.inputJsonSchema) &&
            strict == other.strict;
  }

  @override
  int get hashCode =>
      name.hashCode ^
      description.hashCode ^
      inputJsonSchema.hashCode ^
      strict.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'inputJsonSchema': inputJsonSchema,
      'strict': strict,
    };
  }
}

/// {@template tool_func}
/// A tool that accepts a function as input.
/// Used in [Tool.fromFunction].
/// {@endtemplate}
final class _ToolFunc<Input extends Object, Output extends Object>
    extends Tool<Input, ToolOptions, Output> {
  /// {@macro tool_func}
  _ToolFunc({
    required super.name,
    required super.description,
    required super.inputJsonSchema,
    required super.strict,
    required FutureOr<Output> Function(Input input) function,
    required Input Function(Map<String, dynamic> json) getInputFromJson,
    super.returnDirect = false,
    super.handleToolError,
    super.defaultOptions,
  }) : _getInputFromJson = getInputFromJson,
       _function = function;

  /// The function to run when the tool is called.
  final FutureOr<Output> Function(Input toolInput) _function;

  /// The function to parse the input JSON to the tool's input type.
  final Input Function(Map<String, dynamic> json) _getInputFromJson;

  @override
  Future<Output> invokeInternal(
    final Input toolInput, {
    final ToolOptions? options,
  }) async {
    return _function(toolInput);
  }

  @override
  Input getInputFromJson(final Map<String, dynamic> json) {
    return _getInputFromJson(json);
  }
}
