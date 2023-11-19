import 'package:langchain/src/chains/chains.dart';
import 'package:langchain/src/memory/memory.dart';
import 'package:test/test.dart';

void main() {
  group('SequentialChain tests', () {
    test('Test sequential on single input chains', () async {
      final chain1 = _FakeChain(
        inputVariables: {'foo'},
        outputVariables: {'bar'},
      );
      final chain2 = _FakeChain(
        inputVariables: {'bar'},
        outputVariables: {'baz'},
      );
      final chain = SequentialChain(
        chains: [chain1, chain2],
        inputKeys: {'foo'},
      );
      final output = await chain({'foo': '123'});
      final expectedOutput = {'baz': '123foofoo', 'foo': '123'};
      expect(output, equals(expectedOutput));
    });

    test('Test sequential on multiple input chains', () async {
      final chain1 = _FakeChain(
        inputVariables: {'foo', 'test'},
        outputVariables: {'bar'},
      );
      final chain2 = _FakeChain(
        inputVariables: {'bar', 'foo'},
        outputVariables: {'baz'},
      );
      final chain = SequentialChain(
        chains: [chain1, chain2],
        inputKeys: {'foo', 'test'},
      );
      final output = await chain({'foo': '123', 'test': '456'});
      final expectedOutput = {
        'baz': '123 456foo 123foo',
        'foo': '123',
        'test': '456',
      };
      expect(output, equals(expectedOutput));
    });

    test('Test input and output keys are infer correctly if not provided',
        () async {
      final chain1 = _FakeChain(
        inputVariables: {'foo', 'test'},
        outputVariables: {'bar'},
      );
      final chain2 = _FakeChain(
        inputVariables: {'bar', 'foo'},
        outputVariables: {'baz'},
      );
      final chain = SequentialChain(
        chains: [chain1, chain2],
      );
      final output = await chain({'foo': '123', 'test': '456'});
      final expectedOutput = {
        'baz': '123 456foo 123foo',
        'foo': '123',
        'test': '456',
      };
      expect(output, equals(expectedOutput));
    });

    test('Test sequential usage with memory', () async {
      const memory = SimpleMemory(memories: {'zab': 'rab'});
      final chain1 = _FakeChain(
        inputVariables: {'foo'},
        outputVariables: {'bar'},
      );
      final chain2 = _FakeChain(
        inputVariables: {'bar'},
        outputVariables: {'baz'},
      );
      final chain = SequentialChain(
        memory: memory,
        chains: [chain1, chain2],
        inputKeys: {'foo'},
      );
      final output = await chain({'foo': '123'});
      final expectedOutput = {'baz': '123foofoo', 'foo': '123', 'zab': 'rab'};
      expect(output, equals(expectedOutput));
    });

    test('Test assert is raised when memory keys and input keys overlap',
        () async {
      const memory = SimpleMemory(memories: {'zab': 'rab', 'foo': 'rab'});
      final chain1 = _FakeChain(
        inputVariables: {'foo'},
        outputVariables: {'bar'},
      );
      final chain2 = _FakeChain(
        inputVariables: {'bar'},
        outputVariables: {'baz'},
      );
      expect(
        () => SequentialChain(
          memory: memory,
          chains: [chain1, chain2],
          inputKeys: {'foo'},
        ),
        throwsA(isA<AssertionError>()),
      );
    });

    test('Test memory in one of the internal chains', () async {
      final memory = ConversationBufferMemory(memoryKey: 'bla');
      await memory.saveContext(
        inputValues: {'input': 'yo'},
        outputValues: {'output': 'ya'},
      );

      final chain1 = _FakeChain(
        inputVariables: {'foo'},
        outputVariables: {'bar'},
        memory: memory,
      );
      final chain2 = _FakeChain(
        inputVariables: {'bar'},
        outputVariables: {'baz'},
      );
      final chain = SequentialChain(
        chains: [chain1, chain2],
        inputKeys: {'foo'},
      );
      final output = await chain({'foo': '123'});
      final expectedOutput = {
        'foo': '123',
        'baz': '123 Human: yo\nAI: yafoofoo',
      };
      expect(output, equals(expectedOutput));
    });

    test('Test sequential usage on multiple output chains', () async {
      final chain1 = _FakeChain(
        inputVariables: {'foo'},
        outputVariables: {'bar', 'test'},
      );
      final chain2 = _FakeChain(
        inputVariables: {'bar', 'foo'},
        outputVariables: {'baz'},
      );
      final chain = SequentialChain(
        chains: [chain1, chain2],
        inputKeys: {'foo'},
      );
      final output = await chain({'foo': '123'});
      final expectedOutput = {
        'baz': '123foo 123foo',
        'foo': '123',
      };
      expect(output, equals(expectedOutput));
    });

    test('Test error is raised when input keys are missing', () async {
      final chain1 = _FakeChain(
        inputVariables: {'foo'},
        outputVariables: {'bar'},
      );
      final chain2 = _FakeChain(
        inputVariables: {'bar', 'test'},
        outputVariables: {'baz'},
      );
      expect(
        () => SequentialChain(
          chains: [chain1, chain2],
          inputKeys: {'foo'},
        ),
        throwsA(isA<AssertionError>()),
      );
    });

    test('Test error is raised when bad outputs are specified', () async {
      final chain1 = _FakeChain(
        inputVariables: {'foo'},
        outputVariables: {'bar'},
      );
      final chain2 = _FakeChain(
        inputVariables: {'bar'},
        outputVariables: {'baz'},
      );
      expect(
        () => SequentialChain(
          chains: [chain1, chain2],
          inputKeys: {'foo'},
          outputKeys: {'test'},
        ),
        throwsA(isA<AssertionError>()),
      );
    });

    test('Test returnOnlyOutputs', () async {
      final chain1 = _FakeChain(
        inputVariables: {'foo'},
        outputVariables: {'bar'},
      );
      final chain2 = _FakeChain(
        inputVariables: {'bar'},
        outputVariables: {'baz'},
      );
      final chain = SequentialChain(
        chains: [chain1, chain2],
        inputKeys: {'foo'},
        outputKeys: {'bar', 'baz'},
      );
      final output = await chain({'foo': '123'}, returnOnlyOutputs: true);
      final expectedOutput = {'baz': '123foofoo', 'bar': '123foo'};
      expect(output, equals(expectedOutput));
    });

    test('Test error is raised when input variables are overlapping', () async {
      final chain1 = _FakeChain(
        inputVariables: {'foo'},
        outputVariables: {'bar', 'test'},
      );
      final chain2 = _FakeChain(
        inputVariables: {'bar'},
        outputVariables: {'baz'},
      );
      expect(
        () => SequentialChain(
          chains: [chain1, chain2],
          inputKeys: {'foo', 'test'},
        ),
        throwsA(isA<AssertionError>()),
      );
    });
  });

  group('SimpleSequentialChain tests', () {
    test('Test simple sequential functionality', () async {
      final chain1 = _FakeChain(
        inputVariables: {'foo'},
        outputVariables: {'bar'},
      );
      final chain2 = _FakeChain(
        inputVariables: {'bar'},
        outputVariables: {'baz'},
      );
      final chain = SimpleSequentialChain(chains: [chain1, chain2]);
      final output = await chain({'input': '123'});
      final expectedOutput = {'output': '123foofoo', 'input': '123'};
      expect(output, equals(expectedOutput));
    });

    test('Test error raised if multiple input variables are expected',
        () async {
      final chain1 = _FakeChain(
        inputVariables: {'foo'},
        outputVariables: {'bar'},
      );
      final chain2 = _FakeChain(
        inputVariables: {'bar', 'foo'},
        outputVariables: {'baz'},
      );
      expect(
        () => SimpleSequentialChain(chains: [chain1, chain2]),
        throwsA(isA<AssertionError>()),
      );
    });

    test('Test error raised if multiple output variables are expected',
        () async {
      final chain1 = _FakeChain(
        inputVariables: {'foo'},
        outputVariables: {'bar', 'grok'},
      );
      final chain2 = _FakeChain(
        inputVariables: {'bar'},
        outputVariables: {'baz'},
      );
      expect(
        () => SimpleSequentialChain(chains: [chain1, chain2]),
        throwsA(isA<AssertionError>()),
      );
    });
  });
}

/// Fake chain for testing purposes.
///
/// The output variable is the input values concatenated with space and with the
/// string 'foo' appended to the end.
class _FakeChain extends BaseChain {
  _FakeChain({
    required this.inputVariables,
    required this.outputVariables,
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
    final Map<String, dynamic> outputs = {};
    for (final variable in outputVariables) {
      final variables = [
        for (final k in {...inputVariables, ...?memory?.memoryKeys}) inputs[k],
      ];
      outputs[variable] = "${variables.join(' ')}foo";
    }
    return outputs;
  }
}
