import 'dart:async';

import '../../tools.dart';

/// {@template fake_tool}
/// Fake tool for testing.
/// It just returns the input string as is.
/// {@endtemplate}
final class FakeTool extends Tool<ToolOptions> {
  /// {@macro fake_tool}
  FakeTool()
      : super(
          name: 'take',
          description: 'Returns the input string as is.',
          inputDescription: 'A string',
        );

  @override
  FutureOr<String> runInternalString(
    final String toolInput, {
    final ToolOptions? options,
  }) {
    try {
      return toolInput;
    } catch (e) {
      return "I don't know how to do that.";
    }
  }
}
