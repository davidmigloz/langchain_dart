import 'schema.dart';

abstract class BaseLanguageModel {
  const BaseLanguageModel();

  /// Take in a list of prompt values and return an LLMResult.
  Future<LLMResult> generatePrompt({
    required final List<PromptValue> prompts,
    final List<String>? stop,
  });

  /// Predict text from text.
  Future<String> predict({
    required final String text,
    final List<String>? stop,
  });

  /// Predict message from messages.
  Future<BaseMessage> predictMessages({
    required final List<BaseMessage> messages,
    final List<String>? stop,
  });
}
