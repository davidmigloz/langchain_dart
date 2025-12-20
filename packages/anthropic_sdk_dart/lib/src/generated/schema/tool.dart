// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: Tool
// ==========================================

/// A tool the model may use.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class Tool with _$Tool {
  const Tool._();

  // ------------------------------------------
  // UNION: ToolCustom
  // ------------------------------------------

  /// A custom tool the model may use.

  const factory Tool.custom({
    /// The type of tool.
    @JsonKey(includeIfNull: false) String? type,

    /// The name of the tool. Must match the regex `^[a-zA-Z0-9_-]{1,64}$`.
    required String name,

    /// Description of what this tool does.
    ///
    /// Tool descriptions should be as detailed as possible. The more information that
    /// the model has about what the tool is and how to use it, the better it will
    /// perform. You can use natural language descriptions to reinforce important
    /// aspects of the tool input JSON schema.
    @JsonKey(includeIfNull: false) String? description,

    /// [JSON schema](https://json-schema.org/) for this tool's input.
    ///
    /// This defines the shape of the `input` that your tool accepts and that the model
    /// will produce.
    @JsonKey(name: 'input_schema') required Map<String, dynamic> inputSchema,
  }) = ToolCustom;

  // ------------------------------------------
  // UNION: ToolComputerUse
  // ------------------------------------------

  /// A tool that uses a mouse and keyboard to interact with a computer, and take screenshots.

  @FreezedUnionValue('computer_20241022')
  const factory Tool.computerUse({
    /// The type of tool.
    @Default('computer_20241022') String type,

    /// The name of the tool.
    @Default('computer') String name,

    /// The cache control settings.
    @JsonKey(name: 'cache_control', includeIfNull: false)
    CacheControlEphemeral? cacheControl,

    /// The width of the display in pixels.
    @JsonKey(name: 'display_width_px') required int displayWidthPx,

    /// The height of the display in pixels.
    @JsonKey(name: 'display_height_px') required int displayHeightPx,

    /// The number of the display to use.
    @JsonKey(name: 'display_number', includeIfNull: false) int? displayNumber,
  }) = ToolComputerUse;

  // ------------------------------------------
  // UNION: ToolTextEditor
  // ------------------------------------------

  /// A tool for viewing, creating and editing files.

  @FreezedUnionValue('text_editor_20241022')
  const factory Tool.textEditor({
    /// The type of tool.
    @Default('text_editor_20241022') String type,

    /// The name of the tool.
    @Default('str_replace_editor') String name,

    /// The cache control settings.
    @JsonKey(name: 'cache_control', includeIfNull: false)
    CacheControlEphemeral? cacheControl,
  }) = ToolTextEditor;

  // ------------------------------------------
  // UNION: ToolBash
  // ------------------------------------------

  /// A tool for running commands in a bash shell.

  @FreezedUnionValue('bash_20241022')
  const factory Tool.bash({
    /// The type of tool.
    @Default('bash_20241022') String type,

    /// The name of the tool.
    @Default('bash') String name,

    /// The cache control settings.
    @JsonKey(name: 'cache_control', includeIfNull: false)
    CacheControlEphemeral? cacheControl,
  }) = ToolBash;

  // ------------------------------------------
  // UNION: ToolWebSearch
  // ------------------------------------------

  /// A tool for searching the web.

  @FreezedUnionValue('web_search_20250305')
  const factory Tool.webSearch({
    /// The type of tool.
    required String type,

    /// The name of the tool.
    required String name,

    /// The cache control settings.
    @JsonKey(name: 'cache_control', includeIfNull: false)
    CacheControlEphemeral? cacheControl,

    /// Maximum number of times the tool can be used in the API request.
    @JsonKey(name: 'max_uses', includeIfNull: false) int? maxUses,

    /// If provided, only these domains will be included in results.
    /// Cannot be used alongside `blocked_domains`.
    @JsonKey(name: 'allowed_domains', includeIfNull: false)
    List<String>? allowedDomains,

    /// If provided, these domains will never appear in results.
    /// Cannot be used alongside `allowed_domains`.
    @JsonKey(name: 'blocked_domains', includeIfNull: false)
    List<String>? blockedDomains,

    /// User location information for web search.
    @JsonKey(name: 'user_location', includeIfNull: false)
    WebSearchUserLocation? userLocation,
  }) = ToolWebSearch;

  // ------------------------------------------
  // UNION: ToolCodeExecution
  // ------------------------------------------

  /// A tool for executing code in a sandboxed environment.

  @FreezedUnionValue('code_execution_20250522')
  const factory Tool.codeExecution({
    /// The type of tool.
    required String type,

    /// The name of the tool.
    required String name,

    /// The cache control settings.
    @JsonKey(name: 'cache_control', includeIfNull: false)
    CacheControlEphemeral? cacheControl,
  }) = ToolCodeExecution;

  // ------------------------------------------
  // UNION: ToolMcp
  // ------------------------------------------

  /// A tool representing an MCP (Model Context Protocol) server configuration.

  @FreezedUnionValue('mcp')
  const factory Tool.mcp({
    /// The type of tool.
    required String type,

    /// The name of the MCP tool.
    required String name,

    /// A label identifying the MCP server.
    @JsonKey(name: 'server_label') required String serverLabel,

    /// The URL of the MCP server.
    @JsonKey(name: 'server_url') required String serverUrl,

    /// List of allowed tool names from the MCP server.
    @JsonKey(name: 'allowed_tools', includeIfNull: false)
    List<String>? allowedTools,

    /// The cache control settings.
    @JsonKey(name: 'cache_control', includeIfNull: false)
    CacheControlEphemeral? cacheControl,
  }) = ToolMcp;

  /// Object construction from a JSON representation
  factory Tool.fromJson(Map<String, dynamic> json) => _$ToolFromJson(json);
}

// ==========================================
// ENUM: ToolEnumType
// ==========================================

enum ToolEnumType {
  @JsonValue('computer_20241022')
  computer20241022,
  @JsonValue('text_editor_20241022')
  textEditor20241022,
  @JsonValue('bash_20241022')
  bash20241022,
  @JsonValue('web_search_20250305')
  webSearch20250305,
  @JsonValue('code_execution_20250522')
  codeExecution20250522,
  @JsonValue('mcp')
  mcp,
}
