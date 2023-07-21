import 'package:langchain/src/chains/chains.dart';
import 'package:langchain/src/memory/memory.dart';
import 'package:langchain/src/utils/exception.dart';
import 'package:test/test.dart';


class FakeChain extends BaseChain {
  

  FakeChain({
    required this.inputVariables,
    required this.outputVariables,
  });

  @override
  String get chainType => 'FakeChain';

  final Set<String> inputVariables;
  final Set<String> outputVariables;

  @override
  Set<String> get inputKeys => this.inputVariables;

  @override
  Set<String> get outputKeys => this.outputVariables;

  @override
  Future<ChainValues> callInternal(ChainValues inputs) async {
    final Map<String, dynamic> outputs = {};
    for (var variable in this.outputVariables) {
      var variables = [for (var k in this.inputVariables) inputs[k]];
      outputs[variable] = "${variables.join(' ')}foo";
    }
    return outputs;
  }
}


void testSequentialUsageSingleInputs() {
  test('Test sequential on single input chains', () {
    var chain_1 = FakeChain(inputVariables: {'foo'}, outputVariables: {'bar'});
    var chain_2 = FakeChain(inputVariables: {'bar'}, outputVariables: {'baz'});
    var chain = SequentialChain(chains: {chain_1, chain_2}, inputVariables: {'foo'});
    var output = chain({"foo": "123"});
    var expectedOutput = {"baz": "123foofoo", "foo": "123"};
    expect(output, equals(expectedOutput));
  });
}


void testSequentialUsageMultipleInputs() {
  test('Test sequential on multiple input chains', () {
    var chain_1 = FakeChain(inputVariables: {'foo', 'test'}, outputVariables: {'bar'});
    var chain_2 = FakeChain(inputVariables: {'bar', 'foo'}, outputVariables: {'baz'});
    var chain = SequentialChain(chains: {chain_1, chain_2}, inputVariables: {'foo', 'test'});
    var output = chain({"foo": "123", "test": "456"});
    var expectedOutput = {
      "baz": "123 456foo 123foo",
      "foo": "123",
      "test": "456",
    };
    expect(output, equals(expectedOutput));
  });
}

void testSequentialUsageMemory() {
  test('Test sequential usage with memory', () {
    var memory = SimpleMemory(memories: {'zab': 'rab'});
    var chain_1 = FakeChain(inputVariables: {'foo'}, outputVariables: {'bar'});
    var chain_2 = FakeChain(inputVariables: {'bar'}, outputVariables: {'baz'});
    var chain = SequentialChain(
      memory: memory,
      chains: {chain_1, chain_2},
      inputVariables: {'foo'},
    );
    var output = chain({'foo': '123'});
    var expectedOutput = {'baz': '123foofoo', 'foo': '123', 'zab': 'rab'};
    expect(output, equals(expectedOutput));

    memory = SimpleMemory(memories: {'zab': 'rab', 'foo': 'rab'});
    chain_1 = FakeChain(inputVariables: {'foo'}, outputVariables: {'bar'});
    chain_2 = FakeChain(inputVariables: {'bar'}, outputVariables: {'baz'});
    expect(
      () => SequentialChain(memory: memory, chains: {chain_1, chain_2}, inputVariables: {'foo'}),
      throwsA(TypeMatcher<LangChainException>()),
    );
  });
}

void testSequentialUsageMultipleOutputs() {
  test('Test sequential usage on multiple output chains', () {
    var chain_1 = FakeChain(inputVariables: {'foo'}, outputVariables: {'bar', 'test'});
    var chain_2 = FakeChain(inputVariables: {'bar', 'foo'}, outputVariables: {'baz'});
    var chain = SequentialChain(chains: {chain_1, chain_2}, inputVariables: {'foo'});
    var output = chain({"foo": "123"});
    var expectedOutput = {
      "baz": "123foo 123foo",
      "foo": "123",
    };
    expect(output, equals(expectedOutput));
  });
}

void testSequentialMissingInputs() {
  test('Test error is raised when input variables are missing', () {
    var chain_1 = FakeChain(inputVariables: {'foo'}, outputVariables: {'bar'});
    var chain_2 = FakeChain(inputVariables: {'bar', 'test'}, outputVariables: {'baz'});
    expect(() => SequentialChain(chains: {chain_1, chain_2}, inputVariables: {'foo'}),
        throwsA(TypeMatcher<LangChainException>()));
  });
}

void testSequentialBadOutputs() {
 test('Test error is raised when bad outputs are specified', () {
    var chain_1 = FakeChain(inputVariables: {'foo'}, outputVariables: {'bar'});
    var chain_2 = FakeChain(inputVariables: {'bar'}, outputVariables: {'baz'});
    expect(
      () => SequentialChain(
        chains: {chain_1, chain_2},
        inputVariables: {'foo'},
        outputVariables: {'test'},
      ),
      throwsA(TypeMatcher<LangChainException>()),
    );
  });
}

void testSequentialValidOutputs() {
    test('Test chain runs when valid outputs are specified', () {
    var chain_1 = FakeChain(inputVariables: {'foo'}, outputVariables: {'bar'});
    var chain_2 = FakeChain(inputVariables: {'bar'}, outputVariables: {'baz'});
    var chain = SequentialChain(
      chains: {chain_1, chain_2},
      inputVariables: {'foo'},
      outputVariables: {'bar', 'baz'},
    );
    var output = chain({'foo': '123'}, returnOnlyOutputs: true);
    var expectedOutput = {'baz': '123foofoo', 'bar': '123foo'};
    expect(output, equals(expectedOutput));
  });
}

void testSequentialOverlappingInputs() {
    test('Test error is raised when input variables are overlapping', () {
    var chain_1 = FakeChain(inputVariables: {'foo'}, outputVariables: {'bar', 'test'});
    var chain_2 = FakeChain(inputVariables: {'bar'}, outputVariables: {'baz'});
    expect(
      () => SequentialChain(chains: {chain_1, chain_2}, inputVariables: {'foo', 'test'}),
      throwsA(TypeMatcher<LangChainException>()),
    );
  });
}

void testSimpleSequentialFunctionality() {
    test('Test simple sequential functionality', () {
    var chain_1 = FakeChain(inputVariables: {'foo'}, outputVariables: {'bar'});
    var chain_2 = FakeChain(inputVariables: {'bar'}, outputVariables: {'baz'});
    var chain = SimpleSequentialChain(chains: {chain_1, chain_2});
    var output = chain({'input': '123'});
    var expectedOutput = {'output': '123foofoo', 'input': '123'};
    expect(output, equals(expectedOutput));
  });
}


void testMultiInputErrors() {
    test('Test simple sequential errors if multiple input variables are expected', () {
    var chain_1 = FakeChain(inputVariables: {'foo'}, outputVariables: {'bar'});
    var chain_2 = FakeChain(inputVariables: {'bar', 'foo'}, outputVariables: {'baz'});
    expect(() => SimpleSequentialChain(chains: {chain_1, chain_2}), throwsA(TypeMatcher<LangChainException>()));
  });
}

void testMultiOutputErrors() {
    test('Test simple sequential errors if multiple output variables are expected', () {
    var chain_1 = FakeChain(inputVariables: {'foo'}, outputVariables: {'bar', 'grok'});
    var chain_2 = FakeChain(inputVariables: {'bar'}, outputVariables: {'baz'});
    expect(() => SimpleSequentialChain(chains: {chain_1, chain_2}), throwsA(TypeMatcher<LangChainException>()));
  });
}
