import 'package:langchain/langchain.dart';

/// {@template openai_options}
/// Options to pass into the OpenAI LLM.
/// {@endtemplate}
class OpenAIOptions extends LLMOptions {
  /// {@macro openai_options}
  const OpenAIOptions({
    this.stop,
  });

  /// List of stop words to use when generating.
  final List<String>? stop;
}
