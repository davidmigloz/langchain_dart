import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:langchain/langchain.dart';

final class FirestoreChatMessageHistory extends BaseChatMessageHistory {
  FirestoreChatMessageHistory(this.collection);

  //Firestore collection reference
  CollectionReference<Map<String, dynamic>> collection;

  @override
  Future<void> addChatMessage(final ChatMessage message) async {
    final FirestoreChatMessageField messageField =
        FirestoreChatMessageField(message: message);

    await collection.doc().set(messageField.toJson());
  }

  @override
  Future<void> clear() async {
    final snapshot = await collection.get();

    //Delete all docs in firestore
    for (final doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }

  @override
  Future<List<ChatMessage>> getChatMessages() async {
    //Get chat messages in ascending order so the newest message is the last in the list
    final snapshot =
        await collection.orderBy('created', descending: false).get();

    //Take each doc and add it to the conversation list.
    final List<ChatMessage> conversation = snapshot.docs.map((final doc) {
      return FirestoreChatMessageField.fromJson(doc.data()).message;
    }).toList();

    return conversation;
  }

  /// Removes and returns the first (oldest) element of the history.
  ///
  /// The history must not be empty when this method is called.
  @override
  Future<ChatMessage> removeFirst() async {
    final snapshot =
        await collection.orderBy('created', descending: false).limit(1).get();

    //get oldest document
    final oldest = snapshot.docs.first;

    //Delete doc in firestore
    await oldest.reference.delete();

    //Create FirestoreChatMessageField and return ChatMessage
    return FirestoreChatMessageField.fromJson(oldest.data()).message;
  }

  /// Removes and returns the last (newest) element of the history.
  ///
  /// The history must not be empty when this method is called.
  @override
  Future<ChatMessage> removeLast() async {
    final snapshot =
        await collection.orderBy('created', descending: true).limit(1).get();

    //get newest document
    final newest = snapshot.docs.first;

    //Delete doc in firestore
    await newest.reference.delete();

    //Create FirestoreChatMessageField and return ChatMessage
    return FirestoreChatMessageField.fromJson(newest.data()).message;
  }
}

//This class makes sure that every chat message on firestore has a timestamp
//This will enable fetching document with orderBy(created).
class FirestoreChatMessageField {
  final ChatMessage message;
  Timestamp created = Timestamp.now();

  FirestoreChatMessageField({required this.message, final Timestamp? created}) {
    if (created == null) {
      this.created = Timestamp.now();
    } else {
      this.created = created;
    }
  }

  factory FirestoreChatMessageField.fromJson(final Map<String, dynamic> json) {
    // ignore: avoid_dynamic_calls
    switch (json['message']['type']) {
      case SystemChatMessage.defaultPrefix:
        return FirestoreChatMessageField(
          message: SystemChatMessage.fromJson(json['message']),
          created: json['created'],
        );
      case HumanChatMessage.defaultPrefix:
        return FirestoreChatMessageField(
          message: HumanChatMessage.fromJson(json['message']),
          created: json['created'],
        );

      case AIChatMessage.defaultPrefix:
        return FirestoreChatMessageField(
          message: AIChatMessage.fromJson(json['message']),
          created: json['created'],
        );

      case FunctionChatMessage.defaultPrefix:
        return FirestoreChatMessageField(
          message: FunctionChatMessage.fromJson(json['message']),
          created: json['created'],
        );

      case 'Custom':
        return FirestoreChatMessageField(
          message: CustomChatMessage.fromJson(json['message']),
          created: json['created'],
        );
      default:
        // ignore: avoid_dynamic_calls
        throw FormatException("INVALID JSON FILE = ${json['message']['type']}");
    }
  }

  Map<String, dynamic> toJson() =>
      {'message': message.toJson(), 'created': created};
}
