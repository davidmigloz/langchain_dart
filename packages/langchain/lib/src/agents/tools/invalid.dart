import 'dart:async';

import 'base.dart';
import 'models/models.dart';

/// {@template invalid_tool}
/// Tool that is run when invalid tool name is encountered by agent
/// {@endtemplate}
final class InvalidTool extends Tool<ToolOptions> {
  /// {@macro invalid_tool}
  InvalidTool()
      : super(
          name: 'invalid_tool',
          description: 'Called when tool name is invalid.',
        );

  @override
  FutureOr<String> runInternalString(
    final String toolInput, {
    final ToolOptions? options,
  }) {
    return '$toolInput is not a valid tool, try another one.';
  }
}
