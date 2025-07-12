import 'package:langchain_compat/langchain_compat.dart';

/// Validates that a message history follows the correct conversation structure:
/// 1. At most one system message, which must be first if present
/// 2. After any system message, messages must alternate user/model/user/model
///
/// Throws an [AssertionError] if the message history is invalid.
void validateMessageHistory(List<ChatMessage> messages) {
  if (messages.isEmpty) return;

  var index = 0;

  // Check for system message (must be first if present)
  if (messages[index].role == MessageRole.system) {
    index++;
    // Check for duplicate system messages
    for (var i = index; i < messages.length; i++) {
      if (messages[i].role == MessageRole.system) {
        throw AssertionError(
          'Found system message at index $i, but system messages can only '
          'appear at index 0. Message: ${messages[i]}',
        );
      }
    }
  }

  // Check user/model alternation
  if (index < messages.length) {
    // First non-system message must be from user
    if (messages[index].role != MessageRole.user) {
      throw AssertionError(
        'First non-system message must be from user, but found '
        '${messages[index].role} at index $index. Message: ${messages[index]}',
      );
    }

    // Check alternation pattern
    var expectingUser = true;
    for (var i = index; i < messages.length; i++) {
      final expectedRole = expectingUser ? MessageRole.user : MessageRole.model;
      if (messages[i].role != expectedRole) {
        throw AssertionError(
          'Expected ${expectedRole.name} message at index $i, but found '
          '${messages[i].role.name}. Messages must alternate user/model. '
          'Message: ${messages[i]}',
        );
      }
      expectingUser = !expectingUser;
    }
  }
}
