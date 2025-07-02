import 'package:meta/meta.dart';

import '../chat_model_options.dart';

/// Options to pass into the Google Generative AI Chat Model.
///
/// You can find a list of available models [here](https://ai.google.dev/models).
@immutable
class GoogleChatOptions extends ChatModelOptions {
  /// Creates a new chat google generative ai options instance.
  const GoogleChatOptions({
    this.topP,
    this.topK,
    this.candidateCount,
    this.maxOutputTokens,
    this.temperature,
    this.stopSequences,
    this.responseMimeType,
    this.responseSchema,
    this.safetySettings,
    this.enableCodeExecution,
  });

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
  /// If specified, the API will stop at the first appearance of a stop
  /// sequence. The stop sequence will not be included as part of the response.
  final List<String>? stopSequences;

  /// Output response mimetype of the generated candidate text.
  ///
  /// Supported mimetype:
  /// - `text/plain`: (default) Text output.
  /// - `application/json`: JSON response in the candidates.
  final String? responseMimeType;

  /// Output response schema of the generated candidate text.
  /// Following the [JSON Schema specification](https://json-schema.org).
  ///
  /// - Note: This only applies when the specified ``responseMIMEType`` supports
  ///   a schema; currently this is limited to `application/json`.
  ///
  /// Example:
  /// ```json
  /// {
  ///   'type': 'object',
  ///   'properties': {
  ///     'answer': {
  ///       'type': 'string',
  ///       'description': 'The answer to the question being asked',
  ///     },
  ///     'sources': {
  ///       'type': 'array',
  ///       'items': {'type': 'string'},
  ///       'description': 'The sources used to answer the question',
  ///     },
  ///   },
  ///   'required': ['answer', 'sources'],
  /// },
  /// ```
  final Map<String, dynamic>? responseSchema;

  /// A list of unique [ChatGoogleGenerativeAISafetySetting] instances for
  /// blocking unsafe content.
  ///
  /// This will be enforced on the generated output. There should not be more
  /// than one setting for each type. The API will block any contents and
  /// responses that fail to meet the thresholds set by these settings.
  ///
  /// This list overrides the default settings for each category specified. If
  /// there is no safety setting for a given category provided in the list, the
  /// API will use the default safety setting for that category.
  final List<ChatGoogleGenerativeAISafetySetting>? safetySettings;

  /// When code execution is enabled the model may generate code and run it in
  /// the process of generating a response to the prompt. When this happens the
  /// code that was executed and it's output will be included in the response
  /// metadata as `metadata['executable_code']` and
  /// `metadata['code_execution_result']`.
  final bool? enableCodeExecution;
}

/// {@template chat_google_generative_ai_safety_setting}
/// Safety setting, affecting the safety-blocking behavior.
/// Passing a safety setting for a category changes the allowed probability that
/// content is blocked.
/// {@endtemplate}
class ChatGoogleGenerativeAISafetySetting {
  /// {@macro chat_google_generative_ai_safety_setting}
  const ChatGoogleGenerativeAISafetySetting({
    required this.category,
    required this.threshold,
  });

  /// The category for this setting.
  final ChatGoogleGenerativeAISafetySettingCategory category;

  /// Controls the probability threshold at which harm is blocked.
  final ChatGoogleGenerativeAISafetySettingThreshold threshold;
}

/// Safety settings categorizes.
///
/// Docs: https://ai.google.dev/docs/safety_setting_gemini
enum ChatGoogleGenerativeAISafetySettingCategory {
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
enum ChatGoogleGenerativeAISafetySettingThreshold {
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
