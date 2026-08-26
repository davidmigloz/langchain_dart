import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  test('parallel same-name content-block calls route independently', () async {
    const message = AIChatMessage.withBlocks(
      contentBlocks: [
        AIChatMessageToolCall(
          id: 'call-madrid',
          index: 0,
          name: 'weather',
          argumentsRaw: '{"city":"Madrid"}',
          arguments: {'city': 'Madrid'},
        ),
        AIChatMessageToolCall(
          id: 'call-paris',
          index: 1,
          name: 'weather',
          argumentsRaw: '{"city":"Paris"}',
          arguments: {'city': 'Paris'},
        ),
      ],
    );
    final actions = await const ToolsAgentOutputParser().parseChatMessage(
      message,
    );

    expect(actions.map((action) => (action as AgentAction).id), [
      'call-madrid',
      'call-paris',
    ]);

    final tool = _WeatherTool();
    final agent = _ActionSequenceAgent(
      tools: [tool],
      actionSequence: [
        actions,
        [
          const AgentFinish(
            returnValues: {BaseActionAgent.agentReturnKey: 'done'},
          ),
        ],
      ],
    );
    final result = await AgentExecutor(
      agent: agent,
      returnIntermediateSteps: true,
    ).call('weather');
    final steps =
        result[AgentExecutor.intermediateStepsOutputKey] as List<AgentStep>;

    expect(steps.map((step) => step.action.id), ['call-madrid', 'call-paris']);
    expect(steps.map((step) => step.observation), [
      'weather:Madrid',
      'weather:Paris',
    ]);
    expect(tool.cities, ['Madrid', 'Paris']);
  });
}

final class _WeatherTool extends Tool<String, ToolOptions, String> {
  _WeatherTool()
    : super(
        name: 'weather',
        description: 'Returns weather for a city',
        inputJsonSchema: const {
          'type': 'object',
          'properties': {
            'city': {'type': 'string'},
          },
          'required': ['city'],
        },
      );

  final List<String> cities = [];

  @override
  String getInputFromJson(final Map<String, dynamic> json) =>
      json['city'] as String;

  @override
  Future<String> invokeInternal(
    final String input, {
    final ToolOptions? options,
  }) async {
    cities.add(input);
    return 'weather:$input';
  }
}

final class _ActionSequenceAgent extends BaseMultiActionAgent {
  _ActionSequenceAgent({required super.tools, required this.actionSequence});

  final List<List<BaseAgentAction>> actionSequence;
  var _index = 0;

  @override
  String get agentType => 'content-block-test-agent';

  @override
  Set<String> get inputKeys => const {'input'};

  @override
  Future<List<BaseAgentAction>> plan(final AgentPlanInput input) async =>
      actionSequence[_index++];
}
