import '../../chat_models/models/models.dart';

/// Base PromptValue class.
/// All prompt values should extend this class.
abstract interface class PromptValue {
  /// Return prompt as messages messages.
  @override
  String toString();

  /// Return prompt as messages
  List<ChatMessage> toMessages();
}

typedef InputValues = Map<String, Object>;

typedef PartialValues = Map<String, Object>;
