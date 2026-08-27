import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/tools.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:langchain_openai/src/chat_models/chat_openai_responses_mappers.dart';
import 'package:openai_dart/openai_dart.dart' as oai;
import 'package:test/test.dart';

void main() {
  group('ChatOpenAIResponses mapper tests', () {
    group('Message mapping', () {
      test('should map SystemChatMessage to system item', () {
        final messages = [ChatMessage.system('You are helpful.')];
        final input = messages.toResponseInput();

        final items = switch (input) {
          oai.ResponseInputItems(:final items) => items,
          _ => <oai.Item>[],
        };
        expect(items, hasLength(1));
        expect(items.first, isA<oai.MessageItem>());
      });

      test('should map HumanChatMessage with text to user item', () {
        final messages = [ChatMessage.humanText('Hello')];
        final input = messages.toResponseInput();

        final items = switch (input) {
          oai.ResponseInputItems(:final items) => items,
          _ => <oai.Item>[],
        };
        expect(items, hasLength(1));
        expect(items.first, isA<oai.MessageItem>());
      });

      test('should map AIChatMessage to assistant text item', () {
        final messages = [ChatMessage.aiText('I am fine.')];
        final input = messages.toResponseInput();

        final items = switch (input) {
          oai.ResponseInputItems(:final items) => items,
          _ => <oai.Item>[],
        };
        expect(items, hasLength(1));
        expect(items.first, isA<oai.MessageItem>());
      });

      test('should map AIChatMessage with tool calls to separate items', () {
        final messages = [
          ChatMessage.aiText(
            'Let me check.',
            toolCalls: const [
              AIChatMessageToolCall(
                id: 'call_1',
                name: 'get_weather',
                argumentsRaw: '{"location":"Barcelona"}',
                arguments: {'location': 'Barcelona'},
              ),
            ],
          ),
        ];
        final input = messages.toResponseInput();

        final items = switch (input) {
          oai.ResponseInputItems(:final items) => items,
          _ => <oai.Item>[],
        };
        // Should produce 2 items: assistant text + function call
        expect(items, hasLength(2));
        expect(items[0], isA<oai.MessageItem>());
        expect(items[1], isA<oai.FunctionCallItem>());
        final fc = items[1] as oai.FunctionCallItem;
        expect(fc.callId, 'call_1');
        expect(fc.name, 'get_weather');
        expect(fc.arguments, '{"location":"Barcelona"}');
      });

      test('should map AIChatMessage without content to only tool calls', () {
        final messages = [
          ChatMessage.aiText(
            '',
            toolCalls: const [
              AIChatMessageToolCall(
                id: 'call_1',
                name: 'get_weather',
                argumentsRaw: '{"location":"Barcelona"}',
                arguments: {'location': 'Barcelona'},
              ),
            ],
          ),
        ];
        final input = messages.toResponseInput();

        final items = switch (input) {
          oai.ResponseInputItems(:final items) => items,
          _ => <oai.Item>[],
        };
        // No text content, so only the function call item
        expect(items, hasLength(1));
        expect(items.first, isA<oai.FunctionCallItem>());
      });

      test('should map ToolChatMessage to function call output', () {
        final messages = [
          ChatMessage.tool(
            toolCallId: 'call_1',
            content: '{"temperature": 22}',
          ),
        ];
        final input = messages.toResponseInput();

        final items = switch (input) {
          oai.ResponseInputItems(:final items) => items,
          _ => <oai.Item>[],
        };
        expect(items, hasLength(1));
        expect(items.first, isA<oai.FunctionCallOutputItem>());
      });
    });

    group('Tool spec mapping', () {
      test('should map ToolSpec to ResponseTool', () {
        final tools = [
          const ToolSpec(
            name: 'get_weather',
            description: 'Get weather data',
            inputJsonSchema: {
              'type': 'object',
              'properties': {
                'location': {'type': 'string'},
              },
            },
          ),
        ];

        final result = tools.toResponseTools();
        expect(result, hasLength(1));
        expect(result.first, isA<oai.ResponseTool>());
      });
    });

    group('Tool choice mapping', () {
      test('should map ChatToolChoiceNone', () {
        const choice = ChatToolChoiceNone();
        expect(choice.toResponseToolChoice(), oai.ResponseToolChoice.none);
      });

      test('should map ChatToolChoiceAuto', () {
        const choice = ChatToolChoiceAuto();
        expect(choice.toResponseToolChoice(), oai.ResponseToolChoice.auto);
      });

      test('should map ChatToolChoiceRequired', () {
        const choice = ChatToolChoiceRequired();
        expect(choice.toResponseToolChoice(), oai.ResponseToolChoice.required);
      });

      test('should map ChatToolChoiceForced', () {
        const choice = ChatToolChoiceForced(name: 'get_weather');
        final result = choice.toResponseToolChoice();
        expect(result, isA<oai.ResponseToolChoice>());
      });
    });

    group('Response format mapping', () {
      test('should map text format', () {
        const format = ChatOpenAIResponsesResponseFormatText();
        final result = format.toTextConfig();
        expect(result, isA<oai.TextConfig>());
      });

      test('should map JSON object format', () {
        const format = ChatOpenAIResponsesResponseFormatJsonObject();
        final result = format.toTextConfig();
        expect(result, isA<oai.TextConfig>());
      });

      test('should map JSON schema format', () {
        const format = ChatOpenAIResponsesResponseFormatJsonSchema(
          name: 'test',
          schema: {'type': 'object'},
        );
        final result = format.toTextConfig();
        expect(result, isA<oai.TextConfig>());
      });
    });

    group('createResponseRequest', () {
      test('should create request with default options', () {
        final messages = [ChatMessage.humanText('Hello')];
        final request = createResponseRequest(
          messages,
          options: null,
          defaultOptions: const ChatOpenAIResponsesOptions(
            model: 'gpt-4o-mini',
          ),
        );

        expect(request.model, 'gpt-4o-mini');
      });

      test('should override defaults with call options', () {
        final messages = [ChatMessage.humanText('Hello')];
        final request = createResponseRequest(
          messages,
          options: const ChatOpenAIResponsesOptions(
            model: 'gpt-4o',
            temperature: 0.5,
          ),
          defaultOptions: const ChatOpenAIResponsesOptions(
            model: 'gpt-4o-mini',
            temperature: 0.9,
          ),
        );

        expect(request.model, 'gpt-4o');
        expect(request.temperature, 0.5);
      });

      test('should pass metadata as Map<String, String>', () {
        final messages = [ChatMessage.humanText('Hello')];
        final request = createResponseRequest(
          messages,
          options: const ChatOpenAIResponsesOptions(
            model: 'gpt-4o-mini',
            metadata: {'key': 'value'},
          ),
          defaultOptions: const ChatOpenAIResponsesOptions(
            model: 'gpt-4o-mini',
          ),
        );

        expect(request.metadata, {'key': 'value'});
      });
    });

    group('ordered output blocks', () {
      test('preserves reasoning, text, function, and server-tool order', () {
        final output = <Map<String, dynamic>>[
          {
            'type': 'reasoning',
            'id': 'reasoning_1',
            'summary': [
              {'type': 'summary_text', 'text': 'Check the weather.'},
            ],
            'encrypted_content': 'opaque',
          },
          {
            'type': 'message',
            'id': 'message_1',
            'role': 'assistant',
            'content': [
              {'type': 'output_text', 'text': 'I will check.'},
            ],
          },
          {
            'type': 'function_call',
            'id': 'item_1',
            'call_id': 'call_1',
            'name': 'weather',
            'arguments': '{"city":"Madrid"}',
          },
          {'type': 'web_search_call', 'id': 'search_1', 'status': 'completed'},
        ];
        final response = oai.Response.fromJson({
          'id': 'response_1',
          'object': 'response',
          'created_at': 1,
          'status': 'completed',
          'output': output,
        });

        final message = response.toChatResult().output;
        final replayed = <ChatMessage>[message].toResponseInput();

        expect(message.content.map((block) => block.runtimeType), [
          AIChatMessageReasoningBlock,
          AIChatMessageTextBlock,
          AIChatMessageToolCall,
          AIChatMessageServerToolCall,
        ]);
        expect(message.contentAsString, 'I will check.');
        expect(message.toolCalls.single.id, 'call_1');
        expect(replayed.toJson(), output);
      });

      test('keeps parallel same-name streamed function calls distinct', () {
        final accumulator = oai.ResponseStreamAccumulator();
        final functionCallIdsByOutputIndex = <int, String>{};
        final results = <ChatResult>[];

        void add(final oai.ResponseStreamEvent event) {
          accumulator.add(event);
          final result = accumulator.toChatResult(
            functionCallIdsByOutputIndex: functionCallIdsByOutputIndex,
          );
          if (result != null) results.add(result);
        }

        add(
          const oai.OutputItemAddedEvent(
            outputIndex: 0,
            item: oai.FunctionCallOutputItemResponse(
              id: 'item_madrid',
              callId: 'call_madrid',
              name: 'weather',
              arguments: '',
            ),
          ),
        );
        add(
          const oai.OutputItemAddedEvent(
            outputIndex: 1,
            item: oai.FunctionCallOutputItemResponse(
              id: 'item_paris',
              callId: 'call_paris',
              name: 'weather',
              arguments: '',
            ),
          ),
        );
        add(
          const oai.FunctionCallArgumentsDeltaEvent(
            outputIndex: 0,
            itemId: 'item_madrid',
            delta: '{"city":"Madrid"}',
          ),
        );
        add(
          const oai.FunctionCallArgumentsDeltaEvent(
            outputIndex: 1,
            itemId: 'item_paris',
            delta: '{"city":"Paris"}',
          ),
        );

        final calls = results
            .map((result) => result.output)
            .reduce((first, next) => first.concat(next))
            .toolCalls;

        expect(calls.map((call) => call.id), ['call_madrid', 'call_paris']);
        expect(calls.map((call) => call.arguments['city']), [
          'Madrid',
          'Paris',
        ]);
      });

      test('keeps content indexes distinct within one output item', () {
        final accumulator = oai.ResponseStreamAccumulator();
        final results = <ChatResult>[];

        for (final event in const <oai.ResponseStreamEvent>[
          oai.OutputTextDeltaEvent(
            itemId: 'message_1',
            outputIndex: 0,
            contentIndex: 0,
            delta: 'first',
          ),
          oai.OutputTextDeltaEvent(
            itemId: 'message_1',
            outputIndex: 0,
            contentIndex: 1,
            delta: 'second',
          ),
        ]) {
          accumulator.add(event);
          results.add(accumulator.toChatResult()!);
        }

        final output = results
            .map((result) => result.output)
            .reduce((first, next) => first.concat(next));

        expect(output.content, hasLength(2));
        expect(output.contentAsString, 'firstsecond');
      });

      test('retains completed server-tool output item data', () {
        final accumulator = oai.ResponseStreamAccumulator();
        final results = <ChatResult>[];

        for (final event in const <oai.ResponseStreamEvent>[
          oai.OutputItemAddedEvent(
            outputIndex: 0,
            item: oai.WebSearchCallOutputItem(
              id: 'search_1',
              status: oai.ItemStatus.inProgress,
            ),
          ),
          oai.OutputItemDoneEvent(
            outputIndex: 0,
            item: oai.WebSearchCallOutputItem(
              id: 'search_1',
              status: oai.ItemStatus.completed,
            ),
          ),
        ]) {
          accumulator.add(event);
          results.add(accumulator.toChatResult()!);
        }

        final output = results
            .map((result) => result.output)
            .reduce((first, next) => first.concat(next));
        final block = output.content.single as AIChatMessageServerToolCall;

        expect(block.name, 'web_search_call');
        expect(block.arguments['status'], 'completed');
        final openAIData = block.providerData['openai'] as Map<String, dynamic>;
        final outputItem = openAIData['outputItem'] as Map<String, dynamic>;
        expect(outputItem['status'], 'completed');
      });
    });
  });
}
