import 'package:langchain_core/chat_models.dart';
import 'package:langchain_ollama/src/chat_models/chat_ollama/mappers.dart';
import 'package:ollama_dart/ollama_dart.dart' as ollama;
import 'package:test/test.dart';

void main() {
  test('preserves reasoning, text, images, and parallel tool calls', () {
    const response = ollama.ChatResponse(
      model: 'qwen3',
      message: ollama.ChatResponseMessage(
        role: ollama.MessageRole.assistant,
        thinking: 'reasoning',
        content: 'answer',
        images: ['image-data'],
        toolCalls: [
          ollama.ToolCall(
            function: ollama.ToolCallFunction(
              name: 'weather',
              arguments: {'city': 'Madrid'},
            ),
          ),
          ollama.ToolCall(
            function: ollama.ToolCallFunction(
              name: 'weather',
              arguments: {'city': 'Paris'},
            ),
          ),
        ],
      ),
      done: true,
      doneReason: ollama.DoneReason.stop,
    );

    final message = response.toChatResult('response-1').output;

    expect(message.contentBlocks.map((block) => block.runtimeType), [
      AIChatMessageReasoningBlock,
      AIChatMessageTextBlock,
      AIChatMessageMediaBlock,
      AIChatMessageToolCall,
      AIChatMessageToolCall,
    ]);
    expect(message.content, 'reasoninganswer');
    expect(message.toolCalls.map((call) => call.id), [
      'ollama:response-1:tool:0',
      'ollama:response-1:tool:1',
    ]);
    expect(message.toolCalls.map((call) => call.arguments['city']), [
      'Madrid',
      'Paris',
    ]);
  });

  test('replays accumulated thinking, content, images, and tool calls', () {
    const response = ollama.ChatResponse(
      message: ollama.ChatResponseMessage(
        thinking: 'reasoning',
        content: 'answer',
        images: ['image-data'],
        toolCalls: [
          ollama.ToolCall(
            function: ollama.ToolCallFunction(
              name: 'weather',
              arguments: {'city': 'Madrid'},
            ),
          ),
        ],
      ),
    );
    final message = response.toChatResult('response-1').output;

    final replayed = [message].toMessages().single;

    expect(replayed.thinking, 'reasoning');
    expect(replayed.content, 'answer');
    expect(replayed.images, ['image-data']);
    expect(replayed.toolCalls!.single.function!.arguments, {'city': 'Madrid'});
  });

  test('merges streamed reasoning and visible text independently', () {
    const first = ollama.ChatStreamEvent(
      message: ollama.ChatResponseMessage(thinking: 'reason', content: 'ans'),
    );
    const second = ollama.ChatStreamEvent(
      message: ollama.ChatResponseMessage(thinking: 'ing', content: 'wer'),
      done: true,
      doneReason: ollama.DoneReason.stop,
    );

    final message = first
        .toChatResult('response-1', streaming: true)
        .output
        .concat(second.toChatResult('response-1', streaming: true).output);

    expect(
      message.contentBlocks
          .whereType<AIChatMessageReasoningBlock>()
          .single
          .reasoning,
      'reasoning',
    );
    expect(
      message.contentBlocks.whereType<AIChatMessageTextBlock>().single.text,
      'answer',
    );
  });
}
