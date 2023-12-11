// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes
import 'dart:async';

import 'package:meta/meta.dart';

import '../../core/core.dart';
import '../../model_io/chat_models/models/models.dart';
import 'models/models.dart';

/// {@template base_tool}
/// Base class LangChain tools must extend.
/// The input to the tool needs to be described by [inputJsonSchema].
/// {@endtemplate}
abstract base class BaseTool<Options extends ToolOptions>
    extends BaseLangChain<Map<String, dynamic>, Options, String> {
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
  /// Following the [JSON Schema specification](https://json-schema.org).
  final Map<String, dynamic> inputJsonSchema;

  /// Whether to return the tool's output directly.
  /// Setting this to true means that after the tool is called,
  /// the AgentExecutor will stop looping.
  final bool returnDirect;

  /// Handle the content of the [ToolException] thrown by the tool.
  final String Function(ToolException)? handleToolError;

  /// Creates a [BaseTool] from a function.
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
  static BaseTool fromFunction<Options extends ToolOptions>({
    required final String name,
    required final String description,
    required final FutureOr<String> Function(
      Map<String, dynamic> toolInput, {
      Options? options,
    }) func,
    required final Map<String, dynamic> inputJsonSchema,
    final bool returnDirect = false,
    final String Function(ToolException)? handleToolError,
  }) {
    return _BaseToolFunc<Options>(
      name: name,
      description: description,
      func: func,
      inputJsonSchema: inputJsonSchema,
      returnDirect: returnDirect,
      handleToolError: handleToolError,
    );
  }

  /// Runs the tool.
  ///
  /// - [input] is the input to the tool.
  /// - [options] is the options to pass to the tool.
  @override
  Future<String> invoke(
    final Map<String, dynamic> input, {
    final Options? options,
  }) async {
    return run(input);
  }

  /// Runs the tool.
  ///
  /// - [toolInput] the input to the tool.
  /// - [options] the options to pass to the tool.
  FutureOr<String> run(
    final Map<String, dynamic> toolInput, {
    final Options? options,
  }) {
    try {
      return runInternal(toolInput);
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
  FutureOr<String> runInternal(
    final Map<String, dynamic> toolInput, {
    final Options? options,
  });

  /// Runs the tool (same as [run] but using callable class syntax).
  ///
  /// - [toolInput] the input to the tool.
  /// - [options] the options to pass to the tool.
  FutureOr<String> call({
    required final Map<String, dynamic> toolInput,
    final Options? options,
  }) {
    return run(toolInput, options: options);
  }

  /// Converts the tool to a [ChatFunction].
  ChatFunction toChatFunction() {
    return ChatFunction(
      name: name,
      description: description,
      parameters: inputJsonSchema,
    );
  }

  @override
  bool operator ==(covariant final BaseTool other) =>
      identical(this, other) || name == other.name;

  @override
  int get hashCode => name.hashCode;
}

/// {@template base_tool_func}
/// A tool that accepts a function as input.
/// Used in [BaseTool.fromFunction].
/// {@endtemplate}
final class _BaseToolFunc<Options extends ToolOptions>
    extends BaseTool<Options> {
  /// {@macro base_tool_func}
  _BaseToolFunc({
    required super.name,
    required super.description,
    required this.func,
    required super.inputJsonSchema,
    super.returnDirect = false,
    super.handleToolError,
  });

  /// The function to run when the tool is called.
  final FutureOr<String> Function(
    Map<String, dynamic> toolInput, {
    Options? options,
  }) func;

  @override
  FutureOr<String> runInternal(
    final Map<String, dynamic> toolInput, {
    final Options? options,
  }) {
    return func(toolInput, options: options);
  }
}

/// {@template tool}
/// This class wraps functions that accept a single string input and returns a
/// string output.
/// {@endtemplate}
abstract base class Tool<Options extends ToolOptions>
    extends BaseTool<Options> {
  /// {@macro tool}
  Tool({
    required super.name,
    required super.description,
    final String inputDescription = 'The input to the tool',
    super.returnDirect = false,
    super.handleToolError,
  }) : super(
          inputJsonSchema: {
            'type': 'object',
            'properties': {
              inputVar: {
                'type': 'string',
                'description': inputDescription,
              },
            },
            'required': ['input'],
          },
        );

  /// The name of the input variable.
  static const inputVar = 'input';

  /// Creates a [Tool] from a function.
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
  static Tool fromFunction<Options extends ToolOptions>({
    required final String name,
    required final String description,
    final String inputDescription = 'The input to the tool',
    required final FutureOr<String> Function(
      String toolInput, {
      Options? options,
    }) func,
    final bool returnDirect = false,
    final String Function(ToolException)? handleToolError,
  }) {
    return _ToolFunc<Options>(
      name: name,
      description: description,
      inputDescription: inputDescription,
      func: func,
      returnDirect: returnDirect,
      handleToolError: handleToolError,
    );
  }

  @override
  FutureOr<String> runInternal(
    final Map<String, dynamic> toolInput, {
    final Options? options,
  }) {
    return runInternalString(toolInput[Tool.inputVar], options: options);
  }

  /// Actual implementation of [run] method logic with string input.
  @protected
  FutureOr<String> runInternalString(
    final String toolInput, {
    final Options? options,
  });
}

/// {@template tool_func}
/// Implementation of [Tool] that accepts a function as input.
/// Used in [Tool.fromFunction].
/// {@endtemplate}
final class _ToolFunc<Options extends ToolOptions> extends Tool<Options> {
  /// {@macro tool_func}
  _ToolFunc({
    required super.name,
    required super.description,
    super.inputDescription,
    required this.func,
    super.returnDirect = false,
    super.handleToolError,
  });

  final FutureOr<String> Function(
    String toolInput, {
    Options? options,
  }) func;

  @override
  FutureOr<String> runInternalString(
    final String toolInput, {
    final Options? options,
  }) {
    return func(toolInput, options: options);
  }
}
