import 'package:langchain_core/agents.dart';
import 'package:langchain_core/chat_models.dart';
import 'package:test/test.dart';

void main() {
  const assistant = AIChatMessage(
    content: [
      AIChatMessageReasoningBlock(reasoning: 'private reasoning'),
      AIChatMessageToolCall(
        id: 'call-1',
        name: 'first',
        argumentsRaw: '{}',
        arguments: {},
      ),
      AIChatMessageToolCall(
        id: 'call-2',
        name: 'second',
        argumentsRaw: '{}',
        arguments: {},
      ),
    ],
  );
  const firstAction = AgentAction(
    id: 'call-1',
    tool: 'first',
    toolInput: {},
    messageLog: [assistant],
  );
  const secondAction = AgentAction(
    id: 'call-2',
    tool: 'second',
    toolInput: {},
    messageLog: [assistant],
  );

  test('emits a shared assistant log once for parallel actions', () {
    const steps = [
      AgentStep(action: firstAction, observation: 'one', iteration: 0),
      AgentStep(action: secondAction, observation: 'two', iteration: 0),
    ];

    final messages = buildToolAgentScratchpad(steps);

    expect(messages, [
      assistant,
      const ToolChatMessage(
        toolCallId: 'call-1',
        content: 'one',
        name: 'first',
      ),
      const ToolChatMessage(
        toolCallId: 'call-2',
        content: 'two',
        name: 'second',
      ),
    ]);
  });

  test('keeps legacy per-step behavior without iteration metadata', () {
    const steps = [
      AgentStep(action: firstAction, observation: 'one'),
      AgentStep(action: secondAction, observation: 'two'),
    ];

    final messages = buildToolAgentScratchpad(steps);

    expect(messages.whereType<AIChatMessage>(), [assistant, assistant]);
  });

  test('keeps legacy behavior when logs in one iteration differ', () {
    const otherAssistant = AIChatMessage(
      content: [AIChatMessageTextBlock(text: 'different')],
    );
    const steps = [
      AgentStep(action: firstAction, observation: 'one', iteration: 0),
      AgentStep(
        action: AgentAction(
          id: 'call-2',
          tool: 'second',
          toolInput: {},
          messageLog: [otherAssistant],
        ),
        observation: 'two',
        iteration: 0,
      ),
    ];

    final messages = buildToolAgentScratchpad(steps);

    expect(messages.whereType<AIChatMessage>(), [assistant, otherAssistant]);
  });
}
