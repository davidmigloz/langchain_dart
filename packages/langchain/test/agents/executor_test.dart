// ignore_for_file: unused_element
import 'dart:async';

import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('AgentExecutor tests', () {
    test('should return result when maxIterations is reached', () async {
      final tool = _MockTool();
      final agent = _SingleActionMockAgent(
        tools: [tool],
        actions: [
          AgentAction(
            tool: tool.name,
            toolInput: {Tool.inputVar: 'mock'},
          ),
        ],
      );
      final executor = AgentExecutor(
        agent: agent,
        maxIterations: 1,
      );
      final result = await executor.run('test');
      expect(result, 'Agent stopped due to iteration limit or time limit.');
    });

    test('should return result when maxExecutionTime is reached', () async {
      final tool = _MockTool();
      final agent = _SingleActionMockAgent(
        tools: [tool],
        actions: [
          AgentAction(
            tool: tool.name,
            toolInput: {Tool.inputVar: 'mock'},
          ),
        ],
      );
      final executor = AgentExecutor(
        agent: agent,
        maxExecutionTime: const Duration(milliseconds: 1),
      );
      final result = await executor.run('test');
      expect(result, 'Agent stopped due to iteration limit or time limit.');
    });

    test('should return AgentFinish result if action is AgentFinish', () async {
      final tool = _MockTool();
      final agent = _SingleActionMockAgent(
        tools: [tool],
        actions: [
          AgentAction(
            tool: tool.name,
            toolInput: {Tool.inputVar: 'mock'},
          ),
          const AgentFinish(
            returnValues: {BaseActionAgent.agentReturnKey: 'mock'},
          ),
        ],
      );
      final executor = AgentExecutor(agent: agent);
      final result = await executor.run('test');
      expect(result, 'mock');
    });

    test('should run InvalidTool if tool not found in map', () async {
      final tool = _MockTool(name: 'invalid_tool');
      final agent = _SingleActionMockAgent(
        tools: [tool],
        actions: [
          const AgentAction(
            tool: 'tool',
            toolInput: {Tool.inputVar: 'mock'},
          ),
        ],
      );
      final executor = AgentExecutor(
        agent: agent,
        maxIterations: 1,
        returnIntermediateSteps: true,
      );
      final result = await executor.call('test');
      final intermediateSteps =
          result[AgentExecutor.intermediateStepsOutputKey] as List<AgentStep>;
      expect(
        intermediateSteps.first.observation,
        'tool is not a valid tool, try another one.',
      );
    });

    test(
        'should handle OutputParserException with handleParsingErrors function',
        () async {
      final tool = _MockTool();
      final agent = _SingleActionMockAgent(
        throwOutputParserException: true,
        tools: [tool],
        actions: [
          const AgentAction(
            tool: 'invalid_tool',
            toolInput: {Tool.inputVar: 'mock'},
          ),
        ],
      );
      final executor = AgentExecutor(
        agent: agent,
        handleParsingErrors: (final _) => 'fallback',
        maxIterations: 1,
        returnIntermediateSteps: true,
      );
      final result = await executor.call('test');
      final intermediateSteps =
          result[AgentExecutor.intermediateStepsOutputKey] as List<AgentStep>;
      expect(
        intermediateSteps.first.observation,
        'fallback',
      );
    });

    test('Test RunnableAgent', () async {
      final agent = Agent.fromRunnable(
        Runnable.mapInput(
          (final AgentPlanInput planInput) => {
            'input': planInput.inputs,
            'intermediateSteps': planInput.intermediateSteps,
          },
        ).pipe(
          Runnable.mapInput(
            (final _) => [
              const AgentFinish(
                returnValues: {BaseActionAgent.agentReturnKey: 'mock'},
              ),
            ],
          ),
        ),
        tools: [],
      );

      final executor = AgentExecutor(agent: agent);
      final result = await executor.run('test');
      expect(result, 'mock');
    });
  });
}

final class _MockTool extends Tool<ToolOptions> {
  _MockTool({
    super.name = 'tool',
    super.returnDirect = false,
  }) : super(
          description: '$name-description',
        );

  @override
  FutureOr<String> runInternalString(
    final String toolInput, {
    final ToolOptions? options,
  }) {
    return '$name-output';
  }
}

final class _SingleActionMockAgent extends BaseActionAgent {
  _SingleActionMockAgent({
    super.tools = const [],
    this.actions = const [],
    this.throwOutputParserException = false,
  });

  final List<BaseAgentAction> actions;
  final bool throwOutputParserException;

  int planCount = 0;

  @override
  String get agentType => 'mock-single-action-agent';

  @override
  Set<String> get inputKeys => {'mock-input-key'};

  @override
  Future<List<BaseAgentAction>> plan(final AgentPlanInput input) async {
    if (throwOutputParserException) {
      throw const OutputParserException(message: 'mock');
    }
    planCount++;
    return actions;
  }
}

final class _MultiActionMockAgent extends BaseMultiActionAgent {
  _MultiActionMockAgent({
    super.tools = const [],
    this.actions = const [],
  });

  final List<BaseAgentAction> actions;

  int planCount = 0;

  @override
  String get agentType => 'mock-multi-action-agent';

  @override
  Set<String> get inputKeys => {'mock-input-key'};

  @override
  Future<List<BaseAgentAction>> plan(final AgentPlanInput input) async {
    planCount++;
    return actions;
  }
}
