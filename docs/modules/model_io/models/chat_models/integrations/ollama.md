# ChatOllama

Wrapper around [Ollama](https://ollama.ai) Completions API that enables to interact with the LLMs in a chat-like fashion.

Ollama allows you to run open-source large language models, such as Llama 2, locally.

Ollama bundles model weights, configuration, and data into a single package, defined by a Modelfile.

It optimizes setup and configuration details, including GPU usage.

For a complete list of supported models and model variants, see the [Ollama model library](https://ollama.ai/library).

## Setup

Follow [these instructions](https://github.com/jmorganca/ollama) to set up and run a local Ollama instance:

1. Download and install [Ollama](https://ollama.ai)
2. Fetch a model via `ollama pull <model family>`
  * e.g., for `Llama-7b`: `ollama pull llama2`

## Usage

```dart
final promptTemplate = ChatPromptTemplate.fromTemplates([
  (
  ChatMessageType.system,
  'You are a helpful assistant that translates {input_language} to {output_language}.',
  ),
  (ChatMessageType.human, '{text}'),
]);

final chatModel = ChatOllama(
  defaultOptions: ChatOllamaOptions(
    model: 'llama2',
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

## Streaming

```dart
final promptTemplate = ChatPromptTemplate.fromTemplates([
  (
  ChatMessageType.system,
  'You are a helpful assistant that replies only with numbers '
      'in order without any spaces or commas',
  ),
  (ChatMessageType.human,    'List the numbers from 1 to {max_num}'),
]);
final chat = ChatOllama(
  defaultOptions: ChatOllamaOptions(
    model: 'llama2',
    temperature: 0,
  ),
);
final chain = promptTemplate.pipe(chat).pipe(StringOutputParser());

final stream = chain.stream({'max_num': '9'});
await stream.forEach(print);
// 1
// 2
// 3
// ..
// 9
```

## JSON mode

You can enforce the model to produce a JSON output, useful for extracting structured data.

```dart
final promptTemplate = ChatPromptTemplate.fromTemplates(const [
  (ChatMessageType.system, 'Respond using JSON'),
  (ChatMessageType.human, '{question}'),
]);
final chat = ChatOllama(
  defaultOptions: const ChatOllamaOptions(
    model: 'llama2',
    temperature: 0,
    format: OllamaResponseFormat.json,
  ),
);

final chain = promptTemplate.pipe(chat);

final res = await chain.invoke(
  {'question': 'What color is the sky at different times of the day?'},
);
print(res.firstOutputAsString);
// {"morning": {"sky": "pink", "sun": "rise"}, "daytime": {"sky": "blue", "sun": "high"}, "afternoon": ...}
```

## Multimodal support

Ollama has support for multi-modal LLMs, such as [bakllava](https://ollama.ai/library/bakllava) and [llava](https://ollama.ai/library/llava).

You can provide several base64-encoded `png` or `jpeg` images. Images up to 100MB in size are supported.

```dart
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
print(res.firstOutputAsString);
// -> 'An Apple'
```
