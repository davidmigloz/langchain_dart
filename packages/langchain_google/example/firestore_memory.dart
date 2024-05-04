import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:langchain_google/langchain_google.dart';
import 'package:langchain/langchain.dart';

Future<void> main() async {
  await _history();
  // await _historyWithNestedCollection();
  // await _chainWithFirestoreHistory();
}

Future<void> _history() async {
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
Future<void> _historyWithNestedCollection() async {
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

//Using in a chain
Future<void> _chainWithFirestoreHistory() async {
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

  //Create llm instanse
  final llm = FakeLLM(
    responses: [
      "Hi there! It's nice to meet you. How can I help you today?",
    ],
  );

  //Create chain with memory
  final ConversationChain conversation = ConversationChain(
    llm: llm,
    memory: ConversationBufferMemory(chatHistory: history),
  );

  //Call llm
  final output1 = await conversation.run('Hi there!');

  print(output1);
  // -> 'Hi there! It's nice to meet you. How can I help you today?'
}
