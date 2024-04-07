# Ollama

Wrapper around [Ollama](https://ollama.ai) Completions API.

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
final prompt = PromptTemplate.fromTemplate(
  'What is a good name for a company that makes {product}?',
);
final llm = Ollama(
  defaultOptions: const OllamaOptions(
    model: 'llama2',
  ),
);
final chain = prompt | llm | StringOutputParser();
final res = await chain.invoke({'product': 'colorful socks'});
print(res);
// -> 'SoleMates'
```

## Streaming

```dart
final promptTemplate = PromptTemplate.fromTemplate(
  'List the numbers from 1 to {max_num} in order without any spaces or commas',
);
final llm = Ollama(
  defaultOptions: const OllamaOptions(
    model: 'llama2',
  ),
);
const stringOutputParser = StringOutputParser<LLMResult>();
final chain = promptTemplate | llm | stringOutputParser;
final stream = chain.stream({'max_num': '9'});
await stream.forEach(print);
// 1
// 2
// 3
// ..
// 9
```
