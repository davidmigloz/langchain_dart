import 'dart:async';

import 'package:meta/meta.dart';

import 'tool_exception.dart';
import 'tool_spec.dart';
import 'tool_utils.dart';

/// The [TInput] to the tool needs to be described by the [inputJsonSchema].
///
/// You can easily create a tool from a function using [Tool.fromFunction].
abstract base class Tool<TInput extends Object, TOutput extends Object>
    implements ToolSpec {
  /// Creates a [Tool].
  Tool({
    required this.name,
    required this.description,
    Map<String, dynamic>? inputJsonSchema,
    this.strict = false,
    this.returnDirect = false,
    this.handleToolError,
  }) : inputJsonSchema = normalizeAndValidateSchema(inputJsonSchema),
       assert(name.isNotEmpty, 'Tool name cannot be empty.'),
       assert(description.isNotEmpty, 'Tool description cannot be empty.');

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
  final TOutput Function(ToolException)? handleToolError;

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
    required String name,
    required String description,
    required FutureOr<Output> Function(Input input) func,
    Map<String, dynamic>? inputJsonSchema,
    bool strict = false,
    Input Function(Map<String, dynamic> json)? getInputFromJson,
    bool returnDirect = false,
    Output Function(ToolException)? handleToolError,
  }) => _ToolFunc<Input, Output>(
    name: name,
    description: description,
    inputJsonSchema: inputJsonSchema,
    strict: strict,
    function: func,
    getInputFromJson: getInputFromJson ?? (json) => json['input'] as Input,
    returnDirect: returnDirect,
    handleToolError: handleToolError,
  );

  /// Runs the tool.
  ///
  /// - [input] is the input to the tool.
  Future<TOutput> invoke(TInput input) async {
    try {
      return invokeInternal(input);
    } on ToolException catch (e) {
      if (handleToolError != null) {
        return handleToolError!(e);
      } else {
        rethrow;
      }
    } on Exception catch (_) {
      rethrow;
    }
  }

  /// Actual implementation of [invoke] method logic.
  @protected
  Future<TOutput> invokeInternal(TInput input);

  /// Parses the input JSON to the tool's input type.
  TInput getInputFromJson(Map<String, dynamic> json);

  /// Converts the tool to a JSON-serializable map.
  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'inputJsonSchema': inputJsonSchema,
    'strict': strict,
  };
}

final class _ToolFunc<Input extends Object, Output extends Object>
    extends Tool<Input, Output> {
  _ToolFunc({
    required super.name,
    required super.description,
    required super.strict,
    required FutureOr<Output> Function(Input input) function,
    required Input Function(Map<String, dynamic> json) getInputFromJson,
    super.inputJsonSchema,
    super.returnDirect = false,
    super.handleToolError,
  }) : _getInputFromJson = getInputFromJson,
       _function = function;

  /// The function to run when the tool is called.
  final FutureOr<Output> Function(Input toolInput) _function;

  /// The function to parse the input JSON to the tool's input type.
  final Input Function(Map<String, dynamic> json) _getInputFromJson;

  @override
  Future<Output> invokeInternal(Input toolInput) async => _function(toolInput);

  @override
  Input getInputFromJson(Map<String, dynamic> json) => _getInputFromJson(json);
}
