import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('SimpleMemory tests', () {
    test('Test simple memory', () async {
      const memories = {
        'foo': 'bar',
        'bar': 'foo',
      };
      const memory = SimpleMemory(memories: memories);
      expect(await memory.loadMemoryVariables(), memories);
      await memory.saveContext(
        inputValues: {
          'foo': 'bar2',
          'bar': 'foo2',
        },
        outputValues: {
          'foo': 'bar',
        },
      );
      expect(await memory.loadMemoryVariables(), memories);
      await memory.clear();
      expect(await memory.loadMemoryVariables(), memories);
    });
  });
}
