import '../copy_with_sentinel.dart';
import 'function_declaration.dart';

/// Tool that the model may use to generate a response.
class Tool {
  /// List of function declarations.
  final List<FunctionDeclaration>? functionDeclarations;

  /// Code execution capability.
  final Map<String, dynamic>? codeExecution;

  /// Google search capability.
  final Map<String, dynamic>? googleSearch;

  /// Creates a [Tool].
  const Tool({
    this.functionDeclarations,
    this.codeExecution,
    this.googleSearch,
  });

  /// Creates a [Tool] from JSON.
  factory Tool.fromJson(Map<String, dynamic> json) => Tool(
        functionDeclarations: json['functionDeclarations'] != null
            ? (json['functionDeclarations'] as List)
                .map(
                  (e) =>
                      FunctionDeclaration.fromJson(e as Map<String, dynamic>),
                )
                .toList()
            : null,
        codeExecution: json['codeExecution'] as Map<String, dynamic>?,
        googleSearch: json['googleSearch'] as Map<String, dynamic>?,
      );

  /// Converts to JSON.
  Map<String, dynamic> toJson() => {
        if (functionDeclarations != null)
          'functionDeclarations':
              functionDeclarations!.map((e) => e.toJson()).toList(),
        if (codeExecution != null) 'codeExecution': codeExecution,
        if (googleSearch != null) 'googleSearch': googleSearch,
      };

  /// Creates a copy with replaced values.
  Tool copyWith({
    Object? functionDeclarations = unsetCopyWithValue,
    Object? codeExecution = unsetCopyWithValue,
    Object? googleSearch = unsetCopyWithValue,
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
    );
  }
}
