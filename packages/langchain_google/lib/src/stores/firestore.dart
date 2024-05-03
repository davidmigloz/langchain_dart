import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:langchain_core/chat_history.dart';
import 'package:langchain_core/chat_models.dart';

///Can be uses to store ChatMessages in firestore
final class FirestoreChatMessageHistory extends BaseChatMessageHistory {
  ///Constructor
  FirestoreChatMessageHistory({
    required this.collections,
    required this.options,
    required this.userId,
  });

  ///Function to initialize firebaseinstance
  Future<void> ensureFirestore() async {
    await Firebase.initializeApp(
      options: options,
    );
    collectionReference = FirebaseFirestore.instance.collection(collections);
  }

  ///String list of collection names
  String collections;

  ///Firebase Options
  FirebaseOptions options;

  /// Used to identify the sender of each message
  String userId;

  ///Firestore instance
  CollectionReference<Map<String, dynamic>>? collectionReference;

  @override
  Future<void> addChatMessage(final ChatMessage message) async {
    final FirestoreChatMessageField messageField =
        FirestoreChatMessageField(message: message, createdBy: userId);
    if (collectionReference == null) {
      throw Exception('Remember to initialize firestore');
    } else {
      await collectionReference!.doc().set(messageField.toJson());
    }
  }

  @override
  Future<void> clear() async {
    if (collectionReference == null) {
      throw Exception('Remember to initialize firestore');
    } else {
      final snapshot = await collectionReference!.get();

      //Delete all docs in firestore
      for (final doc in snapshot.docs) {
        await doc.reference.delete();
      }
    }
  }

  @override
  Future<List<ChatMessage>> getChatMessages() async {
    if (collectionReference == null) {
      throw Exception('Remember to initialize firestore');
    } else {
      //Get chat messages in ascending order so the newest message is the last in the list
      final snapshot = await collectionReference!
          .where('createdBy', isEqualTo: userId)
          .orderBy('createdAt', descending: false)
          .get();

      //Take each doc and add it to the conversation list.
      final List<ChatMessage> conversation = snapshot.docs.map((final doc) {
        return FirestoreChatMessageField.fromJson(doc.data()).message;
      }).toList();

      return conversation;
    }
  }

  /// Removes and returns the first (oldest) element of the history.
  ///
  /// The history must not be empty when this method is called.
  @override
  Future<ChatMessage> removeFirst() async {
    if (collectionReference == null) {
      throw Exception('Remember to initialize firestore');
    } else {
      final snapshot = await collectionReference!
          .orderBy('createdAt', descending: false)
          .limit(1)
          .get();

      //get oldest document
      final oldest = snapshot.docs.first;

      //Delete doc in firestore
      await oldest.reference.delete();

      //Create FirestoreChatMessageField and return ChatMessage
      return FirestoreChatMessageField.fromJson(oldest.data()).message;
    }
  }

  /// Removes and returns the last (newest) element of the history.
  ///
  /// The history must not be empty when this method is called.
  @override
  Future<ChatMessage> removeLast() async {
    if (collectionReference == null) {
      throw Exception('Remember to initialize firestore');
    } else {
      final snapshot = await collectionReference!
          .orderBy('createdAt', descending: true)
          .limit(1)
          .get();

      //get newest document
      final newest = snapshot.docs.first;

      //Delete doc in firestore
      await newest.reference.delete();

      //Create FirestoreChatMessageField and return ChatMessage
      return FirestoreChatMessageField.fromJson(newest.data()).message;
    }
  }
}

///This class makes sure that every chat message on firestore has a timestamp
///This will enable fetching document with orderBy(created).
class FirestoreChatMessageField {
  ///Will contain the chat message
  final ChatMessage message;

  ///Timestamp to keep messages in order.
  Timestamp createdAt = Timestamp.now();

  /// Used to identify the sender of each message
  final String createdBy;

  ///Constructor
  FirestoreChatMessageField({
    required this.message,
    final Timestamp? createdAt,
    required this.createdBy,
  }) {
    if (createdAt == null) {
      this.createdAt = Timestamp.now();
    } else {
      this.createdAt = createdAt;
    }
  }

  ///FromJson will convert a json map to a FirestoreChatMessageField
  factory FirestoreChatMessageField.fromJson(final Map<String, dynamic> json) {
    // ignore: avoid_dynamic_calls
    switch (json['message']['type']) {
      case SystemChatMessage.defaultPrefix:
        return FirestoreChatMessageField(
          message: SystemChatMessage.fromJson(json['message']),
          createdAt: json['createdAt'],
          createdBy: json['createdBy'],
        );
      case HumanChatMessage.defaultPrefix:
        return FirestoreChatMessageField(
          message: HumanChatMessage.fromJson(json['message']),
          createdAt: json['createdAt'],
          createdBy: json['createdBy'],
        );

      case AIChatMessage.defaultPrefix:
        return FirestoreChatMessageField(
          message: AIChatMessage.fromJson(json['message']),
          createdAt: json['createdAt'],
          createdBy: json['createdBy'],
        );

      case FunctionChatMessage.defaultPrefix:
        return FirestoreChatMessageField(
          message: FunctionChatMessage.fromJson(json['message']),
          createdAt: json['createdAt'],
          createdBy: json['createdBy'],
        );

      case 'Custom':
        return FirestoreChatMessageField(
          message: CustomChatMessage.fromJson(json['message']),
          createdAt: json['createdAt'],
          createdBy: json['createdBy'],
        );
      default:
        // ignore: avoid_dynamic_calls
        throw FormatException("INVALID JSON FILE = ${json['message']['type']}");
    }
  }

  /// Will be used to transform the class into a json object
  Map<String, dynamic> toJson() => {
        'message': message.toJson(),
        'createdAt': createdAt,
        'createdBy': createdBy,
      };
}
