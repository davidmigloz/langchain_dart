import '../exceptions/base.dart';
import '../langchain/types.dart';

/// {@template tool_options}
/// Generation options to pass into the Tool.
/// {@endtemplate}
class ToolOptions extends BaseLangChainOptions {
  /// {@macro tool_options}
  const ToolOptions({
    super.concurrencyLimit,
  });
}

/// {@template tool_exception}
/// An exception that a tool throws when execution error occurs.
///
/// When this exception is thrown, the agent will not stop working, but will
/// handle the exception according to the [BaseTool.handleToolError] variable
/// of the tool, and the processing result will be returned to the agent as
/// observation, and printed in red on the console.
/// {@endtemplate}
final class ToolException extends LangChainException {
  /// {@macro tool_exception}
  const ToolException({
    super.message = '',
  }) : super(code: 'tool');
}
