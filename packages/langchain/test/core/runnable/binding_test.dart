// ignore_for_file: unused_element
import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('RunnableBinding tests', () {
    test('RunnableBinding from Runnable.bind', () async {
      final prompt = PromptTemplate.fromTemplate('Hello {input}');
      const model = _FakeOptionsChatModel();
      const outputParser = StringOutputParser<AIChatMessage>();
      final chain = prompt |
          model.bind(const _FakeOptionsChatModelOptions('world')) |
          outputParser;

      final res = await chain.invoke({'input': 'world'});
      expect(res, 'Hello ');
    });

    test('Streaming RunnableBinding', () async {
      final prompt = PromptTemplate.fromTemplate('Hello {input}');
      const model = _FakeOptionsChatModel();
      const outputParser = StringOutputParser<AIChatMessage>();

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
  const _FakeOptionsChatModel();

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
  Stream<ChatResult> streamFromInputStream(
    final Stream<PromptValue> inputStream, {
    final _FakeOptionsChatModelOptions? options,
  }) {
    return inputStream.asyncExpand(
      (final input) {
        final prompt = input
            .toChatMessages()
            .first
            .contentAsString
            .replaceAll(options?.stop ?? '', '')
            .split('');
        return Stream.fromIterable(prompt).map(
          (final char) => ChatResult(
            generations: [ChatGeneration(AIChatMessage(content: char))],
          ),
        );
      },
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
}
