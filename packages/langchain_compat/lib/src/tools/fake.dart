import 'dart:async';

import 'string.dart';
import 'types.dart';

/// {@template fake_tool}
/// Fake tool for testing.
/// It just returns the input string as is.
/// {@endtemplate}
final class FakeTool extends StringTool<ToolOptions> {
  /// {@macro fake_tool}
  FakeTool()
    : super(
        name: 'take',
        description: 'Returns the input string as is.',
        inputDescription: 'A string',
      );

  @override
  Future<String> invokeInternal(
    String toolInput, {
    ToolOptions? options,
  }) async {
    try {
      return toolInput;
    } on Exception catch (e) {
      return "I don't know how to do that.";
    }
  }
}
