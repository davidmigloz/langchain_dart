// ignore_for_file: unused_element
import 'package:langchain/src/chains/chains.dart';
import 'package:langchain/src/memory/memory.dart';
import 'package:test/test.dart';

void main() {
  group('BaseChain tests', () {
    test('Test base chain input logic - input map', () async {
      final chain = _FakeChain();
      final res = await chain.call({'input': 'test'});
      expect(res, equals({'input': 'test', 'output': 'test'}));
    });

    test('Test base chain input logic - input map - only outputs', () async {
      final chain = _FakeChain();
      final res = await chain.call({'input': 'test'}, returnOnlyOutputs: true);
      expect(res, equals({'output': 'test'}));
    });

    test('Test base chain input logic - explicit input keys', () async {
      final chain = _FakeChain(inputVariables: {'input'});
      final res = await chain.call({'input': 'test'});
      expect(res, equals({'input': 'test', 'output': 'test'}));
    });

    test('Test base chain input logic - explicit input keys - invalid input',
        () async {
      final chain = _FakeChain(inputVariables: {'input'});
      expect(
        () => chain.call({'inputInvalid': 'test'}),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('Test base chain input logic - explicit output keys', () async {
      final chain = _FakeChain(outputVariables: {'output'});
      final res = await chain.call({'input': 'test'});
      expect(res, equals({'input': 'test', 'output': 'test'}));
    });

    test('Test base chain input logic - explicit output keys - invalid output',
        () async {
      final chain = _FakeChain(outputVariables: {'outputOther'});
      expect(
        () => chain.call({'input': 'test'}),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('Test base chain input logic - direct input', () async {
      final chain = _FakeChain();
      final res = await chain.call('test');
      expect(res, equals({'input': 'test', 'output': 'test'}));
    });

    test('Test base chain input logic - direct input with explicit input key',
        () async {
      final chain = _FakeChain(inputVariables: {'inputDirect'});
      final res = await chain.call('test');
      expect(res, equals({'inputDirect': 'test', 'output': 'test'}));
    });

    test('Test base chain input logic - with memory', () async {
      final memory = ConversationBufferMemory();
      await memory.saveContext(
        inputValues: {'input': 'test1'},
        outputValues: {'output': 'test1'},
      );
      final chain = _FakeChain(memory: memory);
      final res1 = await chain.call({'input': 'test2'});
      expect(
        res1,
        equals(
          {
            'input': 'test2',
            'history': 'Human: test1\nAI: test1',
            'output': 'test2',
          },
        ),
      );
      final res2 = await chain.call({'input': 'test3'});
      expect(
        res2,
        equals(
          {
            'input': 'test3',
            'history': 'Human: test1\nAI: test1\n'
                'Human: test2\nAI: test2',
            'output': 'test3',
          },
        ),
      );
    });
  });
}

class _FakeChain extends BaseChain {
  _FakeChain({
    this.inputVariables = const {},
    this.outputVariables = const {},
    super.memory,
  });

  final Set<String> inputVariables;

  final Set<String> outputVariables;

  @override
  String get chainType => 'fake_chain';

  @override
  Set<String> get inputKeys => inputVariables;

  @override
  Set<String> get outputKeys => outputVariables;

  @override
  Future<ChainValues> callInternal(final ChainValues inputs) async {
    return {
      for (final key in inputs.keys)
        key.replaceAll(inputVariables.firstOrNull ?? 'input', 'output'):
            inputs[key],
    };
  }
}
