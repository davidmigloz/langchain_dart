// ignore_for_file: unused_element, unused_element_parameter
import 'dart:async';
import 'dart:convert';

import 'package:langchain/langchain.dart';
import 'package:langchain_core/tools.dart';
import 'package:test/test.dart';

void main() {
  group('AgentExecutor tests', () {
    test('should return result when maxIterations is reached', () async {
      final tool = _MockTool();
      final agent = _SingleActionMockAgent(
        tools: [tool],
        actions: [
          AgentAction(id: 'id', tool: tool.name, toolInput: {'input': 'mock'}),
        ],
      );
      final executor = AgentExecutor(agent: agent, maxIterations: 1);
      final result = await executor.run('test');
      expect(result, 'Agent stopped due to iteration limit or time limit.');
    });

    test('should return result when maxExecutionTime is reached', () async {
      final tool = _MockTool();
      final agent = _SingleActionMockAgent(
        tools: [tool],
        actions: [
          AgentAction(id: 'id', tool: tool.name, toolInput: {'input': 'mock'}),
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
          AgentAction(id: 'id', tool: tool.name, toolInput: {'input': 'mock'}),
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
            id: 'id',
            tool: 'tool',
            toolInput: {'input': 'mock'},
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
              id: 'id',
              tool: 'invalid_tool',
              toolInput: {'input': 'mock'},
            ),
          ],
        );
        final executor = AgentExecutor(
          agent: agent,
          handleParsingErrors: (final _) => {'input': 'fallback'},
          maxIterations: 1,
          returnIntermediateSteps: true,
        );
        final result = await executor.call('test');
        final intermediateSteps =
            result[AgentExecutor.intermediateStepsOutputKey] as List<AgentStep>;
        expect(intermediateSteps.first.observation, 'fallback');
      },
    );

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

  group('Tool output serialization tests', () {
    test('should preserve String tool output as-is', () async {
      final tool = _GenericMockTool<String>(output: 'string-result');
      final agent = _SequentialActionMockAgent(
        tools: [tool],
        actionSequence: [
          [
            AgentAction(
              id: 'id',
              tool: tool.name,
              toolInput: {'input': 'test'},
            ),
          ],
          [
            const AgentFinish(
              returnValues: {BaseActionAgent.agentReturnKey: 'done'},
            ),
          ],
        ],
      );
      final executor = AgentExecutor(
        agent: agent,
        returnIntermediateSteps: true,
      );
      final result = await executor.call('test');
      final intermediateSteps =
          result[AgentExecutor.intermediateStepsOutputKey] as List<AgentStep>;
      expect(intermediateSteps.first.observation, 'string-result');
    });

    test('should JSON-encode Map tool output', () async {
      final mapOutput = {'status': 'ok', 'count': 42};
      final tool = _GenericMockTool<Map<String, dynamic>>(output: mapOutput);
      final agent = _SequentialActionMockAgent(
        tools: [tool],
        actionSequence: [
          [
            AgentAction(
              id: 'id',
              tool: tool.name,
              toolInput: {'input': 'test'},
            ),
          ],
          [
            const AgentFinish(
              returnValues: {BaseActionAgent.agentReturnKey: 'done'},
            ),
          ],
        ],
      );
      final executor = AgentExecutor(
        agent: agent,
        returnIntermediateSteps: true,
      );
      final result = await executor.call('test');
      final intermediateSteps =
          result[AgentExecutor.intermediateStepsOutputKey] as List<AgentStep>;
      expect(intermediateSteps.first.observation, jsonEncode(mapOutput));
      expect(
        jsonDecode(intermediateSteps.first.observation),
        {'status': 'ok', 'count': 42},
      );
    });

    test('should JSON-encode List tool output', () async {
      final listOutput = ['item1', 'item2', 'item3'];
      final tool = _GenericMockTool<List<String>>(output: listOutput);
      final agent = _SequentialActionMockAgent(
        tools: [tool],
        actionSequence: [
          [
            AgentAction(
              id: 'id',
              tool: tool.name,
              toolInput: {'input': 'test'},
            ),
          ],
          [
            const AgentFinish(
              returnValues: {BaseActionAgent.agentReturnKey: 'done'},
            ),
          ],
        ],
      );
      final executor = AgentExecutor(
        agent: agent,
        returnIntermediateSteps: true,
      );
      final result = await executor.call('test');
      final intermediateSteps =
          result[AgentExecutor.intermediateStepsOutputKey] as List<AgentStep>;
      expect(intermediateSteps.first.observation, jsonEncode(listOutput));
      expect(
        jsonDecode(intermediateSteps.first.observation),
        ['item1', 'item2', 'item3'],
      );
    });

    test('should JSON-encode int tool output', () async {
      final tool = _GenericMockTool<int>(output: 42);
      final agent = _SequentialActionMockAgent(
        tools: [tool],
        actionSequence: [
          [
            AgentAction(
              id: 'id',
              tool: tool.name,
              toolInput: {'input': 'test'},
            ),
          ],
          [
            const AgentFinish(
              returnValues: {BaseActionAgent.agentReturnKey: 'done'},
            ),
          ],
        ],
      );
      final executor = AgentExecutor(
        agent: agent,
        returnIntermediateSteps: true,
      );
      final result = await executor.call('test');
      final intermediateSteps =
          result[AgentExecutor.intermediateStepsOutputKey] as List<AgentStep>;
      expect(intermediateSteps.first.observation, '42');
    });

    test('should JSON-encode nested structure tool output', () async {
      final nestedOutput = {
        'results': [
          {'id': 1, 'name': 'first'},
          {'id': 2, 'name': 'second'},
        ],
        'metadata': {'total': 2, 'page': 1},
      };
      final tool =
          _GenericMockTool<Map<String, dynamic>>(output: nestedOutput);
      final agent = _SequentialActionMockAgent(
        tools: [tool],
        actionSequence: [
          [
            AgentAction(
              id: 'id',
              tool: tool.name,
              toolInput: {'input': 'test'},
            ),
          ],
          [
            const AgentFinish(
              returnValues: {BaseActionAgent.agentReturnKey: 'done'},
            ),
          ],
        ],
      );
      final executor = AgentExecutor(
        agent: agent,
        returnIntermediateSteps: true,
      );
      final result = await executor.call('test');
      final intermediateSteps =
          result[AgentExecutor.intermediateStepsOutputKey] as List<AgentStep>;
      expect(intermediateSteps.first.observation, jsonEncode(nestedOutput));
      final decoded = jsonDecode(intermediateSteps.first.observation);
      expect(decoded['results'], hasLength(2));
      expect(decoded['metadata']['total'], 2);
    });

    test('should JSON-encode bool tool output', () async {
      final tool = _GenericMockTool<bool>(output: true);
      final agent = _SequentialActionMockAgent(
        tools: [tool],
        actionSequence: [
          [
            AgentAction(
              id: 'id',
              tool: tool.name,
              toolInput: {'input': 'test'},
            ),
          ],
          [
            const AgentFinish(
              returnValues: {BaseActionAgent.agentReturnKey: 'done'},
            ),
          ],
        ],
      );
      final executor = AgentExecutor(
        agent: agent,
        returnIntermediateSteps: true,
      );
      final result = await executor.call('test');
      final intermediateSteps =
          result[AgentExecutor.intermediateStepsOutputKey] as List<AgentStep>;
      expect(intermediateSteps.first.observation, 'true');
    });
  });
}

final class _MockTool extends StringTool {
  _MockTool({super.name = 'tool', super.returnDirect = false})
    : super(description: '$name-description');

  @override
  Future<String> invokeInternal(
    final String toolInput, {
    final ToolOptions? options,
  }) async {
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
  _MultiActionMockAgent({super.tools = const [], this.actions = const []});

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

/// A mock agent that returns actions sequentially from a list of action lists.
/// Each call to plan() returns the next list in the sequence.
final class _SequentialActionMockAgent extends BaseActionAgent {
  _SequentialActionMockAgent({
    super.tools = const [],
    required this.actionSequence,
  });

  /// A list of action lists. Each call to plan() returns the next list.
  final List<List<BaseAgentAction>> actionSequence;

  int _callCount = 0;

  @override
  String get agentType => 'mock-sequential-action-agent';

  @override
  Set<String> get inputKeys => {'mock-input-key'};

  @override
  Future<List<BaseAgentAction>> plan(final AgentPlanInput input) async {
    if (_callCount >= actionSequence.length) {
      return [
        const AgentFinish(
          returnValues: {BaseActionAgent.agentReturnKey: 'exhausted'},
        ),
      ];
    }
    return actionSequence[_callCount++];
  }
}

/// A generic mock tool that can return any type of output.
/// Used to test tool output serialization in AgentExecutor.
final class _GenericMockTool<T extends Object>
    extends Tool<String, ToolOptions, T> {
  _GenericMockTool({
    required T output,
    super.name = 'generic_tool',
  })  : _output = output,
        super(
          description: 'A generic mock tool for testing',
          inputJsonSchema: const {
            'type': 'object',
            'properties': {
              'input': {'type': 'string'},
            },
          },
        );

  final T _output;

  @override
  Future<T> invokeInternal(
    final String input, {
    final ToolOptions? options,
  }) async {
    return _output;
  }

  @override
  String getInputFromJson(final Map<String, dynamic> json) {
    return json['input'] as String? ?? '';
  }
}
