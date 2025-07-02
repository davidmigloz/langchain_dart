import '../../langchain_exception.dart';

/// An exception that a tool throws when execution error occurs.
///
/// When this exception is thrown, the agent will not stop working, but will
/// handle the exception according to the BaseTool.handleToolError variable
/// of the tool, and the processing result will be returned to the agent as
/// observation, and printed in red on the console.
final class ToolException extends LangChainException {
  /// Creates a [ToolException].
  const ToolException({super.message = ''});
}
