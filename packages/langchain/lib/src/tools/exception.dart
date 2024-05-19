import 'dart:async';

import 'package:langchain_core/tools.dart';

/// {@template exception_tool}
/// A tool used when the agent throws an [OutputParserException].
///
/// Returns the output of [AgentExecutor.handleParsingErrors].
/// {@endtemplate}
final class ExceptionTool extends StringTool<ToolOptions> {
  /// {@macro exception_tool}
  ExceptionTool()
      : super(
          name: toolName,
          description: 'Called when the agent throws an OutputParserException',
        );

  /// The name of the tool.
  static const toolName = '_exception';

  @override
  Future<String> invokeInternal(
    final String toolInput, {
    final ToolOptions? options,
  }) {
    return Future.value(toolInput);
  }
}
