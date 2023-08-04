import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  final openAiApiKey = Platform.environment['OPENAI_API_KEY'];

  if (openAiApiKey == null) {
    stderr.writeln('You need to set your OpenAI key in the '
        'OPENAI_API_KEY environment variable.');
    exit(1);
  }

  final chatOpenAI = ChatOpenAI(
    apiKey: openAiApiKey,
    temperature: 0.3,
    maxTokens: 512,
    model: 'gpt-3.5-turbo-0613',
  );

  final tool = BaseTool.fromFunction(
    name: 'search_support',
    description:
        'Search the support documentation when asked questions about a product.',
    inputJsonSchema: const {
      'type': 'object',
      'properties': {
        'query': {
          'type': 'string',
          'description': 'The search query.',
        },
        'product': {
          'type': 'string',
          'description': 'The product name (e.g. Product A, Product B)',
        },
      },
      'required': ['query', 'product'],
    },
    func: (final Map<String, dynamic> toolInput) async {
      stdout.writeln('\nFunction Call Arguments: $toolInput\n');

      // final query = toolInput['query'];
      // final product = toolInput['product'];

      // TODO: implement search

      // Mock results
      final functionResponse = [
        '{"title": "Document A", "description": "This document explains how to use Product A."}',
        '{"title": "Document B", "description": "This document explains how to use Product B."}',
      ];

      return 'Results:\n$functionResponse';
    },
  );

  final agent = OpenAIFunctionsAgent.fromLLMAndTools(
    llm: chatOpenAI,
    tools: [tool],
    systemChatMessage: SystemChatMessagePromptTemplate.fromTemplate(
      'You are a tech support agent.',
    ),
    extraPromptMessages: [
      const MessagesPlaceholder(variableName: BaseMemory.defaultMemoryKey),
    ],
  );

  final memory = ConversationBufferMemory(returnMessages: true);

  final executor = AgentExecutor(
    agent: agent,
    tools: [tool],
    memory: memory,
  );

  while (true) {
    // Get user input.
    stdout.write('> ');
    final query = stdin.readLineSync() ?? '';

    // Chat Complete by OpenAI.
    final aiMessage = await executor.run(query);

    // Output AI response message.
    stdout.writeln(aiMessage);
  }
}
