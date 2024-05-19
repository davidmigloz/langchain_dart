import 'package:langchain_core/tools.dart';
import 'package:test/test.dart';

void main() {
  group('StringTool tests', () {
    test('StringTool.fromFunction', () async {
      final echoTool = StringTool.fromFunction(
        name: 'echo',
        description: 'echo',
        func: (String input) => input,
      );

      expect(echoTool.name, 'echo');
      expect(echoTool.description, 'echo');
      expect(await echoTool.invoke('Hello world!'), 'Hello world!');
    });
  });
}
