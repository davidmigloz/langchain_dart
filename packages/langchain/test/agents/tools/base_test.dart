import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('BaseTool tests', () {
    test('StructuredTool.fromFunction', () {
      final echoTool = StructuredTool.fromFunction(
        name: 'echo-int',
        description: 'echo-int',
        func: (final int toolInput) => toolInput.toString(),
        inputJsonSchema: const {'type': 'integer'},
      );

      expect(echoTool.name, 'echo-int');
      expect(echoTool.description, 'echo-int');
      expect(echoTool.run(toolInput: 1), '1');
    });

    test('Tool.fromFunction', () {
      final echoTool = Tool.fromFunction(
        name: 'echo',
        description: 'echo',
        func: (final String toolInput) => toolInput,
      );

      expect(echoTool.name, 'echo');
      expect(echoTool.description, 'echo');
      expect(echoTool.run(toolInput: 'Hello world!'), 'Hello world!');
    });

    test('Tool.fromFunction test', () {
      final echoTool = Tool.fromFunction(
        name: 'echo',
        description: 'echo',
        func: (final String toolInput) => toolInput,
      );

      expect(echoTool.name, 'echo');
      expect(echoTool.description, 'echo');
      expect(echoTool.run(toolInput: 'Hello world!'), 'Hello world!');
    });
  });
}
