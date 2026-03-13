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
        final messages = [ChatMessage.ai('I am fine.')];
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
          ChatMessage.ai(
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
          ChatMessage.ai(
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
  });
}
