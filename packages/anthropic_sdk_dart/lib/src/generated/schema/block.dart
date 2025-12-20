// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: Block
// ==========================================

/// A block of content in a message.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class Block with _$Block {
  const Block._();

  // ------------------------------------------
  // UNION: TextBlock
  // ------------------------------------------

  /// A block of text content.

  @FreezedUnionValue('text')
  const factory Block.text({
    /// The text content.
    required String text,

    /// The type of content block.
    @Default('text') String type,

    /// The cache control settings.
    @JsonKey(name: 'cache_control', includeIfNull: false)
    CacheControlEphemeral? cacheControl,
  }) = TextBlock;

  // ------------------------------------------
  // UNION: ImageBlock
  // ------------------------------------------

  /// A block of image content.

  @FreezedUnionValue('image')
  const factory Block.image({
    /// The source of an image block.
    /// Any of: [Base64ImageSource], [UrlImageSource]
    required ImageBlockSource source,

    /// The type of content block.
    @Default('image') String type,

    /// The cache control settings.
    @JsonKey(name: 'cache_control', includeIfNull: false)
    CacheControlEphemeral? cacheControl,
  }) = ImageBlock;

  // ------------------------------------------
  // UNION: DocumentBlock
  // ------------------------------------------

  /// A block of document content. Documents can be provided as base64-encoded data,
  /// plain text, URLs, or references to content blocks.

  @FreezedUnionValue('document')
  const factory Block.document({
    /// The type of content block.
    required String type,

    /// The source of a document block.
    /// Any of: [Base64PdfSource], [PlainTextSource], [ContentBlockSource], [UrlPdfSource]
    required DocumentBlockSource source,

    /// The title of the document.
    @JsonKey(includeIfNull: false) String? title,

    /// Additional context about the document.
    @JsonKey(includeIfNull: false) String? context,

    /// Configuration for document citations.
    @JsonKey(includeIfNull: false) CitationsConfig? citations,

    /// The cache control settings.
    @JsonKey(name: 'cache_control', includeIfNull: false)
    CacheControlEphemeral? cacheControl,
  }) = DocumentBlock;

  // ------------------------------------------
  // UNION: ToolUseBlock
  // ------------------------------------------

  /// The tool the model wants to use.

  @FreezedUnionValue('tool_use')
  const factory Block.toolUse({
    /// A unique identifier for this particular tool use block.
    /// This will be used to match up the tool results later.
    required String id,

    /// The name of the tool being used.
    required String name,

    /// An object containing the input being passed to the tool, conforming to the tool's `input_schema`.
    required Map<String, dynamic> input,

    /// The type of content block.
    @Default('tool_use') String type,

    /// The cache control settings.
    @JsonKey(name: 'cache_control', includeIfNull: false)
    CacheControlEphemeral? cacheControl,
  }) = ToolUseBlock;

  // ------------------------------------------
  // UNION: ToolResultBlock
  // ------------------------------------------

  /// The result of using a tool.

  @FreezedUnionValue('tool_result')
  const factory Block.toolResult({
    /// The `id` of the tool use request this is a result for.
    @JsonKey(name: 'tool_use_id') required String toolUseId,

    /// The result of the tool, as a string (e.g. `"content": "15 degrees"`)
    /// or list of nested content blocks (e.g. `"content": [{"type": "text", "text": "15 degrees"}]`).
    /// These content blocks can use the text or image types.
    @_ToolResultBlockContentConverter() required ToolResultBlockContent content,

    /// Set to `true` if the tool execution resulted in an error.
    @JsonKey(name: 'is_error', includeIfNull: false) bool? isError,

    /// The type of content block.
    @Default('tool_result') String type,

    /// The cache control settings.
    @JsonKey(name: 'cache_control', includeIfNull: false)
    CacheControlEphemeral? cacheControl,
  }) = ToolResultBlock;

  // ------------------------------------------
  // UNION: ThinkingBlock
  // ------------------------------------------

  /// A block containing Claude's internal thinking process. This block type
  /// appears when extended thinking is enabled via the `thinking` parameter.

  @FreezedUnionValue('thinking')
  const factory Block.thinking({
    /// The type of content block.
    required ThinkingBlockType type,

    /// The text of Claude's internal reasoning and thinking process. This shows
    /// how Claude approached and analyzed the problem before providing a final answer.
    required String thinking,

    /// Optional cryptographic signature for the thinking block to verify its
    /// authenticity and integrity.
    @JsonKey(includeIfNull: false) String? signature,

    /// The cache control settings.
    @JsonKey(name: 'cache_control', includeIfNull: false)
    CacheControlEphemeral? cacheControl,
  }) = ThinkingBlock;

  // ------------------------------------------
  // UNION: RedactedThinkingBlock
  // ------------------------------------------

  /// A block representing thinking content that has been redacted for security
  /// or safety reasons. This block type appears when Claude's internal thinking
  /// process contained content that was redacted.

  @FreezedUnionValue('redacted_thinking')
  const factory Block.redactedThinking({
    /// The type of content block.
    required RedactedThinkingBlockType type,

    /// Encrypted or opaque data representing the redacted thinking content.
    /// This data cannot be decrypted by the client.
    required String data,
  }) = RedactedThinkingBlock;

  // ------------------------------------------
  // UNION: ServerToolUseBlock
  // ------------------------------------------

  /// A block representing server-side tool use. This is used for tools that are
  /// executed by the API server rather than the client, such as web search.

  @FreezedUnionValue('server_tool_use')
  const factory Block.serverToolUse({
    /// The type of content block.
    required String type,

    /// Unique identifier for this tool use instance.
    required String id,

    /// The name of the server tool being used.
    required String name,

    /// The input parameters for the tool.
    required Map<String, dynamic> input,
  }) = ServerToolUseBlock;

  // ------------------------------------------
  // UNION: WebSearchToolResultBlock
  // ------------------------------------------

  /// A block containing web search results from the web search tool.

  @FreezedUnionValue('web_search_tool_result')
  const factory Block.webSearchToolResult({
    /// The type of content block.
    required String type,

    /// The ID of the tool use that generated these results.
    @JsonKey(name: 'tool_use_id') required String toolUseId,

    /// The search results or an error.
    @_WebSearchToolResultBlockContentConverter()
    required WebSearchToolResultBlockContent content,
  }) = WebSearchToolResultBlock;

  // ------------------------------------------
  // UNION: MCPToolUseBlock
  // ------------------------------------------

  /// A block representing MCP (Model Context Protocol) tool use.

  @FreezedUnionValue('mcp_tool_use')
  const factory Block.mCPToolUse({
    /// The type of content block.
    required String type,

    /// Unique identifier for this MCP tool use.
    required String id,

    /// The name of the MCP server.
    @JsonKey(name: 'server_name') required String serverName,

    /// The name of the MCP tool being used.
    required String name,

    /// The input parameters for the MCP tool.
    required Map<String, dynamic> input,
  }) = MCPToolUseBlock;

  // ------------------------------------------
  // UNION: MCPToolResultBlock
  // ------------------------------------------

  /// A block containing the result of an MCP tool execution.

  @FreezedUnionValue('mcp_tool_result')
  const factory Block.mCPToolResult({
    /// The type of content block.
    required String type,

    /// The ID of the MCP tool use that generated this result.
    @JsonKey(name: 'tool_use_id') required String toolUseId,

    /// Whether the tool execution resulted in an error.
    @JsonKey(name: 'is_error', includeIfNull: false) bool? isError,

    /// The content of the tool result.
    @JsonKey(includeIfNull: false) List<MCPToolResultContent>? content,
  }) = MCPToolResultBlock;

  // ------------------------------------------
  // UNION: SearchResultBlock
  // ------------------------------------------

  /// A search result block containing source, title, and content from search operations.

  @FreezedUnionValue('search_result')
  const factory Block.searchResult({
    /// The type of content block.
    required String type,

    /// The source URL or identifier.
    required String source,

    /// The title of the search result.
    required String title,

    /// The content of the search result.
    required List<TextBlock> content,

    /// Configuration for document citations.
    @JsonKey(includeIfNull: false) CitationsConfig? citations,

    /// The cache control settings.
    @JsonKey(name: 'cache_control', includeIfNull: false)
    CacheControlEphemeral? cacheControl,
  }) = SearchResultBlock;

  // ------------------------------------------
  // UNION: CodeExecutionToolResultBlock
  // ------------------------------------------

  /// A block containing the result of code execution.

  @FreezedUnionValue('code_execution_tool_result')
  const factory Block.codeExecutionToolResult({
    /// The type of content block.
    required String type,

    /// The ID of the tool use that generated this result.
    @JsonKey(name: 'tool_use_id') required String toolUseId,

    /// The code execution result or an error.
    /// Any of: [CodeExecutionResultBlock], [CodeExecutionToolResultError]
    required UnionSchema content,
  }) = CodeExecutionToolResultBlock;

  // ------------------------------------------
  // UNION: ContainerUploadBlock
  // ------------------------------------------

  /// A block representing a file uploaded to a container.

  @FreezedUnionValue('container_upload')
  const factory Block.containerUpload({
    /// The type of content block.
    required String type,

    /// The unique identifier for the uploaded file.
    @JsonKey(name: 'file_id') required String fileId,

    /// The name of the uploaded file.
    required String filename,

    /// The size of the file in bytes.
    @JsonKey(name: 'file_size') required int fileSize,

    /// The content of the file.
    @JsonKey(includeIfNull: false) String? content,
  }) = ContainerUploadBlock;

  /// Object construction from a JSON representation
  factory Block.fromJson(Map<String, dynamic> json) => _$BlockFromJson(json);
}

