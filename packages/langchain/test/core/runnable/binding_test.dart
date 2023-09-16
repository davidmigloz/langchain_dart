// ignore_for_file: unused_element
import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('RunnableBinding tests', () {
    test('RunnableBinding from Runnable.bind', () async {
      final prompt = PromptTemplate.fromTemplate('Hello {input}');
      const model = _FakeOptionsChatModel();
      const outputParser = StringOutputParser<ChatMessage, ChatModelOptions>();
      final chain = prompt |
          model.bind(const _FakeOptionsChatModelOptions('world')) |
          outputParser;

      final res = await chain.invoke({'input': 'world'});
      expect(res, 'Hello ');
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
      messages.first.content.replaceAll(options?.stop ?? '', ''),
    );
  }

  @override
  Future<List<int>> tokenize(final PromptValue promptValue) async {
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
