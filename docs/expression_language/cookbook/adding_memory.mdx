# Adding memory

This shows how to add memory to an arbitrary chain. Right now, you can use the memory classes but need to hook them up manually.

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
final model = ChatOpenAI(apiKey: openaiApiKey);
const stringOutputParser = StringOutputParser<ChatResult>();
final memory = ConversationBufferMemory(returnMessages: true);

final promptTemplate = ChatPromptTemplate.fromPromptMessages([
  SystemChatMessagePromptTemplate.fromTemplate(
    'You are a helpful chatbot',
  ),
  const MessagesPlaceholder(variableName: 'history'),
  HumanChatMessagePromptTemplate.fromTemplate('{input}'),
]);

final chain = Runnable.fromMap({
      'input': Runnable.passthrough(),
      'history': Runnable.mapInput(
            (_) async {
          final m = await memory.loadMemoryVariables();
          return m['history'];
        },
      ),
    }) |
    promptTemplate |
    model |
    stringOutputParser;

const input1 = 'Hi, I am Bob';
final output1 = await chain.invoke(input1);
print(output1);
// Hello Bob! How can I assist you today?

await memory.saveContext(
  inputValues: {'input': input1},
  outputValues: {'output': output1},
);

const input2 = "What's my name?";
final output2 = await chain.invoke(input2);
print(output2);
// Your name is Bob, as you mentioned earlier.
```