// ==========================================
// ENUM: BlockEnumType
// ==========================================

enum BlockEnumType {
  @JsonValue('text')
  text,
  @JsonValue('image')
  image,
  @JsonValue('document')
  document,
  @JsonValue('tool_use')
  toolUse,
  @JsonValue('tool_result')
  toolResult,
  @JsonValue('thinking')
  thinking,
  @JsonValue('redacted_thinking')
  redactedThinking,
  @JsonValue('server_tool_use')
  serverToolUse,
  @JsonValue('web_search_tool_result')
  webSearchToolResult,
  @JsonValue('mcp_tool_use')
  mcpToolUse,
  @JsonValue('mcp_tool_result')
  mcpToolResult,
  @JsonValue('search_result')
  searchResult,
  @JsonValue('code_execution_tool_result')
  codeExecutionToolResult,
  @JsonValue('container_upload')
  containerUpload,
}

// ==========================================
// CLASS: ToolResultBlockContent
// ==========================================

/// The result of the tool, as a string (e.g. `"content": "15 degrees"`)
/// or list of nested content blocks (e.g. `"content": [{"type": "text", "text": "15 degrees"}]`).
/// These content blocks can use the text or image types.
@freezed
sealed class ToolResultBlockContent with _$ToolResultBlockContent {
  const ToolResultBlockContent._();

