import 'dart:async';

import '../executors.dart';
import 'base.dart';

/// {@template exception_tool}
/// A tool used when the agent throws an [OutputParserException].
///
/// Returns the output of [AgentExecutor.handleParsingErrors].
/// {@endtemplate}
final class ExceptionTool extends Tool {
  /// {@macro exception_tool}
  ExceptionTool()
      : super(
          name: toolName,
          description: 'Called when the agent throws an OutputParserException',
        );

  /// The name of the tool.
  static const toolName = '_exception';

  @override
  FutureOr<String> runInternalString(final String toolInput) {
    return toolInput;
  }
}
