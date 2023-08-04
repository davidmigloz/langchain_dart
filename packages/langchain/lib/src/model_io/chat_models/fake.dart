import '../prompts/models/models.dart';
import 'base.dart';
import 'models/models.dart';

/// {@template fake_chat_model}
/// Fake Chat Model for testing.
/// You can pass in a list of responses to return in order when called.
/// {@endtemplate}
class FakeChatModel extends SimpleChatModel {
  /// {@macro fake_list_llm}
  FakeChatModel({
    required this.responses,
  });

  /// Responses to return in order when called.
  final List<String> responses;

  int _i = 0;

  @override
  String get modelType => 'fake-chat-model';

  @override
  Future<String> callInternal(
    final List<ChatMessage> messages, {
    final ChatModelOptions? options,
  }) {
    return Future<String>.value(responses[_i++ % responses.length]);
  }

  @override
  Future<List<int>> tokenize(final PromptValue promptValue) async {
    return promptValue
        .toString()
        .split(' ')
        .map((final word) => word.hashCode)
        .toList(growable: false);
  }
}
