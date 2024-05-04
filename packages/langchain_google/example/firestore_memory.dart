import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:langchain_google/langchain_google.dart';
import 'package:langchain/langchain.dart';

Future<void> main() async {
  await _example1();
}

Future<void> _example1() async {
  final db = FakeFirebaseFirestore();
  const String userId = '1234';

  final FirestoreChatMessageHistory history = FirestoreChatMessageHistory(
    collections: 'Langchain',
    options: db.app.options,
    userId: userId,
  );
  //Very important to initialize firestore
  await history.ensureFirestore();

  await history.addHumanChatMessage('hi!');
  await history.addAIChatMessage('whats up?');

  print(await history.getChatMessages());
}

//Nested firestore collection
Future<void> _example2() async {
  final db = FakeFirebaseFirestore();
  const String userId = '1234';

  final FirestoreChatMessageHistory history = FirestoreChatMessageHistory(
    collections: 'Users/$userId/Messages',
    options: db.app.options,
    userId: userId,
  );

  //Very important to initialize firestore
  await history.ensureFirestore();

  await history.addHumanChatMessage('hi!');
  await history.addAIChatMessage('whats up?');

  print(await history.getChatMessages());
  // [HumanChatMessage(content='hi!', example=false),
  //  AIMessage(content='whats up?', example=false)]
}

//Nested firestore collection
Future<void> _example3() async {
  final db = FakeFirebaseFirestore();
  const String userId = '1234';

  //Create firestore history to give to ConversationBufferMemory
  final FirestoreChatMessageHistory history = FirestoreChatMessageHistory(
    collections: 'Users/$userId/Messages',
    options: db.app.options,
    userId: userId,
  );

  //Very important to initialize firestore
  await history.ensureFirestore();

  //Create ConversationBufferMemory instance to give to Chain
  final ConversationBufferMemory memory =
      ConversationBufferMemory(chatHistory: history);

  //Create llm instanse
  final llm = FakeLLM(responses: ['Hey there what can I help you with?']);

  //Create chain with memory
  final ConversationChain chain = ConversationChain(llm: llm, memory: memory);

  //Call llm
  await chain.run('Hi there!');

  print(await history.getChatMessages());
  // [HumanChatMessage(content='Hi there!', example=false),
  //  AIMessage(content='Hey there what can I help you with?', example=false)]
}
