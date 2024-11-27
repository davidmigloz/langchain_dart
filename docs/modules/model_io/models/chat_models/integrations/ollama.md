# ChatOllama

Wrapper around [Ollama](https://ollama.ai) Completions API that enables to interact with the LLMs in a chat-like fashion.

Ollama allows you to run open-source large language models, such as Llama 3.2 or Gemma 2, locally.

Ollama bundles model weights, configuration, and data into a single package, defined by a Modelfile. It optimizes setup and configuration details, including GPU usage.

## Setup

Follow [these instructions](https://github.com/jmorganca/ollama) to set up and run a local Ollama instance:

1. Download and install [Ollama](https://ollama.ai)
2. Fetch a model via `ollama pull <model family>`
  * e.g., for Llama 3: `ollama pull llama3.2`
3. Instantiate the `ChatOllama` class with the downloaded model.

```dart
final chatModel = ChatOllama(
  defaultOptions: ChatOllamaOptions(
    model: 'llama3.2',
  ),
);
```

For a complete list of supported models and model variants, see the [Ollama model library](https://ollama.ai/library).

### Ollama base URL

By default, `ChatOllama` uses 'http://localhost:11434/api' as base URL (default Ollama API URL). But if you are running Ollama on a different host, you can override it using the `baseUrl` parameter.

```dart
final chatModel = ChatOllama(
  defaultOptions: ChatOllamaOptions(
    baseUrl: 'https://your-remote-server-where-ollama-is-running.com',
    model: 'llama3.2',
  ),
);
```

## Usage

```dart
final promptTemplate = ChatPromptTemplate.fromTemplates([
  (ChatMessageType.system, 'You are a helpful assistant that translates {input_language} to {output_language}.'),
  (ChatMessageType.human, '{text}'),
]);

final chatModel = ChatOllama(
  defaultOptions: ChatOllamaOptions(
    model: 'llama3.2',
    temperature: 0,
  ),
);

final chain = promptTemplate | chatModel | StringOutputParser();

final res = await chain.invoke({
  'input_language': 'English',
  'output_language': 'French',
  'text': 'I love programming.',
});
print(res);
// -> 'La traduction est : "J'aime le programming.'
```

### Streaming

Ollama supports streaming the output as the model generates it. 

```dart
final promptTemplate = ChatPromptTemplate.fromTemplates([
  (ChatMessageType.system, 'You are a helpful assistant that replies only with numbers in order without any spaces or commas'),
  (ChatMessageType.human, 'List the numbers from 1 to {max_num}'),
]);
final chat = ChatOllama(
  defaultOptions: ChatOllamaOptions(
    model: 'llama3.2',
    temperature: 0,
  ),
);
final chain = promptTemplate.pipe(chat).pipe(StringOutputParser());

final stream = chain.stream({'max_num': '9'});
await stream.forEach(print);
// 123
// 456
// 789
```

### Multimodal support

Ollama has support for multi-modal LLMs, such as [bakllava](https://ollama.ai/library/bakllava) and [llava](https://ollama.ai/library/llava).

You can provide several base64-encoded `png` or `jpeg` images. Images up to 100MB in size are supported.

```dart
final chatModel = ChatOllama(
  defaultOptions: ChatOllamaOptions(
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
```

### Tool calling

`ChatOllama` offers support for native tool calling. This enables a model to answer a given prompt using tool(s) it knows about, making it possible for models to perform more complex tasks or interact with the outside world. It follows the standard [LangChain.dart tools API](/modules/model_io/models/chat_models/how_to/tools.md), so you can use it in the same way as you would with other providers that support tool-calling (e.g. `ChatOpenAI`, `ChatAnthropic`, etc.).

**Notes:**
- Tool calling requires [Ollama 0.3.0](https://github.com/ollama/ollama/releases/tag/v0.3.0) or newer.
- Streaming tool calls is not supported at the moment.
- Not all models support tool calls. Check the Ollama catalogue for models that have the `Tools` tag (e.g. [`llama3.2`](https://ollama.com/library/llama3.2) or [`llama3-groq-tool-use`](https://ollama.com/library/llama3-groq-tool-use)).
- At the moment, small models like `llama3.2` [cannot reliably maintain a conversation alongside tool calling definitions](https://llama.meta.com/docs/model-cards-and-prompt-formats/llama3_1/#llama-3.1-instruct). They can be used for zero-shot tool calling, but for multi-turn conversations it's recommended to use larger models like `llama3.2:70b` or `llama3.2:405b`.

```dart
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
  defaultOptions: ChatOllamaOptions(
    model: 'llama3.2',
    temperature: 0,
    tools: [tool],
  ),
);

final res = await chatModel.invoke(
  PromptValue.string('What’s the weather like in Boston and Madrid right now in celsius?'),
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
```

As you can see, `ChatOllama` support calling multiple tools in a single request.

If you want to customize how the model should respond to tool calls, you can use the `toolChoice` parameter:

```dart
final chatModel = ChatOllama(
  defaultOptions: ChatOllamaOptions(
    model: 'llama3.2',
    temperature: 0,
    tools: [tool],
    toolChoice: ChatToolChoice.forced(name: 'get_current_weather'),
  ),
);
```

**Pro-tip:** You can improve tool-calling performance of small models by using few-shot prompting. You can find out how to do this [here](https://langchaindart.dev/#/modules/model_io/models/chat_models/how_to/tools?id=few-shot-prompting) and in this [blog post](https://blog.langchain.dev/few-shot-prompting-to-improve-tool-calling-performance).

### JSON mode

You can force the model to produce JSON output that you can easily parse using `JsonOutputParser`, useful for extracting structured data.

```dart
final promptTemplate = ChatPromptTemplate.fromTemplates(const [
  (ChatMessageType.system, 'You are an assistant that respond question using JSON format.'),
  (ChatMessageType.human, '{question}'),
]);
final chat = ChatOllama(
  defaultOptions: ChatOllamaOptions(
    model: 'llama3.2',
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
```

## Examples

### Answering questions with data from an external API

Imagine you have an API that provides flight times between two cities:

```dart
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
```

Using the tool calling capabilities of Ollama, we can provide the model with the ability to call this API whenever it needs to get flight times to answer a question.

```dart
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
    model: 'llama3.2',
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
```

### Extracting structured data with tools

A useful application of tool calling is extracting structured data from unstructured text. In the following example, we use a tool to extract the names, heights, and hair colors of people mentioned in a passage.

```dart
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
    options: ChatOllamaOptions(
      model: 'llama3.2',
      temperature: 0,
    ),
    tools: [tool],
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
```

### RAG (Retrieval-Augmented Generation) pipeline

We can easily create a fully local RAG pipeline using `OllamaEmbeddings` and `ChatOllama`.

```dart
// 1. Create a vector store and add documents to it
final vectorStore = MemoryVectorStore(
  embeddings: OllamaEmbeddings(model: 'jina/jina-embeddings-v2-small-en'),
);
await vectorStore.addDocuments(
  documents: [
    Document(pageContent: 'LangChain was created by Harrison'),
    Document(pageContent: 'David ported LangChain to Dart in LangChain.dart'),
  ],
);

// 2. Construct a RAG prompt template
final promptTemplate = ChatPromptTemplate.fromTemplates([
  (ChatMessageType.system, 'Answer the question based on only the following context:\n{context}'),
  (ChatMessageType.human, '{question}'),
]);

// 3. Define the model to use and the vector store retriever
final chatModel = ChatOllama(
  defaultOptions: ChatOllamaOptions(model: 'llama3.2'),
);
final retriever = vectorStore.asRetriever(
  defaultOptions: VectorStoreRetrieverOptions(
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
}).pipe(promptTemplate).pipe(chatModel).pipe(StringOutputParser());

// 5. Run the pipeline
final res = await chain.invoke('Who created LangChain.dart?');
print(res);
// Based on the context provided, David created LangChain.dart.
```
