// ignore_for_file: avoid_dynamic_calls

@TestOn('vm')
library; // Uses dart:io

import 'dart:convert';
import 'dart:io';

import 'package:openai_dart/openai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('GoogleAI OpenAI-compatible API tests', () {
    late OpenAIClient client;

    setUp(() {
      client = OpenAIClient(
        apiKey: Platform.environment['GOOGLEAI_API_KEY'],
        baseUrl: 'https://generativelanguage.googleapis.com/v1beta/openai',
      );
    });

    tearDown(() {
      client.endSession();
    });

    test('Test call chat completion API', () async {
      final response = await client.createChatCompletion(
        request: const CreateChatCompletionRequest(
          model: ChatCompletionModel.modelId('gemini-2.0-flash'),
          messages: [
            ChatCompletionMessage.system(
              content: 'Be concise, reply with one sentence.',
            ),
            ChatCompletionMessage.user(
              content: ChatCompletionUserMessageContent.string(
                'Where does "hello world" come from?',
              ),
            ),
          ],
        ),
      );
      expect(response.choices, isNotEmpty);
      expect(response.choices.first.message.content, isNotEmpty);
    });

    test('Test streaming tool calls', () async {
      const model = ChatCompletionModel.modelId('gemini-2.0-flash');
      const tool = ChatCompletionTool(
        type: ChatCompletionToolType.function,
        function: FunctionObject(
          name: 'get_time',
          description: 'Get current time',
          parameters: {
            'type': 'object',
            'properties': <String, dynamic>{},
          },
        ),
      );

      // First request with the user question (streaming)
      final stream1 = client.createChatCompletionStream(
        request: const CreateChatCompletionRequest(
          model: model,
          messages: [
            ChatCompletionMessage.user(
              content: ChatCompletionUserMessageContent.string(
                'What time is it?',
              ),
            ),
          ],
          tools: [tool],
        ),
      );

      // Collect streaming response and tool calls
      const assistantContent = '';
      final toolCallsMap = <String, Map<String, dynamic>>{};

      await for (final chunk in stream1) {
        final delta = chunk.choices.first.delta;
        // Handle tool calls
        final toolCalls = delta?.toolCalls;
        if (toolCalls != null) {
          for (final toolCall in toolCalls) {
            final id = (toolCall.id?.isNotEmpty ?? false) ? toolCall.id! : 'id';
            if (id.isNotEmpty) {
              toolCallsMap[id] ??= {
                'id': id,
                'type': 'function',
                'function': {'name': '', 'arguments': ''},
              };

              if (toolCall.function?.name != null) {
                toolCallsMap[id]!['function']['name'] = toolCall.function!.name;
              }
              if (toolCall.function?.arguments != null) {
                toolCallsMap[id]!['function']['arguments'] +=
                    toolCall.function!.arguments;
              }
            }
          }
        }
      }

      if (toolCallsMap.isNotEmpty) {
        // Convert collected tool calls to proper format
        final toolCallsList = toolCallsMap.values
            .map(
              (toolCallData) => ChatCompletionMessageToolCall(
                id: toolCallData['id'],
                type: ChatCompletionMessageToolCallType.function,
                function: ChatCompletionMessageFunctionCall(
                  name: toolCallData['function']['name'],
                  arguments: toolCallData['function']['arguments'],
                ),
              ),
            )
            .toList();

        final toolCall = toolCallsList.first;

        // Execute the tool call
        final toolResult = {'time': DateTime.now().toString()};

        // Create assistant message from first response
        final assistantMessage = ChatCompletionMessage.assistant(
          content: assistantContent.isEmpty ? null : assistantContent,
          toolCalls: toolCallsList,
        );

        // Second request with tool result (streaming)
        final stream2 = client.createChatCompletionStream(
          request: CreateChatCompletionRequest(
            model: model,
            messages: [
              const ChatCompletionMessage.user(
                content: ChatCompletionUserMessageContent.string(
                  'What time is it?',
                ),
              ),
              assistantMessage,
              ChatCompletionMessage.tool(
                content: json.encode(toolResult),
                toolCallId: toolCall.id,
              ),
            ],
            tools: [tool],
          ),
        );

        var responseContent = '';
        // Stream the final response
        await for (final chunk in stream2) {
          final delta = chunk.choices.first.delta;
          final content = delta?.content;
          if (content != null) {
            responseContent += content;
          }
        }

        expect(responseContent, isNotEmpty);
        final now = DateTime.now();
        expect(responseContent, contains('${now.minute}'));
      }
    });

    test('Test call embeddings API', () async {
      final response = await client.createEmbedding(
        request: const CreateEmbeddingRequest(
          model: EmbeddingModel.modelId('text-embedding-004'),
          input: EmbeddingInput.string('Hello world'),
        ),
      );
      expect(response.data, hasLength(1));
      expect(response.data.first.embeddingVector, isNotEmpty);
    });
  });
}
