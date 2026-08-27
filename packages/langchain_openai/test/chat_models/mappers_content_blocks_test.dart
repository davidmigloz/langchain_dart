import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_openai/langchain_openai.dart';
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

  test(
    'replays complete OpenRouter reasoning exactly after map round-trip',
    () {
      final reasoningDetails = <Map<String, dynamic>>[
        {
          'type': 'reasoning.text',
          'id': 'reasoning-1',
          'format': 'anthropic-claude-v1',
          'index': 0,
          'text': 'detail text',
          'signature': null,
          'future': {
            'nested': [true, null],
          },
        },
      ];
      final completion = oai.ChatCompletion.fromJson({
        'id': 'completion-1',
        'model': 'openrouter/model',
        'choices': [
          {
            'message': {
              'role': 'assistant',
              'content': 'answer',
              'reasoning_content': 'primary reasoning',
              'reasoning': 'secondary reasoning',
              'reasoning_details': reasoningDetails,
              'tool_calls': const [
                {
                  'id': 'call-1',
                  'type': 'function',
                  'function': {
                    'name': 'weather',
                    'arguments': '{"city":"Madrid"}',
                  },
                },
              ],
            },
          },
        ],
      });

      final mapped = completion.toChatResult('completion-1').output;
      final restored = AIChatMessage.fromMap(mapped.toMap());
      final outbound = [restored].toChatCompletionMessages().single.toJson();

      expect(mapped.contentAsString, 'answer');
      expect(
        mapped.content
            .whereType<AIChatMessageReasoningBlock>()
            .single
            .reasoning,
        'primary reasoning',
      );
      expect(outbound['reasoning_content'], 'primary reasoning');
      expect(outbound['reasoning'], 'secondary reasoning');
      expect(outbound['reasoning_details'], reasoningDetails);
      expect(outbound['tool_calls'], [
        {
          'id': 'call-1',
          'type': 'function',
          'function': {'name': 'weather', 'arguments': '{"city":"Madrid"}'},
        },
      ]);
    },
  );

  test('retains empty reasoning details as provider metadata', () {
    final completion = oai.ChatCompletion.fromJson(const {
      'id': 'completion-1',
      'model': 'openrouter/model',
      'choices': [
        {
          'message': {'role': 'assistant', 'reasoning_details': <dynamic>[]},
        },
      ],
    });

    final message = completion.toChatResult('completion-1').output;
    final outbound = [message].toChatCompletionMessages().single.toJson();

    expect(message.content.single, isA<AIChatMessageProviderMetadataBlock>());
    expect(outbound, containsPair('reasoning_details', <dynamic>[]));
  });

  test('retains signature-only reasoning as an opaque reasoning block', () {
    final detail = <String, dynamic>{
      'type': 'reasoning.text',
      'id': 'reasoning-1',
      'format': 'anthropic-claude-v1',
      'index': 0,
      'signature': 'opaque-signature',
    };
    final completion = oai.ChatCompletion.fromJson({
      'id': 'completion-1',
      'model': 'openrouter/model',
      'choices': [
        {
          'message': {
            'role': 'assistant',
            'reasoning_details': [detail],
          },
        },
      ],
    });

    final message = completion.toChatResult('completion-1').output;
    final reasoning = message.content
        .whereType<AIChatMessageReasoningBlock>()
        .single;
    final outbound = [message].toChatCompletionMessages().single.toJson();

    expect(reasoning.reasoning, isEmpty);
    expect(outbound['reasoning_details'], [detail]);
  });

  test('streamed reasoning chunks retain aliases and detail order', () {
    oai.ChatStreamEvent chunk(final Map<String, dynamic> delta) =>
        oai.ChatStreamEvent.fromJson({
          'choices': [
            {'delta': delta},
          ],
        });

    final firstDetail = <String, dynamic>{
      'type': 'reasoning.text',
      'text': 'first',
      'signature': 'sig-1',
    };
    final secondDetail = <String, dynamic>{
      'type': 'reasoning.encrypted',
      'data': 'second',
      'future': {'keep': true},
    };
    final first = chunk({
      'reasoning_content': 'primary ',
      'reasoning': 'secondary ',
      'reasoning_details': [firstDetail],
    }).toChatResult('fallback-id', streamSequence: 0).output;
    final second = chunk({
      'reasoning_content': 'reasoning',
      'reasoning': 'summary',
      'reasoning_details': [secondDetail],
    }).toChatResult('fallback-id', streamSequence: 1).output;

    final merged = first.concat(second);
    final reasoning = merged.content
        .whereType<AIChatMessageReasoningBlock>()
        .single;
    final outbound = [merged].toChatCompletionMessages().single.toJson();
    final openAI = reasoning.providerData['openai'] as Map<String, dynamic>;
    final chatCompletions = openAI['chatCompletions'] as Map<String, dynamic>;

    expect((chatCompletions['reasoningChunks'] as Map<String, dynamic>).keys, [
      '0',
      '1',
    ]);
    expect(outbound['reasoning_content'], 'primary reasoning');
    expect(outbound['reasoning'], 'secondary summary');
    expect(outbound['reasoning_details'], [firstDetail, secondDetail]);
  });

  test('does not synthesize provider reasoning from a generic block', () {
    const message = AIChatMessage(
      content: [AIChatMessageReasoningBlock(reasoning: 'private thought')],
    );

    final outbound = [message].toChatCompletionMessages().single.toJson();

    expect(outbound, isNot(contains('reasoning_content')));
    expect(outbound, isNot(contains('reasoning')));
    expect(outbound, isNot(contains('reasoning_details')));
  });

  test('reads the previous chatMessage provider-data shape', () {
    const details = [
      {'type': 'reasoning.text', 'text': 'legacy', 'signature': 'sig'},
    ];
    const message = AIChatMessage(
      content: [
        AIChatMessageReasoningBlock(
          reasoning: 'legacy',
          providerData: {
            'openai': {
              'chatMessage': {
                'reasoning_content': 'legacy',
                'reasoning_details': details,
              },
              'reasoningDetails': details,
            },
          },
        ),
        AIChatMessageTextBlock(
          text: 'answer',
          providerData: {
            'openai': {
              'chatMessage': {
                'reasoning_content': 'legacy',
                'reasoning_details': details,
              },
            },
          },
        ),
      ],
    );

    final outbound = [message].toChatCompletionMessages().single.toJson();

    expect(outbound['reasoning_details'], details);
    expect(outbound['reasoning_content'], 'legacy');
  });

  test(
    'maps current reasoning, verbosity, tier, and unknown finish values',
    () {
      final request = createChatCompletionRequest(
        [ChatMessage.humanText('hello')],
        options: const ChatOpenAIOptions(
          reasoningEffort: ChatOpenAIReasoningEffort.minimal,
          verbosity: ChatOpenAIVerbosity.high,
          serviceTier: ChatOpenAIServiceTier.fast,
        ),
        defaultOptions: const ChatOpenAIOptions(),
      );
      const completion = oai.ChatCompletion(
        id: 'completion-1',
        object: 'chat.completion',
        model: 'openrouter/model',
        choices: [
          oai.ChatChoice(
            message: oai.AssistantMessage(content: 'answer'),
            finishReason: oai.FinishReason.unknown,
          ),
        ],
      );

      expect(request.reasoningEffort, oai.ReasoningEffort.minimal);
      expect(request.verbosity, oai.Verbosity.high);
      expect(request.serviceTier, 'fast');
      expect(
        completion.toChatResult('completion-1').finishReason,
        FinishReason.unspecified,
      );
      for (final entry in const {
        ChatOpenAIReasoningEffort.none: oai.ReasoningEffort.none,
        ChatOpenAIReasoningEffort.xhigh: oai.ReasoningEffort.xhigh,
        ChatOpenAIReasoningEffort.max: oai.ReasoningEffort.max,
      }.entries) {
        final currentRequest = createChatCompletionRequest(
          [ChatMessage.humanText('hello')],
          options: ChatOpenAIOptions(reasoningEffort: entry.key),
          defaultOptions: const ChatOpenAIOptions(),
        );
        expect(currentRequest.reasoningEffort, entry.value);
      }
    },
  );
}
