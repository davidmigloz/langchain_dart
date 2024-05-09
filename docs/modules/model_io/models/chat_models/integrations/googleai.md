# ChatGoogleGenerativeAI

Wrapper around [Google AI for Developers](https://ai.google.dev/) API (aka Gemini API).

## Setup

To use `ChatGoogleGenerativeAI` you need to have an API key. You can get one [here](https://aistudio.google.com/app/apikey).

The following models are available:
- `gemini-1.0-pro` (or `gemini-pro`):
    * text -> text model
    * Max input token: 30720
    * Max output tokens: 2048
- `gemini-pro-vision`:
    * text / image -> text model
    * Max input token: 12288
    * Max output tokens: 4096
- `gemini-1.5-pro-latest`: text / image -> text model
    * text / image -> text model
    * Max input token: 1048576
    * Max output tokens: 8192

Mind that this list may not be up-to-date. Refer to the [documentation](https://ai.google.dev/models) for the updated list.

## Usage

```dart
final apiKey = Platform.environment['GOOGLEAI_API_KEY'];

final chatModel = ChatGoogleGenerativeAI(
  apiKey: apiKey,
  defaultOptions: ChatGoogleGenerativeAIOptions(
    model: 'gemini-1.5-pro-latest',
    temperature: 0,
  ),
);

final chatPrompt = ChatPromptTemplate.fromTemplates([
  (ChatMessageType.system, 'You are a helpful assistant that translates {input_language} to {output_language}.'),
  (ChatMessageType.human, 'Text to translate:\n{text}'),
]);

final chain = chatPrompt | chatModel | StringOutputParser();

final res = await chain.invoke({
  'input_language': 'English',
  'output_language': 'French',
  'text': 'I love programming.',
});
print(res);
// -> 'J'adore programmer.'
```

## Multimodal support

```dart
final apiKey = Platform.environment['GOOGLEAI_API_KEY'];

final chatModel = ChatGoogleGenerativeAI(
  apiKey: apiKey,
  defaultOptions: ChatGoogleGenerativeAIOptions(
    model: 'gemini-1.5-pro-latest',
    temperature: 0,
  ),
);
final res = await chatModel.invoke(
  PromptValue.chat([
    ChatMessage.human(
      ChatMessageContent.multiModal([
        ChatMessageContent.text('What fruit is this?'),
        ChatMessageContent.image(
          mimeType: 'image/jpeg',
          data: base64.encode(
            await File('./bin/assets/apple.jpeg').readAsBytes(),
          ),
        ),
      ]),
    ),
  ]),
);
print(res.output.content);
// -> 'That is an apple.'
```

## Streaming

```dart
final apiKey = Platform.environment['GOOGLEAI_API_KEY'];

final promptTemplate = ChatPromptTemplate.fromTemplates(const [
  (ChatMessageType.system, 'You are a helpful assistant that replies only with numbers in order without any spaces or commas.'),
  (ChatMessageType.human, 'List the numbers from 1 to {max_num}'),
]);

final chatModel = ChatGoogleGenerativeAI(
  apiKey: apiKey,
  defaultOptions: const ChatGoogleGenerativeAIOptions(
    model: 'gemini-1.5-pro-latest',
    temperature: 0,
  ),
);

final chain = promptTemplate.pipe(chatModel).pipe(StringOutputParser());

final stream = chain.stream({'max_num': '30'});
await stream.forEach(print);
// 1
// 2345678910111213
// 1415161718192021
// 222324252627282930 

chatModel.close();
```
