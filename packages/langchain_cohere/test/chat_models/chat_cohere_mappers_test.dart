import 'package:langchain_cohere/src/chat_models/mappers.dart';
import 'package:langchain_cohere/src/client/client.dart';
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/tools.dart';
import 'package:test/test.dart';

void main() {
  group('ChatCohere mappers', () {
    test('Maps messages to Cohere messages', () {
      final messages = [
        ChatMessage.system('You are a helpful assistant'),
        ChatMessage.humanText('Hello!'),
        ChatMessage.aiText('Hi! How can I help you?'),
        ChatMessage.aiText(
          '',
          toolCalls: const [
            AIChatMessageToolCall(
              id: 'call_1',
              name: 'get_weather',
              argumentsRaw: '{"location":"Madrid"}',
              arguments: {'location': 'Madrid'},
            ),
          ],
        ),
        ChatMessage.tool(toolCallId: 'call_1', content: '{"temperature":22}'),
      ];

      final cohereMessages = messages.toCohereMessages();

      expect(
        cohereMessages.map((final m) => m.toJson()).toList(growable: false),
        [
          {'role': 'system', 'content': 'You are a helpful assistant'},
          {'role': 'user', 'content': 'Hello!'},
          {'role': 'assistant', 'content': 'Hi! How can I help you?'},
          {
            'role': 'assistant',
            'tool_calls': [
              {
                'id': 'call_1',
                'type': 'function',
                'function': {
                  'name': 'get_weather',
                  'arguments': '{"location":"Madrid"}',
                },
              },
            ],
          },
          {
            'role': 'tool',
            'tool_call_id': 'call_1',
            'content': '{"temperature":22}',
          },
        ],
      );
    });

    test('Throws when mapping a custom message', () {
      final messages = [ChatMessage.custom('Hello!', role: 'custom')];
      expect(messages.toCohereMessages, throwsUnsupportedError);
    });

    test('Maps tool specs to Cohere tools', () {
      const tools = [
        ToolSpec(
          name: 'get_weather',
          description: 'Get the weather',
          inputJsonSchema: {
            'type': 'object',
            'properties': {
              'location': {'type': 'string'},
            },
            'required': ['location'],
          },
        ),
      ];

      final cohereTools = tools.toCohereTools();

      expect(cohereTools, hasLength(1));
      expect(cohereTools.first.toJson(), {
        'type': 'function',
        'function': {
          'name': 'get_weather',
          'description': 'Get the weather',
          'parameters': {
            'type': 'object',
            'properties': {
              'location': {'type': 'string'},
            },
            'required': ['location'],
          },
        },
      });
    });

    test('Maps tool choices', () {
      expect(ChatToolChoice.none.toCohereToolChoice(), 'NONE');
      expect(ChatToolChoice.auto.toCohereToolChoice(), isNull);
      expect(ChatToolChoice.required.toCohereToolChoice(), 'REQUIRED');
      expect(
        ChatToolChoice.forced(name: 'get_weather').toCohereToolChoice,
        throwsUnsupportedError,
      );
    });

    test('Maps a text response to a ChatResult', () {
      const response = CohereChatResponse(
        id: 'res_1',
        finishReason: 'COMPLETE',
        text: 'Hello world!',
        usage: CohereUsage(inputTokens: 7, outputTokens: 12),
      );

      final result = response.toChatResult(model: 'command-r-plus-08-2024');

      expect(result.id, 'res_1');
      expect(result.output.contentAsString, 'Hello world!');
      expect(result.output.toolCalls, isEmpty);
      expect(result.finishReason, FinishReason.stop);
      expect(result.metadata, {'model': 'command-r-plus-08-2024'});
      expect(result.usage.promptTokens, 7);
      expect(result.usage.responseTokens, 12);
      expect(result.usage.totalTokens, 19);
    });

    test('Maps a tool call response to a ChatResult', () {
      const response = CohereChatResponse(
        id: 'res_2',
        finishReason: 'TOOL_CALL',
        toolPlan: 'I will check the weather.',
        toolCalls: [
          CohereToolCall(
            id: 'call_1',
            function: CohereFunctionCall(
              name: 'get_weather',
              arguments: '{"location":"Madrid"}',
            ),
          ),
        ],
      );

      final result = response.toChatResult(model: 'command-r-plus-08-2024');

      expect(result.finishReason, FinishReason.toolCalls);
      expect(result.metadata['tool_plan'], 'I will check the weather.');
      expect(result.output.toolCalls, hasLength(1));
      final toolCall = result.output.toolCalls.first;
      expect(toolCall.id, 'call_1');
      expect(toolCall.name, 'get_weather');
      expect(toolCall.argumentsRaw, '{"location":"Madrid"}');
      expect(toolCall.arguments, {'location': 'Madrid'});
    });

    test('Maps finish reasons', () {
      expect(mapCohereFinishReason('COMPLETE'), FinishReason.stop);
      expect(mapCohereFinishReason('STOP_SEQUENCE'), FinishReason.stop);
      expect(mapCohereFinishReason('MAX_TOKENS'), FinishReason.length);
      expect(mapCohereFinishReason('TOOL_CALL'), FinishReason.toolCalls);
      expect(mapCohereFinishReason('ERROR'), FinishReason.unspecified);
      expect(mapCohereFinishReason(null), FinishReason.unspecified);
    });
  });
}
