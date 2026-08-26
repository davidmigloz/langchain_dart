import 'package:langchain_core/chat_models.dart';
import 'package:langchain_openai/src/chat_models/mappers.dart';
import 'package:openai_dart/openai_dart.dart' as oai;
import 'package:test/test.dart';

void main() {
  test('Chat Completions preserves reasoning, text, and tool calls', () {
    const completion = oai.ChatCompletion(
      id: 'completion-1',
      object: 'chat.completion',
      model: 'gpt-compatible',
      choices: [
        oai.ChatChoice(
          message: oai.AssistantMessage(
            reasoningContent: 'reasoning',
            content: 'answer',
            toolCalls: [
              oai.ToolCall(
                id: 'call-1',
                type: 'function',
                function: oai.FunctionCall(
                  name: 'weather',
                  arguments: '{"city":"Madrid"}',
                ),
              ),
            ],
          ),
        ),
      ],
    );

    final message = completion.toChatResult('completion-1').output;

    expect(message.content.map((block) => block.runtimeType), [
      AIChatMessageReasoningBlock,
      AIChatMessageTextBlock,
      AIChatMessageToolCall,
    ]);
    expect(message.contentAsString, 'answer');
    expect(message.toolCalls.single.arguments, {'city': 'Madrid'});
  });

  test('Chat Completions streams parallel same-name calls by index', () {
    oai.ChatStreamEvent chunk(final List<oai.ToolCallDelta> calls) =>
        oai.ChatStreamEvent(
          choices: [
            oai.ChatStreamChoice(delta: oai.ChatDelta(toolCalls: calls)),
          ],
        );

    final starts = chunk(const [
      oai.ToolCallDelta(
        index: 0,
        id: 'call-madrid',
        function: oai.FunctionCallDelta(name: 'weather'),
      ),
      oai.ToolCallDelta(
        index: 1,
        id: 'call-paris',
        function: oai.FunctionCallDelta(name: 'weather'),
      ),
    ]).toChatResult('completion-1').output;
    final arguments = chunk(const [
      oai.ToolCallDelta(
        index: 0,
        function: oai.FunctionCallDelta(arguments: '{"city":"Madrid"}'),
      ),
      oai.ToolCallDelta(
        index: 1,
        function: oai.FunctionCallDelta(arguments: '{"city":"Paris"}'),
      ),
    ]).toChatResult('completion-1').output;

    final calls = starts.concat(arguments).toolCalls;

    expect(calls.map((call) => call.id), ['call-madrid', 'call-paris']);
    expect(calls.map((call) => call.arguments['city']), ['Madrid', 'Paris']);
  });
}
