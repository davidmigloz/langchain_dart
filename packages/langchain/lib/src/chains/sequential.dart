import '../memory/memory.dart';
import 'base.dart';
import 'models/models.dart';

/// {@template sequential_chain}
/// Chain that combines multiple chains where the output of the one
/// chain is the input of the next chain.
///
/// If you don't provide [inputKeys] and [outputKeys], they will be inferred
/// from the chains.
///
/// Example:
/// ```dart
/// final chain1 = FakeChain(
///   inputVariables: {'foo', 'test'},
///   outputVariables: {'bar'},
/// );
/// final chain2 = FakeChain(
///   inputVariables: {'bar', 'foo'},
///   outputVariables: {'baz'},
/// );
/// final chain = SequentialChain(chains: [chain1, chain2]);
/// final output = await chain({'foo': '123', 'test': '456'});
/// ```
///
/// If all the chains have only one input and one output, you can use
/// [SimpleSequentialChain] instead.
/// {@endtemplate}
class SequentialChain extends BaseChain {
  /// {@macro sequential_chain}
  SequentialChain({
    required this.chains,
    super.memory,
    final Set<String>? inputKeys,
    final Set<String>? outputKeys,
    this.returnIntermediateOutputs = false,
  })  : inputKeys = inputKeys ?? _inferInputKeys(chains, memory),
        outputKeys = outputKeys ??
            _inferOutputKeys(chains, returnIntermediateOutputs, memory) {
    assert(_isChainValid());
  }

  /// The chains to run sequentially.
  final List<BaseChain> chains;

  /// Whether the chain should return all intermediate outputs or just the
  /// final output. By default, only the final output of the chain is returned.
  /// Setting it to true can be useful if you want to see the outputs of each
  /// step in the chain for debugging or analysis purposes.
  bool returnIntermediateOutputs;

  @override
  String get chainType => 'sequential_chain';

  @override
  Set<String> inputKeys;

  @override
  Set<String> outputKeys;

  /// Infers the input keys for the chain from the [chains].
  static Set<String> _inferInputKeys(
    final List<BaseChain> chains,
    final BaseMemory? memory,
  ) {
    final inputKeys = {
      for (final chain in chains)
        ...chain.inputKeys.difference(chain.memory?.memoryKeys ?? const {}),
    };
    final outputKeys = {
      for (final chain in chains) ...chain.outputKeys,
    };
    return inputKeys
        .difference(outputKeys)
        .difference(memory?.memoryKeys ?? const {});
  }

  /// Infers the output keys for the chain from the [chains].
  static Set<String> _inferOutputKeys(
    final List<BaseChain> chains,
    final bool returnIntermediateOutputs,
    final BaseMemory? memory,
  ) {
    if (returnIntermediateOutputs) {
      return {
        ...?memory?.memoryKeys,
        for (final chain in chains) ...{
          ...chain.outputKeys,
          ...?memory?.memoryKeys,
        },
      };
    }
    return chains.last.outputKeys;
  }

  /// Checks if the chain is valid.
  bool _isChainValid() {
    if (chains.isEmpty) {
      throw AssertionError('Sequential chain must have at least one chain.');
    }

    if (memory != null) {
      final intersection = inputKeys.intersection(memory!.memoryKeys);
      if (intersection.isNotEmpty) {
        throw AssertionError(
          'Input keys and memory keys must not overlap. Got: $intersection',
        );
      }
    }

    final knownKeys = inputKeys.union(memory?.memoryKeys ?? const {});

    for (final chain in chains) {
      final missingKeys = chain.inputKeys
          .difference(knownKeys)
          .difference(chain.memory?.memoryKeys ?? const {});
      if (missingKeys.isNotEmpty) {
        throw AssertionError(
          'Missing required input keys $missingKeys for chain '
          '"${chain.chainType}". Only got $knownKeys.',
        );
      }

      final overlappingOutputKeys = knownKeys.intersection(chain.outputKeys);
      if (overlappingOutputKeys.isNotEmpty) {
        throw AssertionError(
          'Chain "${chain.chainType}" returns keys that already exist: '
          '$overlappingOutputKeys.',
        );
      }

      knownKeys.addAll(chain.outputKeys);
    }

    if (outputKeys.isNotEmpty) {
      final missingKeys = outputKeys.difference(knownKeys);
      if (missingKeys.isNotEmpty) {
        throw AssertionError(
          'Expected output keys that were not found: $missingKeys',
        );
      }
    }

    return true;
  }

  @override
  Future<ChainValues> callInternal(final ChainValues inputs) async {
    final knownValues = {...inputs};
    for (final chain in chains) {
      final outputs = await chain.call(knownValues, returnOnlyOutputs: true);
      knownValues.addAll(outputs);
    }
    return {
      for (final outputKey in outputKeys) outputKey: knownValues[outputKey],
    };
  }
}

/// {@template simple_sequential_chain}
/// [SimpleSequentialChain] is a simpler form of [SequentialChain], where each
/// step has a singular input/output, and the output of one step is the input
/// to the next.
///
/// It is suitable for cases where you only need to pass a single string as an
/// argument and get a single string as output for all steps in the chain.
///
/// Example:
/// ```dart
/// final chain1 = FakeChain(
///   inputVariables: {'foo'},
///   outputVariables: {'bar'},
/// );
/// final chain2 = FakeChain(
///   inputVariables: {'bar'},
///   outputVariables: {'baz'},
/// );
/// final chain = SimpleSequentialChain(chains: [chain1, chain2]);
/// final output = await chain({'input': '123'});
/// ```
/// {@endtemplate}
class SimpleSequentialChain extends BaseChain {
  /// {@macro simple_sequential_chain}
  SimpleSequentialChain({
    required this.chains,
    super.memory,
    final String inputKey = defaultInputKey,
    final String outputKey = defaultOutputKey,
    this.trimOutputs = false,
  })  : inputKeys = {inputKey},
        outputKeys = {outputKey} {
    assert(_isChainValid());
  }

  /// The chains to run sequentially.
  final List<BaseChain> chains;

  /// Whether to trim the outputs of the chains before passing them to the next
  /// chain. By default, the outputs are not trimmed.
  final bool trimOutputs;

  @override
  String get chainType => 'simple_sequential_chain';

  @override
  Set<String> inputKeys;

  @override
  Set<String> outputKeys;

  /// Default input key for the input of the chain.
  static const String defaultInputKey = 'input';

  /// Default output key for the output of the chain.
  static const String defaultOutputKey = 'output';

  /// Checks if the chain is valid.
  bool _isChainValid() {
    for (final chain in chains) {
      if (chain.inputKeys.length != 1) {
        throw AssertionError(
          'Chains used in SimpleSequentialChain should all have one input. '
          'Got ${chain.chainType} with ${chain.inputKeys.length} inputs.',
        );
      }

      if (chain.outputKeys.length != 1) {
        throw AssertionError(
          'Chains used in SimpleSequentialChain should all have one output. '
          'Got ${chain.chainType} with ${chain.outputKeys.length} outputs.',
        );
      }
    }
    return true;
  }

  @override
  Future<ChainValues> callInternal(final ChainValues inputs) async {
    dynamic input = inputs[inputKeys.first];
    for (final chain in chains) {
      input = await chain.run(input);
      if (trimOutputs && input is String) {
        input = input.trim();
      }
    }
    return {outputKeys.first: input};
  }
}
