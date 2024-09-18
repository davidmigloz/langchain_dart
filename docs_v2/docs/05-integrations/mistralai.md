# ChatMistralAI

Wrapper around [Mistral AI](https://mistral.ai/) Chat Completions API.

Mistral AI brings the strongest open generative models to the developers, along with efficient ways to deploy and customise them for production.

> Note: Mistral AI API is currently in closed beta. You can request access [here](https://console.mistral.ai).

## Setup

To use `ChatMistralAI` you need to have a Mistral AI account and an API key. You can get one [here](https://console.mistral.ai/users/).

The following models are available at the moment:
- `mistral-tiny`: Mistral 7B Instruct v0.2 (a minor release of Mistral 7B Instruct). It only works in English and obtains 7.6 on MT-Bench.
- `mistral-small`: Mixtral 8x7B. It masters English/French/Italian/German/Spanish and code and obtains 8.3 on MT-Bench.
- `mistral-medium`: a prototype model, that is currently among the top serviced models available based on standard benchmarks. It masters English/French/Italian/German/Spanish and code and obtains a score of 8.6 on MT-Bench.

## Usage

```dart
final chatModel = ChatMistralAI(
  apiKey: 'apiKey',
  defaultOptions: ChatMistralAIOptions(
    model: 'mistral-small',
    temperature: 0,
  ),
);

const template = 'You are a helpful assistant that translates {input_language} to {output_language}.';
final systemMessagePrompt = SystemChatMessagePromptTemplate.fromTemplate(template);
const humanTemplate = '{text}';
final humanMessagePrompt = HumanChatMessagePromptTemplate.fromTemplate(humanTemplate);
final chatPrompt = ChatPromptTemplate.fromPromptMessages(
  [systemMessagePrompt, humanMessagePrompt],
);

final chain = chatPrompt | chatModel | StringOutputParser();

final res = await chain.invoke({
  'input_language': 'English',
  'output_language': 'French',
  'text': 'I love programming.',
});
print(res);
// -> 'J'aime la programmation.'
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
final chat = ChatMistralAI(
  apiKey: 'apiKey',
  defaultOptions: ChatMistralAIOptions(
    model: 'mistral-medium',
    temperature: 0,
  ),
);

final chain = promptTemplate.pipe(chat).pipe(StringOutputParser());

final stream = chain.stream({'max_num': '9'});
await stream.forEach(print);
// 12
// 345
// 67
// 89
```
