import 'package:langchain/langchain.dart';
import '../openai.dart';

/// {@template openai_options}
/// Options to pass into the OpenAI LLM.
/// {@endtemplate}
class OpenAIOptions extends LLMOptions {
  /// {@macro openai_options}
  const OpenAIOptions({
    this.stop,
    this.user,
  });

  /// Up to 4 sequences where the API will stop generating further tokens.
  /// The returned text will not contain the stop sequence.
  ///
  /// Ref: https://platform.openai.com/docs/api-reference/completions/create#stop
  final List<String>? stop;

  /// A unique identifier representing your end-user, which can help OpenAI to
  /// monitor and detect abuse.
  ///
  /// If the user does not change between requests, you can set this field in
  /// [OpenAI.user] instead.
  ///
  /// If you specify it in both places, the value in [OpenAIOptions.user] will
  /// be used.
  ///
  /// Ref: https://platform.openai.com/docs/guides/safety-best-practices/end-user-ids
  final String? user;
}
