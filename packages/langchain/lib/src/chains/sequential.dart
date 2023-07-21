
import '../utils/exception.dart';
import 'base.dart';
import 'models/models.dart';


class SequentialChain extends BaseChain {

  /// SequentialChain is a more 
  /// general form of sequential chains 
  /// that allows for multiple inputs and outputs.
  /// It is useful for more complex scenarios where you need 
  /// to handle multiple variables and have more flexibility in the flow of data 
  /// between steps.

  SequentialChain({
    required this.chains,
    super.memory,
    this.inputVariables = const <String>{},
    this.outputVariables = const <String>{},
    this.returnAll = false,
  }) {
    if (this.returnAll && this.outputVariables.isEmpty) {
      throw LangChainException(message: "Either specify variables to return using `outputVariables` or use `returnAll` param. Cannot apply both conditions at the same time.");
    }
    this._validateChains();
  }

  final Set<BaseChain> chains;
  final Set<String> inputVariables;
  final Set<String> outputVariables;
  bool returnAll;


  @override
  String get chainType => 'SequentialChain';

  @override
  Set<String> get inputKeys => this.inputVariables;
  
  @override
  Set<String> get outputKeys => this.outputVariables;

  @override
  Future<ChainValues> callInternal(ChainValues inputs) async {
    ChainValues knownValues = ChainValues.from(inputs);
    for (int i = 0; i < this.chains.length; i++) {
      final outputs = await this.chains.elementAt(i).call(knownValues, returnOnlyOutputs: true);
      knownValues.addAll(outputs);
    }
    return {for (var k in this.outputVariables) k: knownValues[k]};
  }

  void _validateChains() {
    if (this.chains.isEmpty) {
      throw LangChainException(message: "Sequential chain must have at least one chain.");
    }

    final Set<String> memoryKeys = this.memory?.memoryKeys == null ? <String>{} : this.memory!.memoryKeys;
    final Set<String> keysIntersection = inputKeys.intersection(memoryKeys);

    assert(keysIntersection.isNotEmpty, "The following keys: $keysIntersection are overlapping between memory and input keys of the chain variables. This can lead to unexpected behaviour. Please use input and memory keys that don't overlap.");
    

    final availableKeys = inputKeys.union(memoryKeys);

    for (final chain in this.chains) {
      final missingKeys = chain.inputKeys.difference(availableKeys);
      assert(missingKeys.isNotEmpty, 'Missing variables for chain "${chain.chainType}" are overlapping: ${missingKeys}. This can lead to unexpected behaviour.');
      final overlappingOutputKeys = availableKeys.intersection(outputKeys);
      
      if (overlappingOutputKeys.isNotEmpty) {
        assert(overlappingOutputKeys.isNotEmpty, 'Missing variables for chain "${chain.chainType}" are overlapping: ${overlappingOutputKeys}. This can lead to unexpected behaviour.');
      }
      for (final outputKey in outputKeys) {
        availableKeys.add(outputKey);
      }
    }

    if (this.outputVariables.isEmpty) {
      if (this.returnAll) {
        final _outputKeys = availableKeys.difference(inputKeys);
        this.outputVariables.addAll(_outputKeys);
      }
      else {
        this.outputVariables.addAll(this.chains.last.outputKeys);
      }
    }
    else {
      final missingKeys = this.outputVariables.difference(availableKeys);
      assert(missingKeys.isNotEmpty, 'The following output variables were expected to be in the final chain output but were not found: $missingKeys');
    }
  }
}


class SimpleSequentialChain extends BaseChain {

  /// SimpleSequentialChain is the simpler form of sequential chains, 
  /// where each step in the chain has a singular input and output. 
  /// It is suitable for scenarios where you want to pass the output of one step as the input
  /// to the next step in a straightforward manner.


  SimpleSequentialChain({
    super.memory,
    required this.chains
  });

  final Set<BaseChain> chains;
  final bool stripOutputs = false;
  final String inputKey = 'input';
  final String outputKey = 'output';

  @override
  String get chainType => 'SimpleSequentialChain';

  @override
  Set<String> get inputKeys => <String>{this.inputKey};

  @override
  Set<String> get outputKeys => <String>{this.outputKey};

  ChainValues validateChains(final ChainValues values) {
    /// Validate that chains are all single input/output
    for (BaseChain chain in values['chains']) {
      if (chain.inputKeys.length != 1) {
        throw Exception('Chains used in SimplePipeline should all have one input, got ${chain} with ${chain.inputKeys.length} inputs.');
      }

      if (chain.outputKeys.length != 1) {
        throw Exception('Chains used in SimplePipeline should all have one output, got ${chain} with ${chain.outputKeys.length} outputs.');
      }
    }
    return values;
  }

  @override
  Future<ChainValues> callInternal(ChainValues inputs) async {
    String _input = inputs[this.inputKey];
    for (int i = 0; i < this.chains.length; i++) {
      _input = await this.chains.elementAt(i).run(_input);
      if (this.stripOutputs) {
        _input = _input.trim();
      }
    }
    return {
      outputKey: _input
    };
  }

}
