import 'package:langchain/langchain.dart';

/// {@template vertex_ai_options}
/// Options to pass into the Vertex AI LLM.
/// {@endtemplate}
class VertexAIOptions extends LLMOptions {
  /// {@macro vertex_ai_options}
  const VertexAIOptions({
    this.publisher = 'google',
    this.model = 'text-bison',
    this.maxOutputTokens,
    this.temperature,
    this.topP,
    this.topK,
    this.stopSequences,
    this.candidateCount,
  });

  /// The publisher of the model.
  ///
  /// Use `google` for first-party models.
  final String? publisher;

  /// The text model to use.
  ///
  /// To use the latest model version, specify the model name without a version
  /// number (e.g. `text-bison`).
  /// To use a stable model version, specify the model version number
  /// (e.g. `text-bison@001`).
  ///
  /// You can find a list of available models here:
  /// https://cloud.google.com/vertex-ai/docs/generative-ai/learn/models
  final String? model;

  /// Maximum number of tokens that can be generated in the response. A token
  /// is approximately four characters. 100 tokens correspond to roughly
  /// 60-80 words.
  ///
  /// Specify a lower value for shorter responses and a higher value for longer
  /// responses.
  ///
  /// Range: `[1, 1024]`
  final int? maxOutputTokens;

  /// The temperature is used for sampling during response generation, which
  /// occurs when topP and topK are applied. Temperature controls the degree of
  /// randomness in token selection. Lower temperatures are good for prompts
  /// that require a more deterministic and less open-ended or creative
  /// response, while higher temperatures can lead to more diverse or creative
  /// results. A temperature of 0 is deterministic, meaning that the highest
  /// probability response is always selected.
  ///
  /// For most use cases, try starting with a temperature of 0.2. If the model
  /// returns a response that's too generic, too short, or the model gives a
  /// fallback response, try increasing the temperature.
  ///
  /// Range: `[0.0, 1.0]`
  final double? temperature;

  /// Top-P changes how the model selects tokens for output. Tokens are
  /// selected from the most (see top-K) to least probable until the sum of
  /// their probabilities equals the top-P value. For example, if tokens A, B,
  /// and C have a probability of 0.3, 0.2, and 0.1 and the top-P value is 0.5,
  /// then the model will select either A or B as the next token by using
  /// temperature and excludes C as a candidate.
  ///
  /// Specify a lower value for less random responses and a higher value for
  /// more random responses.
  ///
  /// Range: `[0.0, 1.0]`
  final double? topP;

  /// Top-K changes how the model selects tokens for output. A top-K of 1 means
  /// the next selected token is the most probable among all tokens in the
  /// model's vocabulary (also called greedy decoding), while a top-K of 3
  /// means that the next token is selected from among the three most probable
  /// tokens by using temperature.
  ///
  /// For each token selection step, the top-K tokens with the highest
  /// probabilities are sampled. Then tokens are further filtered based on
  /// top-P with the final token selected using temperature sampling.
  ///
  /// Specify a lower value for less random responses and a higher value for
  /// more random responses.
  ///
  /// Range: `[1, 40]`
  final int? topK;

  /// Specifies a list of strings that tells the model to stop generating text
  /// if one of the strings is encountered in the response. If a string appears
  /// multiple times in the response, then the response truncates where it's
  /// first encountered. The strings are case-sensitive.
  final List<String>? stopSequences;

  /// The number of response variations to return.
  ///
  /// Range: `[1–8]`
  final int? candidateCount;

  /// Creates a copy of this [VertexAIOptions] object with the given fields
  /// replaced with the new values.
  VertexAIOptions copyWith({
    final String? publisher,
    final String? model,
    final int? maxOutputTokens,
    final double? temperature,
    final double? topP,
    final int? topK,
    final List<String>? stopSequences,
    final int? candidateCount,
  }) {
    return VertexAIOptions(
      publisher: publisher ?? this.publisher,
      model: model ?? this.model,
      maxOutputTokens: maxOutputTokens ?? this.maxOutputTokens,
      temperature: temperature ?? this.temperature,
      topP: topP ?? this.topP,
      topK: topK ?? this.topK,
      stopSequences: stopSequences ?? this.stopSequences,
      candidateCount: candidateCount ?? this.candidateCount,
    );
  }
}
