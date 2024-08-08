// ignore_for_file: avoid_print, avoid_redundant_argument_values
import 'dart:convert';
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_ollama/langchain_ollama.dart';

void main(final List<String> arguments) async {
  await _chatOllama();
  await _chatOllamaStreaming();
  await _chatOllamaMultimodal();
  await _chatOllamaToolCalling();
  await _chatOllamaJsonMode();
  await _extraction();
  await _flights();
  await _rag();
}

Future<void> _chatOllama() async {
  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'You are a helpful assistant that translates {input_language} to {output_language}.',
    ),
    (ChatMessageType.human, '{text}'),
  ]);

  final chatModel = ChatOllama(
    defaultOptions: const ChatOllamaOptions(
      model: 'llama3.1',
      temperature: 0,
    ),
  );

  final chain = promptTemplate | chatModel | const StringOutputParser();

  final res = await chain.invoke({
    'input_language': 'English',
    'output_language': 'French',
    'text': 'I love programming.',
  });
  print(res);
  // -> 'La traduction est : "J'aime le programming.'
}

Future<void> _chatOllamaStreaming() async {
  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'You are a helpful assistant that replies only with numbers '
          'in order without any spaces or commas',
    ),
    (ChatMessageType.human, 'List the numbers from 1 to {max_num}'),
  ]);
  final chat = ChatOllama(
    defaultOptions: const ChatOllamaOptions(
      model: 'llama3.1',
      temperature: 0,
    ),
  );
  final chain = promptTemplate.pipe(chat).pipe(const StringOutputParser());

  final stream = chain.stream({'max_num': '9'});
  await stream.forEach(print);
  // 1
  // 2
  // 3
  // ..
  // 9
}

Future<void> _chatOllamaMultimodal() async {
  final chatModel = ChatOllama(
    defaultOptions: const ChatOllamaOptions(
      model: 'llava',
      temperature: 0,
    ),
  );
  final prompt = ChatMessage.human(
    ChatMessageContent.multiModal([
      ChatMessageContent.text('What fruit is this?'),
      ChatMessageContent.image(
        data: base64.encode(
          await File('./bin/assets/apple.jpeg').readAsBytes(),
        ),
      ),
    ]),
  );
  final res = await chatModel.invoke(PromptValue.chat([prompt]));
  print(res.output.content);
  // -> 'An Apple'
}

Future<void> _chatOllamaToolCalling() async {
  const tool = ToolSpec(
    name: 'get_current_weather',
    description: 'Get the current weather in a given location',
    inputJsonSchema: {
      'type': 'object',
      'properties': {
        'location': {
          'type': 'string',
          'description': 'The city and country, e.g. San Francisco, US',
        },
      },
      'required': ['location'],
    },
  );

  final chatModel = ChatOllama(
    defaultOptions: const ChatOllamaOptions(
      model: 'llama3.1',
      temperature: 0,
      tools: [tool],
    ),
  );

  final res = await chatModel.invoke(
    PromptValue.string(
      'What’s the weather like in Boston and Madrid right now in celsius?',
    ),
  );
  print(res.output.toolCalls);
  // [AIChatMessageToolCall{
  //   id: a621064b-03b3-4ca6-8278-f37504901034,
  //   name: get_current_weather,
  //   arguments: {location: Boston, US},
  // },
  // AIChatMessageToolCall{
  //   id: f160d9ba-ae7d-4abc-a910-2b6cd503ec53,
  //   name: get_current_weather,
  //   arguments: {location: Madrid, ES},
  // }]
}

Future<void> _chatOllamaJsonMode() async {
  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'You are an assistant that respond question using JSON format.'
    ),
    (ChatMessageType.human, '{question}'),
  ]);
  final chat = ChatOllama(
    defaultOptions: const ChatOllamaOptions(
      model: 'llama3.1',
      temperature: 0,
      format: OllamaResponseFormat.json,
    ),
  );

  final chain = Runnable.getMapFromInput<String>('question')
      .pipe(promptTemplate)
      .pipe(chat)
      .pipe(JsonOutputParser());

  final res = await chain.invoke(
    'What is the population of Spain, The Netherlands, and France?',
  );
  print(res);
  // {Spain: 46735727, The Netherlands: 17398435, France: 65273538}
}

Future<void> _extraction() async {
  const tool = ToolSpec(
    name: 'information_extraction',
    description: 'Extracts the relevant information from the passage',
    inputJsonSchema: {
      'type': 'object',
      'properties': {
        'people': {
          'type': 'array',
          'items': {
            'type': 'object',
            'properties': {
              'name': {
                'type': 'string',
                'description': 'The name of a person',
              },
              'height': {
                'type': 'number',
                'description': 'The height of the person in cm',
              },
              'hair_color': {
                'type': 'string',
                'description': 'The hair color of the person',
                'enum': ['black', 'brown', 'blonde', 'red', 'gray', 'white'],
              },
            },
            'required': ['name', 'height', 'hair_color'],
          },
        },
      },
      'required': ['people'],
    },
  );

  final model = ChatOllama(
    defaultOptions: ChatOllamaOptions(
      model: 'llama3.1',
      temperature: 0,
      tools: const [tool],
      toolChoice: ChatToolChoice.forced(name: tool.name),
    ),
  );

  final promptTemplate = ChatPromptTemplate.fromTemplate('''
Extract and save the relevant entities mentioned in the following passage together with their properties. 

Passage:
{input}''');

  final chain = Runnable.getMapFromInput<String>()
      .pipe(promptTemplate)
      .pipe(model)
      .pipe(ToolsOutputParser());

  final res = await chain.invoke(
    'Alex is 5 feet tall. '
    'Claudia is 1 foot taller than Alex and jumps higher than him. '
    'Claudia has orange hair and Alex is blonde.',
  );
  final extractedData = res.first.arguments;
  print(extractedData);
  // {
  //   people: [
  //     {
  //       name: Alex,
  //       height: 152,
  //       hair_color: blonde
  //     },
  //     {
  //       name: Claudia,
  //       height: 183,
  //       hair_color: orange
  //     }
  //   ]
  // }
}

