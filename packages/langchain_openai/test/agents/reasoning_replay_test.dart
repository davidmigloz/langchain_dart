import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:test/test.dart';

void main() {
  test('one stream invocation uses one fallback reasoning identity', () async {
    final client = MockClient((request) async {
      const body = '''
data: {"choices":[{"delta":{"reasoning_content":"first "}}]}

data: {"id":"late-provider-id","choices":[{"delta":{"reasoning_content":"second"}}]}

data: [DONE]

''';
      return http.Response(
        body,
        200,
        headers: {'content-type': 'text/event-stream'},
      );
    });
    final model = ChatOpenAI(
      apiKey: 'test-key',
      baseUrl: 'https://example.test/v1',
      client: client,
    );

    final chunks = await model.stream(PromptValue.string('hello')).toList();
    final merged = chunks.reduce((first, second) => first.concat(second));

    expect(chunks.map((chunk) => chunk.id).toSet(), hasLength(1));
    expect(
      merged.output.content.whereType<AIChatMessageReasoningBlock>().single,
      isA<AIChatMessageReasoningBlock>().having(
        (block) => block.reasoning,
        'reasoning',
        'first second',
      ),
    );
  });

  for (final withMemory in [false, true]) {
    test('replays reasoning and parallel results '
        '${withMemory ? 'with' : 'without'} memory', () async {
      final requests = <Map<String, dynamic>>[];
      final executedTools = <String>[];
      final reasoningDetails = <Map<String, dynamic>>[
        {
          'type': 'reasoning.text',
          'id': 'reasoning-1',
          'format': 'anthropic-claude-v1',
          'index': 0,
          'text': 'I should call both tools.',
          'signature': 'opaque-signature',
          'future': {
            'nested': [true, null],
          },
        },
      ];
      final client = MockClient((request) async {
        final body = jsonDecode(request.body) as Map<String, dynamic>;
        requests.add(body);
        final response = requests.length == 1
            ? {
                'id': 'completion-1',
                'object': 'chat.completion',
                'created': 1,
                'model': 'openrouter/model',
                'choices': [
                  {
                    'index': 0,
                    'message': {
                      'role': 'assistant',
                      'reasoning_content': 'primary reasoning',
                      'reasoning': 'secondary reasoning',
                      'reasoning_details': reasoningDetails,
                      'tool_calls': [
                        {
                          'id': 'call-1',
                          'type': 'function',
                          'function': {
                            'name': 'first_tool',
                            'arguments': '{"input":"one"}',
                          },
                        },
                        {
                          'id': 'call-2',
                          'type': 'function',
                          'function': {
                            'name': 'second_tool',
                            'arguments': '{"input":"two"}',
                          },
                        },
                      ],
                    },
                    'finish_reason': 'tool_calls',
                  },
                ],
              }
            : {
                'id': 'completion-2',
                'object': 'chat.completion',
                'created': 2,
                'model': 'openrouter/model',
                'choices': [
                  {
                    'index': 0,
                    'message': {'role': 'assistant', 'content': 'done'},
                    'finish_reason': 'stop',
                  },
                ],
              };
        return http.Response(
          jsonEncode(response),
          200,
          headers: {'content-type': 'application/json'},
        );
      });
      final firstTool = StringTool.fromFunction<ToolOptions>(
        name: 'first_tool',
        description: 'Returns the first result.',
        func: (input) {
          executedTools.add('first_tool:$input');
          return 'first result';
        },
      );
      final secondTool = StringTool.fromFunction<ToolOptions>(
        name: 'second_tool',
        description: 'Returns the second result.',
        func: (input) {
          executedTools.add('second_tool:$input');
          return 'second result';
        },
      );
      final memory = withMemory
          ? ConversationBufferMemory(returnMessages: true)
          : null;
      final model = ChatOpenAI(
        apiKey: 'test-key',
        baseUrl: 'https://example.test/v1',
        client: client,
        defaultOptions: const ChatOpenAIOptions(model: 'openrouter/model'),
      );
      final agent = ToolsAgent.fromLLMAndTools(
        llm: model,
        tools: [firstTool, secondTool],
        memory: memory,
      );
      final executor = AgentExecutor(agent: agent);

      final result = await executor.run('Use both tools.');

      expect(result, 'done');
      expect(executedTools, ['first_tool:one', 'second_tool:two']);
      expect(requests, hasLength(2));
      final messages = requests.last['messages'] as List<dynamic>;
      final assistantMessages = messages
          .whereType<Map<String, dynamic>>()
          .where((message) => message['role'] == 'assistant')
          .toList(growable: false);
      final toolMessages = messages
          .whereType<Map<String, dynamic>>()
          .where((message) => message['role'] == 'tool')
          .toList(growable: false);

      expect(assistantMessages, hasLength(1));
      expect(
        assistantMessages.single['reasoning_content'],
        'primary reasoning',
      );
      expect(assistantMessages.single['reasoning'], 'secondary reasoning');
      expect(assistantMessages.single['reasoning_details'], reasoningDetails);
      expect(
        (assistantMessages.single['tool_calls'] as List<dynamic>).map(
          (call) => (call as Map<String, dynamic>)['id'],
        ),
        ['call-1', 'call-2'],
      );
      expect(toolMessages.map((message) => message['tool_call_id']), [
        'call-1',
        'call-2',
      ]);
      expect(toolMessages.map((message) => message['content']), [
        'first result',
        'second result',
      ]);
    });
  }
}
