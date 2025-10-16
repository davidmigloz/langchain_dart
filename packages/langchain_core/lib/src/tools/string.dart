import 'dart:async';

import 'base.dart';
import 'types.dart';

/// {@template string_tool}
/// Base class for tools that accept a single string input and returns a
/// string output.
/// {@endtemplate}
abstract base class StringTool<Options extends ToolOptions>
    extends Tool<String, Options, String> {
  /// {@macro string_tool}
  StringTool({
    required super.name,
    required super.description,
    final String inputDescription = 'The input to the tool',
    super.strict = false,
    super.returnDirect = false,
    super.handleToolError,
    super.defaultOptions,
  }) : super(
         inputJsonSchema: {
           'type': 'object',
           'properties': {
             'input': {'type': 'string', 'description': inputDescription},
           },
           'required': ['input'],
         },
       );

  /// Creates a [StringTool] from a function.
  ///
  /// - [name] is the unique name of the tool that clearly communicates its
  ///   purpose.
  /// - [description] is used to tell the model how/when/why to use the tool.
  ///   You can provide few-shot examples as a part of the description.
  /// - [strict] whether to enable strict schema adherence when generating the
  ///   tool call (only supported by some providers).
  /// - [func] is the function that will be called when the tool is run.
  /// - [returnDirect] whether to return the tool's output directly.
  ///   Setting this to true means that after the tool is called,
  ///   the AgentExecutor will stop looping.
  /// - [handleToolError] is a function that handles the content of the
  ///   [ToolException] thrown by the tool.
  static StringTool fromFunction<Options extends ToolOptions>({
    required final String name,
    required final String description,
    final String inputDescription = 'The input to the tool',
    final bool strict = false,
    required final FutureOr<String> Function(String input) func,
    final bool returnDirect = false,
    final String Function(ToolException)? handleToolError,
  }) {
    return _StringToolFunc<Options>(
      name: name,
      description: description,
      inputDescription: inputDescription,
      strict: strict,
      func: func,
      returnDirect: returnDirect,
      handleToolError: handleToolError,
    );
  }

  /// Actual implementation of [invoke] method logic with string input.
  @override
  Future<String> invokeInternal(
    final String toolInput, {
    final Options? options,
  });

  @override
  String getInputFromJson(final Map<String, dynamic> json) {
    return json['input'] as String;
  }
}

/// {@template string_tool_func}
/// Implementation of [StringTool] that accepts a function as input.
/// Used in [StringTool.fromFunction].
/// {@endtemplate}
final class _StringToolFunc<Options extends ToolOptions>
    extends StringTool<Options> {
  /// {@macro string_tool_func}
  _StringToolFunc({
    required super.name,
    required super.description,
    super.inputDescription,
    required super.strict,
    required FutureOr<String> Function(String) func,
    super.returnDirect = false,
    super.handleToolError,
    super.defaultOptions,
  }) : _func = func;

  final FutureOr<String> Function(String input) _func;

  @override
  Future<String> invokeInternal(
    final String toolInput, {
    final Options? options,
  }) async {
    return _func(toolInput);
  }
}
