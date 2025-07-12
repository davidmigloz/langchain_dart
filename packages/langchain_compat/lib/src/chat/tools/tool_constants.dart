/// Constants related to tools and tool handling.

/// The name of the tool used for structured output via ToolOutput pattern.
/// This tool is used by providers that don't have native typed output support
/// (like Anthropic) to return structured JSON responses.
const String kReturnResultToolName = 'return_result';
