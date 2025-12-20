import '../copy_with_sentinel.dart';
import 'file_search.dart';
import 'function_declaration.dart';
import 'mcp_server.dart';

/// Tool that the model may use to generate a response.
class Tool {
  /// List of function declarations.
  final List<FunctionDeclaration>? functionDeclarations;

  /// Code execution capability.
  final Map<String, dynamic>? codeExecution;

  /// Google search capability.
  final Map<String, dynamic>? googleSearch;

  /// File search tool that retrieves knowledge from file search stores.
  final FileSearch? fileSearch;

  /// List of MCP servers that can be called by the model.
  final List<McpServer>? mcpServers;

  /// Creates a [Tool].
  const Tool({
    this.functionDeclarations,
    this.codeExecution,
    this.googleSearch,
    this.fileSearch,
    this.mcpServers,
  });

  /// Creates a [Tool] from JSON.
  factory Tool.fromJson(Map<String, dynamic> json) => Tool(
    functionDeclarations: json['functionDeclarations'] != null
        ? (json['functionDeclarations'] as List)
              .map(
                (e) => FunctionDeclaration.fromJson(e as Map<String, dynamic>),
              )
              .toList()
        : null,
    codeExecution: json['codeExecution'] as Map<String, dynamic>?,
    googleSearch: json['googleSearch'] as Map<String, dynamic>?,
    fileSearch: json['fileSearch'] != null
        ? FileSearch.fromJson(json['fileSearch'] as Map<String, dynamic>)
        : null,
    mcpServers: json['mcpServers'] != null
        ? (json['mcpServers'] as List)
              .map((e) => McpServer.fromJson(e as Map<String, dynamic>))
              .toList()
        : null,
  );

  /// Converts to JSON.
  Map<String, dynamic> toJson() => {
    if (functionDeclarations != null)
      'functionDeclarations': functionDeclarations!
          .map((e) => e.toJson())
          .toList(),
    if (codeExecution != null) 'codeExecution': codeExecution,
    if (googleSearch != null) 'googleSearch': googleSearch,
    if (fileSearch != null) 'fileSearch': fileSearch!.toJson(),
    if (mcpServers != null)
      'mcpServers': mcpServers!.map((e) => e.toJson()).toList(),
  };

  /// Creates a copy with replaced values.
  Tool copyWith({
    Object? functionDeclarations = unsetCopyWithValue,
    Object? codeExecution = unsetCopyWithValue,
    Object? googleSearch = unsetCopyWithValue,
    Object? fileSearch = unsetCopyWithValue,
    Object? mcpServers = unsetCopyWithValue,
  }) {
    return Tool(
      functionDeclarations: functionDeclarations == unsetCopyWithValue
          ? this.functionDeclarations
          : functionDeclarations as List<FunctionDeclaration>?,
      codeExecution: codeExecution == unsetCopyWithValue
          ? this.codeExecution
          : codeExecution as Map<String, dynamic>?,
      googleSearch: googleSearch == unsetCopyWithValue
          ? this.googleSearch
          : googleSearch as Map<String, dynamic>?,
      fileSearch: fileSearch == unsetCopyWithValue
          ? this.fileSearch
          : fileSearch as FileSearch?,
      mcpServers: mcpServers == unsetCopyWithValue
          ? this.mcpServers
          : mcpServers as List<McpServer>?,
    );
  }
}
