import 'package:langchain_core/chains.dart';
import 'package:test/test.dart';

import 'fake_callback_handler.dart';

class _FakeChain extends BaseChain {
  _FakeChain() : super(memory: null);

  @override
  String get chainType => 'fake';

  @override
  Set<String> get inputKeys => {'input'};

  @override
  Set<String> get outputKeys => {'output'};

  @override
  Future<ChainValues> callInternal(final ChainValues inputs) async {
    return {'output': inputs['input']};
  }
}

class _FailingChain extends BaseChain {
  _FailingChain() : super(memory: null);

  @override
  String get chainType => 'failing';

  @override
  Set<String> get inputKeys => {'input'};

  @override
  Set<String> get outputKeys => {'output'};

  @override
  Future<ChainValues> callInternal(final ChainValues inputs) {
    throw Exception('chain error');
  }
}

void main() {
  group('Chain callback integration', () {
    test('invoke fires onChainStart and onChainEnd', () async {
      final handler = FakeCallbackHandler();
      final chain = _FakeChain();

      final result = await chain.invoke(
        {'input': 'hello'},
        options: ChainOptions(callbacks: [handler]),
      );

      expect(result['output'], 'hello');
      expect(handler.chainStarts, 1);
      expect(handler.chainEnds, 1);
      expect(handler.chainErrors, 0);
    });

    test('invoke fires onChainError on failure', () async {
      final handler = FakeCallbackHandler();
      final chain = _FailingChain();

      try {
        await chain.invoke(
          {'input': 'hello'},
          options: ChainOptions(callbacks: [handler]),
        );
      } catch (_) {}

      expect(handler.chainStarts, 1);
      expect(handler.chainErrors, 1);
      expect(handler.chainEnds, 0);
    });
  });
}
