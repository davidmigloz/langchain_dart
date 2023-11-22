import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('BaseTool tests', () {
    test('StructuredTool.fromFunction', () async {
      final echoTool = BaseTool.fromFunction(
        name: 'echo-int',
        description: 'echo-int',
        func: (
          final Map<String, dynamic> toolInput, {
          final ToolOptions? options,
        }) =>
            toolInput['input'].toString(),
        inputJsonSchema: const {'type': 'integer'},
      );

      expect(echoTool.name, 'echo-int');
      expect(echoTool.description, 'echo-int');
      expect(echoTool.run({'input': 1}), '1');
    });

    test('Tool.fromFunction', () async {
      final echoTool = Tool.fromFunction(
        name: 'echo',
        description: 'echo',
        func: (
          final String toolInput, {
          final ToolOptions? options,
        }) =>
            toolInput,
      );

      expect(echoTool.name, 'echo');
      expect(echoTool.description, 'echo');
      expect(echoTool.run({'input': 'Hello world!'}), 'Hello world!');
    });
  });
}
