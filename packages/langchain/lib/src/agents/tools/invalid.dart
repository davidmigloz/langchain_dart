import 'dart:async';

import 'base.dart';

/// {@template invalid_tool}
/// Tool that is run when invalid tool name is encountered by agent
/// {@endtemplate}
final class InvalidTool extends Tool {
  /// {@macro invalid_tool}
  InvalidTool()
      : super(
          name: 'invalid_tool',
          description: 'Called when tool name is invalid.',
        );

  @override
  FutureOr<String> runInternalString(final String toolInput) {
    return '$toolInput is not a valid tool, try another one.';
  }
}
