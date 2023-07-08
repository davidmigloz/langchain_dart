
import '../utils/exception.dart';
import 'base.dart';
import 'models/models.dart';


class SequentialChain extends BaseChain {


  late List<BaseChain> chains;
  late List<String> inputVariables;
  late List<String> outputVariables;
  bool returnAll = false;

  SequentialChain({
    required this.chains,
    this.returnAll = false,
    super.memory
  }) {
    if (this.returnAll && this.outputVariables.length > 0) {
      throw LangChainException(message: "Either specify variables to return using `outputVariables` or use `returnAll` param. Cannot apply both conditions at the same time.");
    }
    this._validateChains();
  }

  @override
  String get chainType => 'SequentialChain';

  @override
  // TODO: implement inputKeys
  Set<String> get inputKeys => Set.from(this.inputVariables);
  
  @override
  // TODO: implement outputKeys
  Set<String> get outputKeys => Set.from(this.outputVariables);

  @override
  Future<ChainValues> callInternal(ChainValues inputs) async {
    ChainValues known_values = ChainValues.from(inputs);
    for (int i = 0; i < this.chains.length; i++) {
      final outputs = await this.chains[i].call(known_values, returnOnlyOutputs: true);
      known_values.addAll(outputs);
    }
    return {for (var k in this.outputVariables) k: known_values[k]};
  }

  void _validateChains() {
    if (this.chains.length == 0) {
      throw LangChainException(message: "Sequential chain must have at least one chain.");
    }

    final Set<String> memoryKeys = this.memory?.memoryKeys == null ? Set<String>() : this.memory!.memoryKeys;
    final Set<String> keysIntersection = inputKeys.intersection(memoryKeys);
    if (keysIntersection.isNotEmpty) {
      throw LangChainException(message: "The following keys: $keysIntersection are overlapping between memory and input keys of the chain variables. This can lead to unexpected behaviour. Please use input and memory keys that don't overlap.");
    }

    final availableKeys = inputKeys.union(memoryKeys);

    for (final chain in this.chains) {
      final missingKeys = Set.from(chain.inputKeys).difference(availableKeys);
      if (missingKeys.length > 0) {
        throw LangChainException(message: 'Missing variables for chain "${chain.chainType}" are overlapping: ${missingKeys}. This can lead to unexpected behaviour.');
      }
      final overlappingOutputKeys = availableKeys.intersection(outputKeys);
      if (overlappingOutputKeys.length > 0) {
        throw LangChainException(message: 'Missing variables for chain "${chain.chainType}" are overlapping: ${overlappingOutputKeys}. This can lead to unexpected behaviour.');
      }
      for (final outputKey in outputKeys) {
        availableKeys.add(outputKey);
      }
    }

    if (this.outputVariables.isEmpty) {
      if (this.returnAll) {
        final _outputKeys = availableKeys.difference(inputKeys);
        this.outputVariables = List.from(outputKeys);
      }
      else {
        this.outputVariables = List.from(this.chains.last.outputKeys);
      }
    }
    else {
      final missingKeys = Set.from(this.outputVariables).difference(availableKeys);
      if (missingKeys.isNotEmpty) {
        throw LangChainException(message: 'The following output variables were expected to be in the final chain output but were not found: $missingKeys');
      }
    }
  }
}


class SimpleSequentialChain extends BaseChain {
  // Simple chain where the outputs of one step feed directly into next.

  SimpleSequentialChain({
    super.memory,
    this.chains = const []
  });

  final List<BaseChain> chains;
  final bool stripOutputs = false;
  final String inputKey = 'input';
  final String outputKey = 'output';

  @override
  String get chainType => 'SimpleSequentialChain';

  @override
  Set<String> get inputKeys => Set.from([this.inputKey]);

  @override
  Set<String> get outputKeys => Set.from([this.outputKey]);

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
      _input = await this.chains[i].run(_input);
      if (this.stripOutputs) {
        _input = _input.trim();
      }
    }
    return {
      outputKey: _input
    };
  }

  @override
  Future<ChainValues> call(input, {bool returnOnlyOutputs = false}) {
    return super.call(input, returnOnlyOutputs: returnOnlyOutputs);
  }
}
