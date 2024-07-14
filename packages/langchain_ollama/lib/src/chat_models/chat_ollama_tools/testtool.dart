import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_core/tools.dart';
import 'package:langchain_openai/langchain_openai.dart';

import '../../../langchain_ollama.dart';

Future<void> main() async {
  final tool = ChatOllamaTools();
  const toolOptions = ChatOllamaToolsOptions(
    options: ChatOllamaOptions(model: 'llama3:8b'),
    tools: [tool1],
    toolsSystemPromptTemplate:
        'You have access to the following tools: {tools} '
        'You must always select one of the above tools '
        'and respond in plain text.',
  );

  final model = ChatOpenAI(
    apiKey: '',
    defaultOptions: const ChatOpenAIOptions(tools: [tool1]),
  );

  final prompt = PromptValue.chat(
    [ChatMessage.humanText("What's the weather in Amsterdam")],
  );
  final toolWithFallbacks = tool.withFallback([model]);

  try {
    final res = await toolWithFallbacks.invoke(prompt, options: toolOptions);
    print(res);
  } catch (e) {
    print(e.toString());
  }
}

const tool1 = ToolSpec(
  name: 'get_current_weather',
  description: 'Get the current weather in a given location',
  inputJsonSchema: {
    'type': 'object',
    'properties': {
      'location': {
        'type': 'string',
        'description': 'The city and country, e.g. San Francisco, US',
      },
      'unit': {
        'type': 'string',
        'enum': ['celsius', 'fahrenheit'],
      },
    },
    'required': ['location'],
  },
);
