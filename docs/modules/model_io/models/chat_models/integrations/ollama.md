# ChatOllama

Wrapper around [Ollama](https://ollama.ai) Completions API that enables to interact with the LLMs in a chat-like fashion.

Ollama allows you to run open-source large language models, such as Llama 2, locally.

Ollama bundles model weights, configuration, and data into a single package, defined by a Modelfile.

It optimizes setup and configuration details, including GPU usage.

For a complete list of supported models and model variants, see the [Ollama model library](https://ollama.ai/library).

## Setup

Rollow [these instructions](https://github.com/jmorganca/ollama) to set up and run a local Ollama instance:

1. Download and install [Ollama](https://ollama.ai)
2. Fetch a model via `ollama pull <model family>`
  * e.g., for `Llama-7b`: `ollama pull llama2`

## Usage

```dart
final chatModel = ChatOllama(
  defaultOptions: const ChatOllamaOptions(
    model: 'llama2',
    temperature: 0,
  ),
);

const template =
    'You are a helpful assistant that translates {input_language} to {output_language}.';
final systemMessagePrompt =
    SystemChatMessagePromptTemplate.fromTemplate(template);
const humanTemplate = '{text}';
final humanMessagePrompt =
    HumanChatMessagePromptTemplate.fromTemplate(humanTemplate);
final chatPrompt = ChatPromptTemplate.fromPromptMessages(
  [systemMessagePrompt, humanMessagePrompt],
);

final chain = chatPrompt | chatModel | const StringOutputParser();

final res = await chain.invoke({
  'input_language': 'English',
  'output_language': 'French',
  'text': 'I love programming.',
});
print(res);
// -> 'La traduction est : "J'aime le programming.'
```

## Streaming

```dart
final promptTemplate = ChatPromptTemplate.fromPromptMessages([
  SystemChatMessagePromptTemplate.fromTemplate(
    'You are a helpful assistant that replies only with numbers '
    'in order without any spaces or commas',
  ),
  HumanChatMessagePromptTemplate.fromTemplate(
    'List the numbers from 1 to {max_num}',
  ),
]);
final chat = ChatOllama(
  defaultOptions: const ChatOllamaOptions(
    model: 'llama2:latest',
    temperature: 0,
  ),
);
const stringOutputParser = StringOutputParser<AIChatMessage>();

final chain = promptTemplate.pipe(chat).pipe(stringOutputParser);

final stream = chain.stream({'max_num': '9'});
await stream.forEach(print);
// 1
// 2
// 3
// ..
// 9
```
