import 'package:json_schema/json_schema.dart';
import 'package:langchain_compat/langchain_compat.dart';
import 'package:test/test.dart';

void main() {
  test('debug openrouter tool call', () async {
    final tool = Tool<String>(
      name: 'echo_tool',
      description: 'Echoes the input',
      inputSchema: JsonSchema.create({
        'type': 'object',
        'properties': {
          'text': {
            'type': 'string',
            'description': 'The text to echo',
          },
        },
        'required': ['text'],
      }),
      inputFromJson: (json) => (json['text'] ?? 'hello') as String,
      onCall: (input) => 'Echo: $input',
    );

    final agent = Agent(
      'openrouter:${ChatProvider.openrouter.defaultModelName}',
      tools: [tool],
    );

    print('\nTesting OpenRouter with tool...');
    final result = await agent.run('Use echo_tool to say "hello"');
    
    print('Output: ${result.output}');
    print('Number of messages: ${result.messages.length}');
    
    for (var i = 0; i < result.messages.length; i++) {
      final msg = result.messages[i];
      print('\nMessage $i: ${msg.role.name}');
      print('  hasToolCalls: ${msg.hasToolCalls}');
      print('  hasToolResults: ${msg.hasToolResults}');
      for (final part in msg.parts) {
        if (part is TextPart) {
          print('  - TextPart: ${part.text.substring(0, 50.clamp(0, part.text.length))}...');
        } else if (part is ToolPart) {
          print('  - ToolPart.${part.kind.name}: ${part.name}');
        }
      }
    }
  });
}