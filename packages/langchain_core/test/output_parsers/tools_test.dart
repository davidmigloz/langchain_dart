import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/output_parsers.dart';
import 'package:test/test.dart';

void main() {
  const result = ChatResult(
    id: 'id',
    output: AIChatMessage(
      content: '',
      toolCalls: [
        AIChatMessageToolCall(
          id: 'id',
          name: 'test',
          argumentsRaw: '{"foo":"bar","bar":"foo"}',
          arguments: {'foo': 'bar', 'bar': 'foo'},
        ),
      ],
    ),
    finishReason: FinishReason.stop,
    metadata: {},
    usage: LanguageModelUsage(),
  );

  const streamingResult = [
    ChatResult(
      id: 'id',
      output: AIChatMessage(
        content: '',
        toolCalls: [
          AIChatMessageToolCall(
            id: 'id',
            name: 'test',
            argumentsRaw: '{"foo":"bar"',
            arguments: {},
          ),
        ],
      ),
      finishReason: FinishReason.stop,
      metadata: {},
      usage: LanguageModelUsage(),
      streaming: true,
    ),
    ChatResult(
      id: 'id',
      output: AIChatMessage(
        content: '',
        toolCalls: [
          AIChatMessageToolCall(
            id: '',
            name: '',
            argumentsRaw: ', ',
            arguments: {},
          ),
        ],
      ),
      finishReason: FinishReason.stop,
      metadata: {},
      usage: LanguageModelUsage(),
      streaming: true,
    ),
    ChatResult(
      id: 'id',
      output: AIChatMessage(
        content: '',
        toolCalls: [
          AIChatMessageToolCall(
            id: '',
            name: '',
            argumentsRaw: '"bar":"foo"}',
            arguments: {},
          ),
        ],
      ),
      finishReason: FinishReason.stop,
      metadata: {},
      usage: LanguageModelUsage(),
      streaming: true,
    ),
  ];

  group('ToolsOutputParser tests', () {
    test('ToolsOutputParser invoke', () async {
      final res = await ToolsOutputParser().invoke(result);
      expect(res, const [
        ParsedToolCall(
          id: 'id',
          name: 'test',
          arguments: {'foo': 'bar', 'bar': 'foo'},
        ),
      ]);
    });

    test('ToolsOutputParser stream', () async {
      final res = await ToolsOutputParser()
          .streamFromInputStream(Stream.fromIterable(streamingResult))
          .toList();
      expect(res, const [
        [
          ParsedToolCall(id: 'id', name: 'test', arguments: {'foo': 'bar'}),
        ],
        [
          ParsedToolCall(
            id: 'id',
            name: 'test',
            arguments: {'foo': 'bar', 'bar': 'foo'},
          ),
        ],
      ]);
    });

    test('ToolsOutputParser reduce input stream', () async {
      final res = await ToolsOutputParser(
        reduceOutputStream: true,
      ).streamFromInputStream(Stream.fromIterable(streamingResult)).toList();
      expect(res, const [
        [
          ParsedToolCall(
            id: 'id',
            name: 'test',
            arguments: {'foo': 'bar', 'bar': 'foo'},
          ),
        ],
      ]);
    });
  });
}
