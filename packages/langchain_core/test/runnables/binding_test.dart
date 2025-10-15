// ignore_for_file: unused_element
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/output_parsers.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_core/runnables.dart';
import 'package:langchain_core/tools.dart';
import 'package:test/test.dart';

void main() {
  group('RunnableBinding tests', () {
    test('RunnableBinding from Runnable.bind', () async {
      final prompt = PromptTemplate.fromTemplate('Hello {input}');
      const model = _FakeOptionsChatModel();
      const outputParser = StringOutputParser<ChatResult>();
      final chain =
          prompt |
          model.bind(const _FakeOptionsChatModelOptions('world')) |
          outputParser;

      final res = await chain.invoke({'input': 'world'});
      expect(res, 'Hello ');
    });

    test('Chaining bind calls', () async {
      final model = FakeChatModel(
        responses: ['a', 'b'],
        defaultOptions: const FakeChatModelOptions(
          model: 'modelA',
          metadata: {'foo': 'bar'},
        ),
      );

      final res1 = await model.invoke(PromptValue.string('1'));
      expect(res1.metadata['model'], 'modelA');
      expect(res1.metadata['foo'], 'bar');

      final chain2 = model.bind(const FakeChatModelOptions(model: 'modelB'));
      final res2 = await chain2.invoke(PromptValue.string('2'));
      expect(res2.metadata['model'], 'modelB');
      expect(res2.metadata['foo'], 'bar');

      final chain3 = chain2.bind(
        const FakeChatModelOptions(metadata: {'foo': 'baz'}),
      );
      final res3 = await chain3.invoke(PromptValue.string('3'));
      expect(res3.metadata['model'], 'modelB');
      expect(res3.metadata['foo'], 'baz');
    });

    test('Streaming RunnableBinding', () async {
      final prompt = PromptTemplate.fromTemplate('Hello {input}');
      const model = _FakeOptionsChatModel();
      const outputParser = StringOutputParser<ChatResult>();

      final chain = prompt
          .pipe(model.bind(const _FakeOptionsChatModelOptions('world')))
          .pipe(outputParser);
      final stream = chain.stream({'input': 'world'});

      final streamList = await stream.toList();
      expect(streamList.length, 6);
      expect(streamList, isA<List<String>>());

      final output = streamList.join();
      expect(output, 'Hello ');
    });
  });
}

class _FakeOptionsChatModel
    extends SimpleChatModel<_FakeOptionsChatModelOptions> {
  const _FakeOptionsChatModel()
    : super(defaultOptions: const _FakeOptionsChatModelOptions(''));

  @override
  String get modelType => 'fake-options-chat-model';

  @override
  Future<String> callInternal(
    final List<ChatMessage> messages, {
    final _FakeOptionsChatModelOptions? options,
  }) {
    return Future.value(
      messages.first.contentAsString.replaceAll(options?.stop ?? '', ''),
    );
  }

  @override
  Stream<ChatResult> stream(
    final PromptValue input, {
    final _FakeOptionsChatModelOptions? options,
  }) {
    final prompt = input
        .toChatMessages()
        .first
        .contentAsString
        .replaceAll(options?.stop ?? '', '')
        .split('');
    return Stream.fromIterable(prompt).map(
      (final char) => ChatResult(
        id: 'fake-options-chat-model',
        output: AIChatMessage(content: char),
        finishReason: FinishReason.stop,
        metadata: const {},
        usage: const LanguageModelUsage(),
      ),
    );
  }

  @override
  Future<List<int>> tokenize(
    final PromptValue promptValue, {
    final _FakeOptionsChatModelOptions? options,
  }) async {
    return promptValue
        .toString()
        .split(' ')
        .map((final word) => word.hashCode)
        .toList(growable: false);
  }
}

class _FakeOptionsChatModelOptions extends ChatModelOptions {
  const _FakeOptionsChatModelOptions(this.stop);

  final String stop;

  @override
  ChatModelOptions copyWith({
    final String? model,
    final List<ToolSpec>? tools,
    final ChatToolChoice? toolChoice,
    final int? concurrencyLimit,
  }) {
    return _FakeOptionsChatModelOptions(stop);
  }
}
