import 'package:langchain_core/callbacks.dart';
import 'package:langchain_core/chains.dart';
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/llms.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_core/tools.dart';
import 'package:test/test.dart';

import 'fake_callback_handler.dart';

void main() {
  group('BaseCallbackHandler', () {
    test('default methods are no-op', () {
      final handler = FakeCallbackHandler();
      final runInfo = RunInfo(runId: generateRunId());

      handler
        ..onLlmStart(runInfo: runInfo, input: PromptValue.string('test'))
        ..onLlmEnd(
          runInfo: runInfo,
          output: const LLMResult(
            id: '1',
            output: 'test',
            finishReason: FinishReason.stop,
            metadata: {},
            usage: LanguageModelUsage(),
          ),
        );

      expect(handler.llmStarts, 1);
      expect(handler.llmEnds, 1);
    });
  });

  group('CallbackManager', () {
    test('configure returns null when no callbacks', () {
      final mgr = CallbackManager.configure(callbacks: null);
      expect(mgr, isNull);
    });

    test('configure returns null when empty callbacks', () {
      final mgr = CallbackManager.configure(callbacks: []);
      expect(mgr, isNull);
    });

    test('configure returns manager when callbacks provided', () {
      final handler = FakeCallbackHandler();
      final mgr = CallbackManager.configure(callbacks: [handler]);
      expect(mgr, isNotNull);
    });

    test('handleChatModelStart dispatches to handlers', () {
      final handler = FakeCallbackHandler();
      final mgr = CallbackManager(handlers: [handler]);
      final messages = [ChatMessage.humanText('hello')];

      final runMgr = mgr.handleChatModelStart(messages: messages);

      expect(handler.chatModelStarts, 1);
      expect(runMgr, isA<ChatModelRunManager>());
    });

    test('handleLlmStart dispatches to handlers', () {
      final handler = FakeCallbackHandler();
      CallbackManager(handlers: [handler])
          .handleLlmStart(input: PromptValue.string('hello'));

      expect(handler.llmStarts, 1);
    });

    test('handleChainStart dispatches to handlers', () {
      final handler = FakeCallbackHandler();
      CallbackManager(handlers: [handler])
          .handleChainStart(inputs: {'input': 'hello'});

      expect(handler.chainStarts, 1);
    });

    test('handleToolStart dispatches to handlers', () {
      final handler = FakeCallbackHandler();
      CallbackManager(handlers: [handler])
          .handleToolStart(input: 'hello');

      expect(handler.toolStarts, 1);
    });

    test('handleRetrieverStart dispatches to handlers', () {
      final handler = FakeCallbackHandler();
      CallbackManager(handlers: [handler])
          .handleRetrieverStart(query: 'hello');

      expect(handler.retrieverStarts, 1);
    });

    test('run info contains unique runId', () {
      final handler = FakeCallbackHandler();
      final mgr = CallbackManager(handlers: [handler]);

      final runMgr1 = mgr.handleChainStart(inputs: {});
      final runMgr2 = mgr.handleChainStart(inputs: {});

      expect(runMgr1.runInfo.runId, isNot(runMgr2.runInfo.runId));
    });

    test('run info contains parentRunId', () {
      final handler = FakeCallbackHandler();
      final mgr = CallbackManager(
        handlers: [handler],
        parentRunId: 'parent-123',
      );

      final runMgr = mgr.handleChainStart(inputs: {});
      expect(runMgr.runInfo.parentRunId, 'parent-123');
    });

    test('getChild creates child manager with parentRunId', () {
      final handler = FakeCallbackHandler();
      final mgr = CallbackManager(handlers: [handler]);
      final runMgr = mgr.handleChainStart(inputs: {});

      final childMgr = runMgr.getChild();
      final childRunMgr = childMgr.handleToolStart(input: 'test');

      expect(childRunMgr.runInfo.parentRunId, runMgr.runInfo.runId);
    });
  });

  group('RunManagers', () {
    test('LlmRunManager.handleEnd dispatches onLlmEnd', () {
      final handler = FakeCallbackHandler();
      final mgr = CallbackManager(handlers: [handler]);

      mgr
          .handleLlmStart(input: PromptValue.string('hello'))
          .handleEnd(
            const LLMResult(
              id: '1',
              output: 'world',
              finishReason: FinishReason.stop,
              metadata: {},
              usage: LanguageModelUsage(),
            ),
          );

      expect(handler.llmStarts, 1);
      expect(handler.llmEnds, 1);
    });

    test('LlmRunManager.handleNewToken dispatches onLlmNewToken', () {
      final handler = FakeCallbackHandler();
      final mgr = CallbackManager(handlers: [handler]);

      mgr.handleLlmStart(input: PromptValue.string('hello'))
        ..handleNewToken('tok1')
        ..handleNewToken('tok2');

      expect(handler.newTokens, 2);
    });

    test('LlmRunManager.handleError dispatches onLlmError', () {
      final handler = FakeCallbackHandler();
      final mgr = CallbackManager(handlers: [handler]);

      mgr
          .handleLlmStart(input: PromptValue.string('hello'))
          .handleError(Exception('test error'));

      expect(handler.llmErrors, 1);
    });

    test('ChainRunManager.handleEnd dispatches onChainEnd', () {
      final handler = FakeCallbackHandler();
      final mgr = CallbackManager(handlers: [handler]);

      mgr
          .handleChainStart(inputs: {'input': 'hi'})
          .handleEnd({'output': 'hello'});

      expect(handler.chainStarts, 1);
      expect(handler.chainEnds, 1);
    });

    test('ToolRunManager.handleEnd dispatches onToolEnd', () {
      final handler = FakeCallbackHandler();
      final mgr = CallbackManager(handlers: [handler]);

      mgr
          .handleToolStart(input: 'query')
          .handleEnd('result');

      expect(handler.toolStarts, 1);
      expect(handler.toolEnds, 1);
    });

    test('RetrieverRunManager.handleEnd dispatches onRetrieverEnd', () {
      final handler = FakeCallbackHandler();
      final mgr = CallbackManager(handlers: [handler]);

      mgr
          .handleRetrieverStart(query: 'query')
          .handleEnd([]);

      expect(handler.retrieverStarts, 1);
      expect(handler.retrieverEnds, 1);
    });
  });

  group('Ignore flags', () {
    test('ignoreLlm skips LLM callbacks', () {
      final handler = FakeCallbackHandler(ignoreLlm: true);
      final mgr = CallbackManager(handlers: [handler]);

      mgr.handleLlmStart(input: PromptValue.string('hello'))
        ..handleNewToken('token')
        ..handleEnd(
          const LLMResult(
            id: '1',
            output: 'world',
            finishReason: FinishReason.stop,
            metadata: {},
            usage: LanguageModelUsage(),
          ),
        );

      expect(handler.llmStarts, 0);
      expect(handler.newTokens, 0);
      expect(handler.llmEnds, 0);
    });

    test('ignoreChain skips chain callbacks', () {
      final handler = FakeCallbackHandler(ignoreChain: true);
      final mgr = CallbackManager(handlers: [handler]);

      mgr
          .handleChainStart(inputs: {})
          .handleEnd({});

      expect(handler.chainStarts, 0);
      expect(handler.chainEnds, 0);
    });

    test('ignoreTool skips tool callbacks', () {
      final handler = FakeCallbackHandler(ignoreTool: true);
      final mgr = CallbackManager(handlers: [handler]);

      mgr
          .handleToolStart(input: 'test')
          .handleEnd('result');

      expect(handler.toolStarts, 0);
      expect(handler.toolEnds, 0);
    });

    test('ignoreRetriever skips retriever callbacks', () {
      final handler = FakeCallbackHandler(ignoreRetriever: true);
      final mgr = CallbackManager(handlers: [handler]);

      mgr
          .handleRetrieverStart(query: 'test')
          .handleEnd([]);

      expect(handler.retrieverStarts, 0);
      expect(handler.retrieverEnds, 0);
    });
  });

  group('Multiple handlers', () {
    test('all handlers receive events', () {
      final handler1 = FakeCallbackHandler();
      final handler2 = FakeCallbackHandler();
      final mgr = CallbackManager(handlers: [handler1, handler2]);

      mgr
          .handleChainStart(inputs: {})
          .handleEnd({});

      expect(handler1.chainStarts, 1);
      expect(handler1.chainEnds, 1);
      expect(handler2.chainStarts, 1);
      expect(handler2.chainEnds, 1);
    });
  });

  group('Error handling in handlers', () {
    test('handler errors are caught by default', () {
      final handler = ThrowingCallbackHandler();
      final mgr = CallbackManager(handlers: [handler]);

      expect(() => mgr.handleChainStart(inputs: {}), returnsNormally);
    });

    test('handler errors propagate when raiseError is true', () {
      final handler = ThrowingCallbackHandler(raiseError: true);
      final mgr = CallbackManager(handlers: [handler]);

      expect(() => mgr.handleChainStart(inputs: {}), throwsException);
    });
  });

  group('Chat model integration', () {
    test('invoke dispatches onChatModelStart and onLlmEnd', () async {
      final handler = FakeCallbackHandler();
      final model = FakeChatModel(responses: ['Hello!']);

      await model.invoke(
        PromptValue.chat([ChatMessage.humanText('Hi')]),
        options: FakeChatModelOptions(callbacks: [handler]),
      );

      expect(handler.chatModelStarts, 1);
      expect(handler.llmEnds, 1);
    });

    test(
      'stream dispatches onChatModelStart, onLlmNewToken, and onLlmEnd',
      () async {
        final handler = FakeCallbackHandler();
        final model = FakeChatModel(responses: ['Hello']);

        final chunks = await model
            .stream(
              PromptValue.chat([ChatMessage.humanText('Hi')]),
              options: FakeChatModelOptions(callbacks: [handler]),
            )
            .toList();

        expect(chunks, isNotEmpty);
        expect(handler.chatModelStarts, 1);
        expect(handler.newTokens, chunks.length);
        expect(handler.llmEnds, 1);
      },
    );

    test('invoke dispatches onLlmError on failure', () async {
      final handler = FakeCallbackHandler();
      const model = FakeEchoChatModel();

      try {
        await model.invoke(
          PromptValue.chat([ChatMessage.humanText('Hi')]),
          options: FakeEchoChatModelOptions(
            callbacks: [handler],
            throwRandomError: true,
          ),
        );
      } catch (_) {}

      expect(handler.chatModelStarts, 1);
      expect(handler.llmErrors, 1);
    });

    test('no overhead when callbacks is null', () async {
      final model = FakeChatModel(responses: ['Hello!']);

      final result = await model.invoke(
        PromptValue.chat([ChatMessage.humanText('Hi')]),
      );

      expect(result.outputAsString, 'Hello!');
    });
  });

  group('Tool integration', () {
    test('invoke dispatches onToolStart and onToolEnd', () async {
      final handler = FakeCallbackHandler();
      final tool = Tool.fromFunction<String, String>(
        name: 'test_tool',
        description: 'A test tool',
        inputJsonSchema: const {
          'type': 'object',
          'properties': {
            'input': {'type': 'string'},
          },
        },
        func: (input) => 'result: $input',
      );

      await tool.invoke('hello', options: ToolOptions(callbacks: [handler]));

      expect(handler.toolStarts, 1);
      expect(handler.toolEnds, 1);
    });

    test('invoke dispatches onToolError on failure', () async {
      final handler = FakeCallbackHandler();
      final tool = Tool.fromFunction<String, String>(
        name: 'failing_tool',
        description: 'A failing tool',
        inputJsonSchema: const {
          'type': 'object',
          'properties': {
            'input': {'type': 'string'},
          },
        },
        func: (input) => throw Exception('tool error'),
      );

      try {
        await tool.invoke('hello', options: ToolOptions(callbacks: [handler]));
      } catch (_) {}

      expect(handler.toolStarts, 1);
      expect(handler.toolErrors, 1);
    });
  });

  group('LLM integration', () {
    test('invoke dispatches onLlmStart and onLlmEnd', () async {
      final handler = FakeCallbackHandler();
      const llm = FakeEchoLLM();

      await llm.invoke(
        PromptValue.string('Hello'),
        options: FakeLLMOptions(callbacks: [handler]),
      );

      expect(handler.llmStarts, 1);
      expect(handler.llmEnds, 1);
    });

    test(
      'stream dispatches onLlmStart, onLlmNewToken, and onLlmEnd',
      () async {
        final handler = FakeCallbackHandler();
        const llm = FakeEchoLLM();

        final chunks = await llm
            .stream(
              PromptValue.string('Hello'),
              options: FakeLLMOptions(callbacks: [handler]),
            )
            .toList();

        expect(chunks, isNotEmpty);
        expect(handler.llmStarts, 1);
        expect(handler.newTokens, chunks.length);
        expect(handler.llmEnds, 1);
      },
    );

    test('invoke dispatches onLlmError on failure', () async {
      final handler = FakeCallbackHandler();
      final llm = FakeHandlerLLM(
        handler: (prompt, options, callCount) =>
            throw Exception('LLM error'),
      );

      try {
        await llm.invoke(
          PromptValue.string('Hello'),
          options: FakeLLMOptions(callbacks: [handler]),
        );
      } catch (_) {}

      expect(handler.llmStarts, 1);
      expect(handler.llmErrors, 1);
    });
  });

  group('Chain integration', () {
    test('invoke dispatches onChainStart and onChainEnd', () async {
      final handler = FakeCallbackHandler();
      final llm = FakeLLM(responses: ['Hello!']);
      final prompt = PromptTemplate.fromTemplate('{input}');
      final chain = LLMChain(llm: llm, prompt: prompt);

      await chain.invoke(
        {'input': 'Hi'},
        options: ChainOptions(callbacks: [handler]),
      );

      expect(handler.chainStarts, 1);
      expect(handler.chainEnds, 1);
    });
  });

  group('RunInfo generation', () {
    test('generateRunId produces valid UUID v4 format', () {
      final id = generateRunId();
      final uuidPattern = RegExp(
        r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
      );
      expect(uuidPattern.hasMatch(id), isTrue);
    });

    test('generateRunId produces unique IDs', () {
      final ids = List.generate(100, (_) => generateRunId());
      expect(ids.toSet().length, 100);
    });
  });

  group('Custom events', () {
    test('handleCustomEvent dispatches onCustomEvent', () {
      final handler = FakeCallbackHandler();
      CallbackManager(handlers: [handler])
          .handleCustomEvent(name: 'test_event', data: {'key': 'value'});

      expect(handler.customEvents, 1);
    });
  });
}

class ThrowingCallbackHandler extends BaseCallbackHandler {
  ThrowingCallbackHandler({super.raiseError});

  @override
  void onChainStart({
    required RunInfo runInfo,
    required Map<String, dynamic> inputs,
  }) {
    throw Exception('handler error');
  }
}
