import 'dart:convert';
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
    temperature: 0.0,
    maxTokens: 512,
    model: 'gpt-3.5-turbo-0613',
  );

  final memory = ConversationBufferMemory();

  final searchRestaurantsTool = Tool.fromFunction(
    name: 'search_restaurants',
    description: '''
    When asked to find a restaurant, use this function to search for available restaurants in a specific location per party size and date-time.
    parameters: {
      'type': 'object',
      'properties': {
        'location': {
          'type': 'string',
          'description':
              'The city or area (e.g. Tel Aviv, North Israel).',
        },
        'party_size': {
          'type': 'number',
          'description': 'The number of people',
        },
        'date_time': {
          'type': 'string',
          'description':
              'The desired online reservation date and time in ISO format.',
        },
      },
      'required': ['location', 'party_size', 'date_time'],
    } 
    ''',
    func: (final String toolInput) async {
      final arguments = jsonDecode(toolInput);

      stdout.writeln('\n= Function Call Arguments:\n= $arguments\n');

      final functionResponse = [
        'Vivino',
        'Kisu',
      ];

      final functionResponseContent = '''
          Suggest only one restaurant to the user out of the following JSON list (do not expose the "id"):
          $functionResponse
          ''';

      // Store the Function response in memory.
      memory.chatHistory.addFunctionChatMessage(
        name: 'search_restaurants',
        content: functionResponseContent,
      );

      return functionResponseContent;
    },
    handleToolError: (final e) {
      // Handle tool error.
      return 'Sorry, an error occurred: $e';
    },
  );

  final agent = OpenAIFunctionsAgent.fromLLMAndTools(
    llm: chatOpenAI,
    tools: [searchRestaurantsTool],
    systemChatMessage: SystemChatMessagePromptTemplate.fromTemplate(
      '''
        You are a restaurant hostess that should assist the user to find a restaurant and make an online reservation in English.
        You are also a Tabit support assistant, that can answer questions about Tabit products.

        When you need to find a restaurant - ask the user for the desired location, party-size and date-time.
        Once you have all these details, use the function-calls to fetch the data.
        
        Only use the functions you have been provided with.
        Use the functions only when you need to.
        ''',
    ),
  );
  final executor = AgentExecutor(
    agent: agent,
    tools: [searchRestaurantsTool],
  );

  while (true) {
    // Get user input.
    stdout.write('> ');
    final query = stdin.readLineSync() ?? '';
    final userMessage = ChatMessage.human(query);

    // Add user input to memory.
    memory.chatHistory.addUserChatMessage(userMessage.content.trim());
    final messages = await memory.chatHistory.getChatMessages();

    // Chat Complete by OpenAI.
    final response = await executor.call(messages);

    final aiMessage = response['output'];

    // Output AI response message.
    stdout.writeln(aiMessage);

    // Store AI response in memory.
    memory.chatHistory.addAIChatMessage(aiMessage);
  }
}
