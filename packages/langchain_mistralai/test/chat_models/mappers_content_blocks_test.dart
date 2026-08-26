import 'package:langchain_core/chat_models.dart';
import 'package:langchain_mistralai/src/chat_models/mappers.dart';
import 'package:mistralai_dart/mistralai_dart.dart' as mistral;
import 'package:test/test.dart';

void main() {
  test('preserves ordered text and tool-call content', () {
    const response = mistral.ChatCompletionResponse(
      id: 'completion-1',
      object: 'chat.completion',
      created: 1,
      model: 'mistral-small-latest',
      choices: [
        mistral.ChatChoice(
          index: 0,
          message: mistral.AssistantMessage(
            content: mistral.MessageContent.text('Checking the weather.'),
            toolCalls: [
              mistral.ToolCall(
                id: 'call-1',
                index: 0,
                function: mistral.FunctionCall(
                  name: 'weather',
                  arguments: '{"city":"Madrid"}',
                ),
              ),
            ],
          ),
        ),
      ],
    );

    final message = response.toChatResult().output;

    expect(message.content.map((block) => block.runtimeType), [
      AIChatMessageTextBlock,
      AIChatMessageToolCall,
    ]);
    expect(message.contentAsString, 'Checking the weather.');
    expect(message.toolCalls.single.arguments, {'city': 'Madrid'});
    final providerData =
        message.toolCalls.single.providerData['mistral']
            as Map<String, dynamic>;
    final toolCallData = providerData['toolCall'] as Map<String, dynamic>;
    expect(toolCallData['index'], 0);
  });

  test('preserves reasoning and unknown content parts for replay', () {
    final response = mistral.ChatCompletionResponse(
      id: 'completion-1',
      object: 'chat.completion',
      created: 1,
      model: 'magistral-small-latest',
      choices: [
        mistral.ChatChoice(
          index: 0,
          message: mistral.AssistantMessage(
            content: mistral.MessageContent.parts([
              const mistral.ThinkContentPart(
                thinking: [mistral.TextContentPart('reasoning')],
                closed: true,
                signature: 'opaque-signature',
              ),
              const mistral.TextContentPart('answer'),
              mistral.UnknownContentPart(const {
                'type': 'future_content',
                'value': 42,
              }),
            ]),
          ),
        ),
      ],
    );

    final message = response.toChatResult().output;
    final replayed =
        [message].toChatMessages().single as mistral.AssistantMessage;

    expect(message.content.map((block) => block.runtimeType), [
      AIChatMessageReasoningBlock,
      AIChatMessageTextBlock,
      AIChatMessageNonStandardBlock,
    ]);
    expect(message.contentAsString, 'answer');
    final original = response.message! as mistral.AssistantMessage;
    expect(replayed.content!.toJson(), original.content!.toJson());
  });

  test('replays raw tool-call arguments', () {
    const message = AIChatMessage(
      content: [
        AIChatMessageToolCall(
          id: 'call-1',
          name: 'weather',
          argumentsRaw: '{ "city" : "Madrid" }',
          arguments: {'city': 'Madrid'},
        ),
      ],
    );

    final mapped =
        [message].toChatMessages().single as mistral.AssistantMessage;

    expect(
      mapped.toolCalls!.single.function.arguments,
      '{ "city" : "Madrid" }',
    );
  });

  test('replays explicitly constructed reasoning as structured content', () {
    const message = AIChatMessage(
      content: [
        AIChatMessageReasoningBlock(reasoning: 'reasoning'),
        AIChatMessageTextBlock(text: 'answer'),
      ],
    );

    final mapped =
        [message].toChatMessages().single as mistral.AssistantMessage;
    final parts = (mapped.content! as mistral.MessagePartsContent).parts;

    expect(parts.first, isA<mistral.ThinkContentPart>());
    expect(parts.last, const mistral.TextContentPart('answer'));
  });

  test('replays a tool response with its call ID and name', () {
    final mapped =
        <ChatMessage>[
              ChatMessage.tool(
                toolCallId: 'call-1',
                name: 'weather',
                content: '{"temperature":22}',
              ),
            ].toChatMessages().single
            as mistral.ToolMessage;

    expect(mapped.toolCallId, 'call-1');
    expect(mapped.name, 'weather');
  });

  test('streams parallel same-name calls by provider index', () {
    mistral.ChatCompletionStreamResponse chunk(
      final List<mistral.ToolCall> calls,
    ) => mistral.ChatCompletionStreamResponse(
      id: 'completion-1',
      object: 'chat.completion.chunk',
      created: 1,
      model: 'mistral-small-latest',
      choices: [
        mistral.ChatChoiceDelta(
          index: 0,
          delta: mistral.DeltaContent(toolCalls: calls),
        ),
      ],
    );

    final starts = chunk(const [
      mistral.ToolCall(
        id: 'call-madrid',
        index: 0,
        function: mistral.FunctionCall(name: 'weather', arguments: ''),
      ),
      mistral.ToolCall(
        id: 'call-paris',
        index: 1,
        function: mistral.FunctionCall(name: 'weather', arguments: ''),
      ),
    ]).toChatResult().output;
    final arguments = chunk(const [
      mistral.ToolCall(
        id: '',
        index: 0,
        function: mistral.FunctionCall(
          name: '',
          arguments: '{"city":"Madrid"}',
        ),
      ),
      mistral.ToolCall(
        id: '',
        index: 1,
        function: mistral.FunctionCall(name: '', arguments: '{"city":"Paris"}'),
      ),
    ]).toChatResult().output;

    final calls = starts.concat(arguments).toolCalls;

    expect(calls.map((call) => call.id), ['call-madrid', 'call-paris']);
    expect(calls.map((call) => call.arguments['city']), ['Madrid', 'Paris']);
  });
}
