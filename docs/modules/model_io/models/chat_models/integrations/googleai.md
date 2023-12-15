# ChatGoogleGenerativeAI

Wrapper around [Google AI for Developers](https://ai.google.dev/) API (aka Gemini API).

## Setup

To use `ChatGoogleGenerativeAI` you need to have an API key. You can get one [here](https://makersuite.google.com/app/apikey).

The following models are available at the moment:
- `gemini-pro`: text -> text model
- `gemini-pro-vision`: text / image -> text model

Mind that this list may not be up-to-date. Refer to the [documentation](https://ai.google.dev/models) for the updated list.

## Usage

```dart
final apiKey = Platform.environment['GOOGLEAI_API_KEY'];

final chatModel = ChatGoogleGenerativeAI(
  apiKey: apiKey,
  defaultOptions: ChatGoogleGenerativeAIOptions(
    temperature: 0,
  ),
);

const template = '''
You are a helpful assistant that translates {input_language} to {output_language}. 

Text to translate: 
{text}''';
final humanMessagePrompt = HumanChatMessagePromptTemplate.fromTemplate(template);
final chatPrompt = ChatPromptTemplate.fromPromptMessages([humanMessagePrompt]);

final chain = chatPrompt | chatModel | StringOutputParser();

final res = await chain.invoke({
  'input_language': 'English',
  'output_language': 'French',
  'text': 'I love programming.',
});
print(res);
// -> 'J'adore la programmation.'final
```

## Multimodal support

```dart
final apiKey = Platform.environment['GOOGLEAI_API_KEY'];

final chatModel = ChatGoogleGenerativeAI(
  apiKey: apiKey,
  defaultOptions: ChatGoogleGenerativeAIOptions(
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
  options: ChatGoogleGenerativeAIOptions(
    model: 'gemini-pro-vision',
  ),
);
print(res.firstOutputAsString);
// -> 'A Red and Green Apple'
```

## Limitations

As of the time this doc was written (15/12/23), Gemini has some restrictions on the types and structure of prompts it accepts. Specifically:

1. When providing multimodal (image) inputs, you are restricted to at most 1 message of “human” (user) type. You cannot pass multiple messages (though the single human message may have multiple content entries).
2. System messages are not accepted.
3. For regular chat conversations, messages must follow the human/ai/human/ai alternating pattern. You may not provide 2 AI or human messages in sequence.
4. Message may be blocked if they violate the safety checks of the LLM. In this case, the model will return an empty response.