// Simulates an API call to get flight times
// In a real application, this would fetch data from a live database or API
String getFlightTimes(String departure, String arrival) {
  final flights = {
    'NYC-LAX': {
      'departure': '08:00 AM',
      'arrival': '11:30 AM',
      'duration': '5h 30m',
    },
    'LAX-NYC': {
      'departure': '02:00 PM',
      'arrival': '10:30 PM',
      'duration': '5h 30m',
    },
    'LHR-JFK': {
      'departure': '10:00 AM',
      'arrival': '01:00 PM',
      'duration': '8h 00m',
    },
    'JFK-LHR': {
      'departure': '09:00 PM',
      'arrival': '09:00 AM',
      'duration': '7h 00m',
    },
    'CDG-DXB': {
      'departure': '11:00 AM',
      'arrival': '08:00 PM',
      'duration': '6h 00m',
    },
    'DXB-CDG': {
      'departure': '03:00 AM',
      'arrival': '07:30 AM',
      'duration': '7h 30m',
    },
  };

  final key = '${departure.toUpperCase()}-${arrival.toUpperCase()}';
  return jsonEncode(flights[key] ?? {'error': 'Flight not found'});
}

Future<void> _flights() async {
  const getFlightTimesTool = ToolSpec(
    name: 'get_flight_times',
    description: 'Get the flight times between two cities',
    inputJsonSchema: {
      'type': 'object',
      'properties': {
        'departure': {
          'type': 'string',
          'description': 'The departure city (airport code)',
        },
        'arrival': {
          'type': 'string',
          'description': 'The arrival city (airport code)',
        },
      },
      'required': ['departure', 'arrival'],
    },
  );

  final chatModel = ChatOllama(
    defaultOptions: const ChatOllamaOptions(
      model: 'llama3.1',
      temperature: 0,
      tools: [getFlightTimesTool],
    ),
  );

  final messages = [
    ChatMessage.humanText(
      'What is the flight time from New York (NYC) to Los Angeles (LAX)?',
    ),
  ];

  // First API call: Send the query and function description to the model
  final response = await chatModel.invoke(PromptValue.chat(messages));

  messages.add(response.output);

  // Check if the model decided to use the provided function
  if (response.output.toolCalls.isEmpty) {
    print("The model didn't use the function. Its response was:");
    print(response.output.content);
    return;
  }

  // Process function calls made by the model
  for (final toolCall in response.output.toolCalls) {
    final functionResponse = getFlightTimes(
      toolCall.arguments['departure'],
      toolCall.arguments['arrival'],
    );
    // Add function response to the conversation
    messages.add(
      ChatMessage.tool(
        toolCallId: toolCall.id,
        content: functionResponse,
      ),
    );
  }

  // Second API call: Get final response from the model
  final finalResponse = await chatModel.invoke(PromptValue.chat(messages));
  print(finalResponse.output.content);
  // The flight time from New York (NYC) to Los Angeles (LAX) is approximately 5 hours and 30 minutes.
}

Future<void> _rag() async {
  // 1. Create a vector store and add documents to it
  final vectorStore = MemoryVectorStore(
    embeddings: OllamaEmbeddings(model: 'llama3.1'),
  );
  await vectorStore.addDocuments(
    documents: [
      const Document(pageContent: 'LangChain was created by Harrison'),
      const Document(
        pageContent: 'David ported LangChain to Dart in LangChain.dart',
      ),
    ],
  );

  // 2. Construct a RAG prompt template
  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'Answer the question based on only the following context:\n{context}',
    ),
    (ChatMessageType.human, '{question}'),
  ]);

  // 3. Define the model to use and the vector store retriever
  final chatModel = ChatOllama(
    defaultOptions: const ChatOllamaOptions(model: 'llama3.1'),
  );
  final retriever = vectorStore.asRetriever(
    defaultOptions: const VectorStoreRetrieverOptions(
      searchType: VectorStoreSimilaritySearch(k: 1),
    ),
  );

  // 4. Create a Runnable that combines the retrieved documents into a single string
  final docCombiner = Runnable.mapInput<List<Document>, String>((docs) {
    return docs.map((final d) => d.pageContent).join('\n');
  });

  // 4. Define the RAG pipeline
  final chain = Runnable.fromMap<String>({
    'context': retriever.pipe(docCombiner),
    'question': Runnable.passthrough(),
  }).pipe(promptTemplate).pipe(chatModel).pipe(const StringOutputParser());

  // 5. Run the pipeline
  final res = await chain.invoke('Who created LangChain.dart?');
  print(res);
  // Based on the context provided, David created LangChain.dart.
}
