import 'package:langchain_core/chat_models.dart';

/// {@template chat_firebase_vertex_ai_options}
/// Options to pass into the Vertex AI for Firebase model.
/// {@endtemplate}
class ChatFirebaseVertexAIOptions extends ChatModelOptions {
  /// {@macro chat_firebase_vertex_ai_options}
  const ChatFirebaseVertexAIOptions({
    this.model = 'gemini-1.5-flash',
    this.topP,
    this.topK,
    this.candidateCount,
    this.maxOutputTokens,
    this.temperature,
    this.stopSequences,
    this.safetySettings,
    super.tools,
    super.toolChoice,
    super.concurrencyLimit,
  });

  /// The LLM to use.
  ///
  /// You can find a list of available models here:
  /// https://firebase.google.com/docs/vertex-ai/gemini-models
  final String? model;

  /// The maximum cumulative probability of tokens to consider when sampling.
  /// The model uses combined Top-k and nucleus sampling. Tokens are sorted
  /// based on their assigned probabilities so that only the most likely
  /// tokens are considered. Top-k sampling directly limits the maximum
  /// number of tokens to consider, while Nucleus sampling limits number of
  /// tokens based on the cumulative probability.
  ///
  /// Note: The default value varies by model, see the `Model.top_p`
  /// attribute of the `Model` returned the `getModel` function.
  final double? topP;

  /// The maximum number of tokens to consider when sampling. The model
  /// uses combined Top-k and nucleus sampling. Top-k sampling considers
  /// the set of `top_k` most probable tokens. Defaults to 40. Note:
  ///
  /// The default value varies by model, see the `Model.top_k` attribute
  /// of the `Model` returned the `getModel` function.
  final int? topK;

  /// Number of generated responses to return. This value must be between
  /// [1, 8], inclusive. If unset, this will default to 1.
  final int? candidateCount;

  /// The maximum number of tokens to include in a candidate. If unset,
  /// this will default to `output_token_limit` specified in the `Model`
  /// specification.
  final int? maxOutputTokens;

  /// Controls the randomness of the output.
  ///
  /// Note: The default value varies by model, see the `Model.temperature`
  /// attribute of the `Model` returned the `getModel` function.
  ///
  /// Values can range from [0.0,1.0], inclusive. A value closer to 1.0 will
  /// produce responses that are more varied and creative, while a value
  /// closer to 0.0 will typically result in more straightforward responses
  /// from the model.
  final double? temperature;

  /// The set of character sequences (up to 5) that will stop output generation.
  /// If specified, the API will stop at the first appearance of a stop sequence.
  /// The stop sequence will not be included as part of the response.
  final List<String>? stopSequences;

  /// A list of unique [ChatFirebaseVertexAISafetySetting] instances for blocking
  /// unsafe content.
  ///
  /// This will be enforced on the generated output. There should not be more than
  /// one setting for each type. The API will block any contents and responses that
  /// fail to meet the thresholds set by these settings.
  ///
  /// This list overrides the default settings for each category specified. If there
  /// is no safety setting for a given category provided in the list, the API will use
  /// the default safety setting for that category.
  final List<ChatFirebaseVertexAISafetySetting>? safetySettings;

  /// Creates a copy of this [ChatFirebaseVertexAIOptions] object with the given fields
  /// replaced with the new values.
  ChatFirebaseVertexAIOptions copyWith({
    final String? model,
    final double? topP,
    final int? topK,
    final int? candidateCount,
    final int? maxOutputTokens,
    final double? temperature,
    final List<String>? stopSequences,
    final List<ChatFirebaseVertexAISafetySetting>? safetySettings,
  }) {
    return ChatFirebaseVertexAIOptions(
      model: model ?? this.model,
      topP: topP ?? this.topP,
      topK: topK ?? this.topK,
      candidateCount: candidateCount ?? this.candidateCount,
      maxOutputTokens: maxOutputTokens ?? this.maxOutputTokens,
      temperature: temperature ?? this.temperature,
      stopSequences: stopSequences ?? this.stopSequences,
      safetySettings: safetySettings ?? this.safetySettings,
    );
  }
}

/// {@template chat_google_generative_ai_safety_setting}
/// Safety setting, affecting the safety-blocking behavior.
/// Passing a safety setting for a category changes the allowed probability that
/// content is blocked.
/// {@endtemplate}
class ChatFirebaseVertexAISafetySetting {
  /// {@macro chat_google_generative_ai_safety_setting}
  const ChatFirebaseVertexAISafetySetting({
    required this.category,
    required this.threshold,
  });

  /// The category for this setting.
  final ChatFirebaseVertexAISafetySettingCategory category;

  /// Controls the probability threshold at which harm is blocked.
  final ChatFirebaseVertexAISafetySettingThreshold threshold;
}

/// Safety settings categorizes.
///
/// Docs: https://ai.google.dev/docs/safety_setting_gemini
enum ChatFirebaseVertexAISafetySettingCategory {
  /// The harm category is unspecified.
  unspecified,

  /// The harm category is harassment.
  harassment,

  /// The harm category is hate speech.
  hateSpeech,

  /// The harm category is sexually explicit content.
  sexuallyExplicit,

  /// The harm category is dangerous content.
  dangerousContent,
}

/// Controls the probability threshold at which harm is blocked.
///
/// Docs: https://ai.google.dev/docs/safety_setting_gemini
enum ChatFirebaseVertexAISafetySettingThreshold {
  /// Threshold is unspecified, block using default threshold.
  unspecified,

  /// 	Block when low, medium or high probability of unsafe content.
  blockLowAndAbove,

  /// Block when medium or high probability of unsafe content.
  blockMediumAndAbove,

  /// Block when high probability of unsafe content.
  blockOnlyHigh,

  /// Always show regardless of probability of unsafe content.
  blockNone,
}