  /// An array of content blocks.
  const factory ToolResultBlockContent.blocks(List<Block> value) =
      ToolResultBlockContentBlocks;

  /// A single text block.
  const factory ToolResultBlockContent.text(String value) =
      ToolResultBlockContentText;

  /// Object construction from a JSON representation
  factory ToolResultBlockContent.fromJson(Map<String, dynamic> json) =>
      _$ToolResultBlockContentFromJson(json);
}

/// Custom JSON converter for [ToolResultBlockContent]
class _ToolResultBlockContentConverter
    implements JsonConverter<ToolResultBlockContent, Object?> {
  const _ToolResultBlockContentConverter();

  @override
  ToolResultBlockContent fromJson(Object? data) {
    if (data is List && data.every((item) => item is Map)) {
      return ToolResultBlockContentBlocks(
        data
            .map((i) => Block.fromJson(i as Map<String, dynamic>))
            .toList(growable: false),
      );
    }
    if (data is String) {
      return ToolResultBlockContentText(data);
    }
    throw Exception('Unexpected value for ToolResultBlockContent: $data');
  }

  @override
  Object? toJson(ToolResultBlockContent data) {
    return switch (data) {
      ToolResultBlockContentBlocks(value: final v) => v,
      ToolResultBlockContentText(value: final v) => v,
    };
  }
}

// ==========================================
// ENUM: ThinkingBlockType
// ==========================================

/// The type of content block.
enum ThinkingBlockType {
  @JsonValue('thinking')
  thinking,
}

// ==========================================
// ENUM: RedactedThinkingBlockType
// ==========================================

/// The type of content block.
enum RedactedThinkingBlockType {
  @JsonValue('redacted_thinking')
  redactedThinking,
}

// ==========================================
// CLASS: WebSearchToolResultBlockContent
// ==========================================

/// The search results or an error.
@freezed
sealed class WebSearchToolResultBlockContent
    with _$WebSearchToolResultBlockContent {
  const WebSearchToolResultBlockContent._();

  /// No Description
  const factory WebSearchToolResultBlockContent.webSearchToolResultError(
    WebSearchToolResultError value,
  ) = WebSearchToolResultBlockContentWebSearchToolResultError;

  /// No Description
  const factory WebSearchToolResultBlockContent.listWebSearchResultBlock(
    List<WebSearchResultBlock> value,
  ) = WebSearchToolResultBlockContentListWebSearchResultBlock;

  /// Object construction from a JSON representation
  factory WebSearchToolResultBlockContent.fromJson(Map<String, dynamic> json) =>
      _$WebSearchToolResultBlockContentFromJson(json);
}

/// Custom JSON converter for [WebSearchToolResultBlockContent]
class _WebSearchToolResultBlockContentConverter
    implements JsonConverter<WebSearchToolResultBlockContent, Object?> {
  const _WebSearchToolResultBlockContentConverter();

  @override
  WebSearchToolResultBlockContent fromJson(Object? data) {
    if (data is Map<String, dynamic>) {
      try {
        return WebSearchToolResultBlockContentWebSearchToolResultError(
          WebSearchToolResultError.fromJson(data),
        );
      } catch (e) {}
    }
    if (data is List && data.every((item) => item is Map)) {
      return WebSearchToolResultBlockContentListWebSearchResultBlock(
        data
            .map(
              (i) => WebSearchResultBlock.fromJson(i as Map<String, dynamic>),
            )
            .toList(growable: false),
      );
    }
    throw Exception(
      'Unexpected value for WebSearchToolResultBlockContent: $data',
    );
  }

  @override
  Object? toJson(WebSearchToolResultBlockContent data) {
    return switch (data) {
      WebSearchToolResultBlockContentWebSearchToolResultError(value: final v) =>
        v.toJson(),
      WebSearchToolResultBlockContentListWebSearchResultBlock(value: final v) =>
        v,
    };
  }
}
