import 'dart:async';

import 'package:meta/meta.dart';

import 'models/models.dart';

/// {@template base_tool}
/// Base class LangChain tools must extend.
/// {@endtemplate}
abstract base class BaseTool<I> {
  /// {@macro base_tool}
  BaseTool({
    required this.name,
    required this.description,
    required this.inputJsonSchema,
    this.returnDirect = false,
    this.handleToolError,
  })  : assert(name.isNotEmpty, 'Tool name cannot be empty.'),
        assert(description.isNotEmpty, 'Tool description cannot be empty.');

  /// The unique name of the tool that clearly communicates its purpose.
  final String name;

  /// Used to tell the model how/when/why to use the tool.
  /// You can provide few-shot examples as a part of the description.
  final String description;

  /// Schema to parse and validate tool's input arguments.
  final Map<String, dynamic> inputJsonSchema;

  /// Whether to return the tool's output directly.
  /// Setting this to true means that after the tool is called,
  /// the AgentExecutor will stop looping.
  final bool returnDirect;

  /// Handle the content of the [ToolException] thrown by the tool.
  final String Function(ToolException)? handleToolError;

  /// Runs the tool.
  ///
  /// - [toolInput] is the input to the tool.
  FutureOr<String> run({
    required final I toolInput,
  }) {
    try {
      return runInternal(toolInput: toolInput);
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

  /// Actual implementation of [run] method logic.
  @protected
  FutureOr<String> runInternal({
    required final I toolInput,
  });

  /// Runs the tool (same as [run] but using callable class syntax).
  ///
  /// - [toolInput] is the input to the tool.
  FutureOr<String> call({
    required final I toolInput,
  }) {
    return run(toolInput: toolInput);
  }
}

/// {@template structured_tool}
/// Generic base class for Tools that accept any class as input.
/// {@endtemplate}
abstract base class StructuredTool<I> extends BaseTool<I> {
  StructuredTool({
    required super.name,
    required super.description,
    required super.inputJsonSchema,
    super.returnDirect = false,
    super.handleToolError,
  });

  /// Creates a [StructuredTool] from a function.
  ///
  /// - [name] is the unique name of the tool that clearly communicates its
  ///   purpose.
  /// - [description] is used to tell the model how/when/why to use the tool.
  ///   You can provide few-shot examples as a part of the description.
  /// - [func] is the function that will be called when the tool is run.
  /// - [inputJsonSchema] is the schema to parse and validate tool's input
  ///   arguments.
  /// - [returnDirect] whether to return the tool's output directly.
  ///   Setting this to true means that after the tool is called,
  ///   the AgentExecutor will stop looping.
  /// - [handleToolError] is a function that handles the content of the
  ///   [ToolException] thrown by the tool.
  factory StructuredTool.fromFunction({
    required final String name,
    required final String description,
    required final FutureOr<String> Function(I toolInput) func,
    required final Map<String, dynamic> inputJsonSchema,
    final bool returnDirect = false,
    final String Function(ToolException)? handleToolError,
  }) {
    return _StructuredToolFunc(
      name: name,
      description: description,
      func: func,
      inputJsonSchema: inputJsonSchema,
      returnDirect: returnDirect,
      handleToolError: handleToolError,
    );
  }
}

/// {@template structured_tool_func}
/// Implementation of [StructuredTool] that accepts a function as input.
/// Used in [StructuredTool.fromFunction].
/// {@endtemplate}
final class _StructuredToolFunc<I> extends StructuredTool<I> {
  /// {@macro structured_tool_func}
  _StructuredToolFunc({
    required super.name,
    required super.description,
    required this.func,
    required super.inputJsonSchema,
    super.returnDirect = false,
    super.handleToolError,
  });

  /// The function to run when the tool is called.
  final FutureOr<String> Function(I toolInput) func;

  @override
  FutureOr<String> runInternal({required final I toolInput}) {
    return func(toolInput);
  }
}

/// {@template tool}
/// This class wraps functions that accept a single string input and returns a
/// string output.
/// {@endtemplate}
abstract base class Tool extends BaseTool<String> {
  /// {@macro tool}
  Tool({
    required super.name,
    required super.description,
    super.returnDirect = false,
    super.handleToolError,
  }) : super(inputJsonSchema: const {'type': 'string'});

  /// Creates a [StructuredTool] from a function.
  ///
  /// - [name] is the unique name of the tool that clearly communicates its
  ///   purpose.
  /// - [description] is used to tell the model how/when/why to use the tool.
  ///   You can provide few-shot examples as a part of the description.
  /// - [func] is the function that will be called when the tool is run.
  /// - [returnDirect] whether to return the tool's output directly.
  ///   Setting this to true means that after the tool is called,
  ///   the AgentExecutor will stop looping.
  /// - [handleToolError] is a function that handles the content of the
  ///   [ToolException] thrown by the tool.
  factory Tool.fromFunction({
    required final String name,
    required final String description,
    required final FutureOr<String> Function(String toolInput) func,
    final bool returnDirect = false,
    final String Function(ToolException)? handleToolError,
  }) {
    return _ToolFunc(
      name: name,
      description: description,
      func: func,
      returnDirect: returnDirect,
      handleToolError: handleToolError,
    );
  }
}

/// {@template tool_func}
/// Implementation of [Tool] that accepts a function as input.
/// Used in [Tool.fromFunction].
/// {@endtemplate}
final class _ToolFunc extends Tool {
  /// {@macro tool_func}
  _ToolFunc({
    required super.name,
    required super.description,
    required this.func,
    super.returnDirect = false,
    super.handleToolError,
  });

  final FutureOr<String> Function(String toolInput) func;

  @override
  FutureOr<String> runInternal({required final String toolInput}) {
    return func(toolInput);
  }
}
