// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  await _chatbotWithMemory();
}

Future<void> _chatbotWithMemory() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final model = ChatOpenAI(apiKey: openaiApiKey);
  const stringOutputParser = StringOutputParser<ChatResult>();

  final promptTemplate = ChatPromptTemplate.fromPromptMessages([
    SystemChatMessagePromptTemplate.fromTemplate(
      'You are a helpful chatbot',
    ),
    const MessagesPlaceholder(variableName: 'history'),
    HumanChatMessagePromptTemplate.fromTemplate('{input}'),
  ]);

  final memory = ConversationBufferMemory(returnMessages: true);

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
}
