// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: RequestOptions
// ==========================================

/// Additional model parameters listed in the documentation for the Modelfile such as `temperature`.
@freezed
class RequestOptions with _$RequestOptions {
  const RequestOptions._();

  /// Factory constructor for RequestOptions
  const factory RequestOptions({
    /// Number of tokens to keep from the prompt.
    @JsonKey(name: 'num_keep', includeIfNull: false) int? numKeep,

    /// Sets the random number seed to use for generation. Setting this to a specific number will make the model generate the same text for the same prompt. (Default: 0)
    @JsonKey(includeIfNull: false) int? seed,

    /// Maximum number of tokens to predict when generating text. (Default: 128, -1 = infinite generation, -2 = fill context)
    @JsonKey(name: 'num_predict', includeIfNull: false) int? numPredict,

    /// Reduces the probability of generating nonsense. A higher value (e.g. 100) will give more diverse answers, while a lower value (e.g. 10) will be more conservative. (Default: 40)
    @JsonKey(name: 'top_k', includeIfNull: false) int? topK,

    /// Works together with top-k. A higher value (e.g., 0.95) will lead to more diverse text, while a lower value (e.g., 0.5) will generate more focused and conservative text. (Default: 0.9)
    @JsonKey(name: 'top_p', includeIfNull: false) double? topP,

    /// Tail free sampling is used to reduce the impact of less probable tokens from the output. A higher value (e.g., 2.0) will reduce the impact more, while a value of 1.0 disables this setting. (default: 1)
    @JsonKey(name: 'tfs_z', includeIfNull: false) double? tfsZ,

    /// Typical p is used to reduce the impact of less probable tokens from the output.
    @JsonKey(name: 'typical_p', includeIfNull: false) double? typicalP,

    /// Sets how far back for the model to look back to prevent repetition. (Default: 64, 0 = disabled, -1 = num_ctx)
    @JsonKey(name: 'repeat_last_n', includeIfNull: false) int? repeatLastN,

    /// The temperature of the model. Increasing the temperature will make the model answer more creatively. (Default: 0.8)
    @JsonKey(includeIfNull: false) double? temperature,

    /// Sets how strongly to penalize repetitions. A higher value (e.g., 1.5) will penalize repetitions more strongly, while a lower value (e.g., 0.9) will be more lenient. (Default: 1.1)
    @JsonKey(name: 'repeat_penalty', includeIfNull: false)
    double? repeatPenalty,

    /// Positive values penalize new tokens based on whether they appear in the text so far, increasing the model's likelihood to talk about new topics.
    @JsonKey(name: 'presence_penalty', includeIfNull: false)
    double? presencePenalty,

    /// Positive values penalize new tokens based on their existing frequency in the text so far, decreasing the model's likelihood to repeat the same line verbatim.
    @JsonKey(name: 'frequency_penalty', includeIfNull: false)
    double? frequencyPenalty,

    /// Enable Mirostat sampling for controlling perplexity. (default: 0, 0 = disabled, 1 = Mirostat, 2 = Mirostat 2.0)
    @JsonKey(includeIfNull: false) int? mirostat,

    /// Controls the balance between coherence and diversity of the output. A lower value will result in more focused and coherent text. (Default: 5.0)
    @JsonKey(name: 'mirostat_tau', includeIfNull: false) double? mirostatTau,

    /// Influences how quickly the algorithm responds to feedback from the generated text. A lower learning rate will result in slower adjustments, while a higher learning rate will make the algorithm more responsive. (Default: 0.1)
    @JsonKey(name: 'mirostat_eta', includeIfNull: false) double? mirostatEta,

    /// Penalize newlines in the output. (Default: false)
    @JsonKey(name: 'penalize_newline', includeIfNull: false)
    bool? penalizeNewline,

    /// Sequences where the API will stop generating further tokens. The returned text will not contain the stop sequence.
    @JsonKey(includeIfNull: false) List<String>? stop,

    /// Enable NUMA support. (Default: false)
    @JsonKey(includeIfNull: false) bool? numa,

    /// Sets the size of the context window used to generate the next token.
    @JsonKey(name: 'num_ctx', includeIfNull: false) int? numCtx,

    /// Sets the number of batches to use for generation. (Default: 1)
    @JsonKey(name: 'num_batch', includeIfNull: false) int? numBatch,

    /// The number of GQA groups in the transformer layer. Required for some models, for example it is 8 for `llama2:70b`.
    @JsonKey(name: 'num_gqa', includeIfNull: false) int? numGqa,

    /// The number of layers to send to the GPU(s). On macOS it defaults to 1 to enable metal support, 0 to disable.
    @JsonKey(name: 'num_gpu', includeIfNull: false) int? numGpu,

    /// The GPU to use for the main model. Default is 0.
    @JsonKey(name: 'main_gpu', includeIfNull: false) int? mainGpu,

    /// Enable low VRAM mode. (Default: false)
    @JsonKey(name: 'low_vram', includeIfNull: false) bool? lowVram,

    /// Enable f16 key/value. (Default: false)
    @JsonKey(name: 'f16_kv', includeIfNull: false) bool? f16Kv,

    /// Enable logits all. (Default: false)
    @JsonKey(name: 'logits_all', includeIfNull: false) bool? logitsAll,

    /// Enable vocab only. (Default: false)
    @JsonKey(name: 'vocab_only', includeIfNull: false) bool? vocabOnly,

    /// Enable mmap. (Default: false)
    @JsonKey(name: 'use_mmap', includeIfNull: false) bool? useMmap,

    /// Enable mlock. (Default: false)
    @JsonKey(name: 'use_mlock', includeIfNull: false) bool? useMlock,

    /// Enable embedding only. (Default: false)
    @JsonKey(name: 'embedding_only', includeIfNull: false) bool? embeddingOnly,

    /// The base of the rope frequency scale. (Default: 1.0)
    @JsonKey(name: 'rope_frequency_base', includeIfNull: false)
    double? ropeFrequencyBase,

    /// The scale of the rope frequency. (Default: 1.0)
    @JsonKey(name: 'rope_frequency_scale', includeIfNull: false)
    double? ropeFrequencyScale,

    /// Sets the number of threads to use during computation. By default, Ollama will detect this for optimal performance. It is recommended to set this value to the number of physical CPU cores your system has (as opposed to the logical number of cores).
    @JsonKey(name: 'num_thread', includeIfNull: false) int? numThread,
  }) = _RequestOptions;

  /// Object construction from a JSON representation
  factory RequestOptions.fromJson(Map<String, dynamic> json) =>
      _$RequestOptionsFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'num_keep',
    'seed',
    'num_predict',
    'top_k',
    'top_p',
    'tfs_z',
    'typical_p',
    'repeat_last_n',
    'temperature',
    'repeat_penalty',
    'presence_penalty',
    'frequency_penalty',
    'mirostat',
    'mirostat_tau',
    'mirostat_eta',
    'penalize_newline',
    'stop',
    'numa',
    'num_ctx',
    'num_batch',
    'num_gqa',
    'num_gpu',
    'main_gpu',
    'low_vram',
    'f16_kv',
    'logits_all',
    'vocab_only',
    'use_mmap',
    'use_mlock',
    'embedding_only',
    'rope_frequency_base',
    'rope_frequency_scale',
    'num_thread'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'num_keep': numKeep,
      'seed': seed,
      'num_predict': numPredict,
      'top_k': topK,
      'top_p': topP,
      'tfs_z': tfsZ,
      'typical_p': typicalP,
      'repeat_last_n': repeatLastN,
      'temperature': temperature,
      'repeat_penalty': repeatPenalty,
      'presence_penalty': presencePenalty,
      'frequency_penalty': frequencyPenalty,
      'mirostat': mirostat,
      'mirostat_tau': mirostatTau,
      'mirostat_eta': mirostatEta,
      'penalize_newline': penalizeNewline,
      'stop': stop,
      'numa': numa,
      'num_ctx': numCtx,
      'num_batch': numBatch,
      'num_gqa': numGqa,
      'num_gpu': numGpu,
      'main_gpu': mainGpu,
      'low_vram': lowVram,
      'f16_kv': f16Kv,
      'logits_all': logitsAll,
      'vocab_only': vocabOnly,
      'use_mmap': useMmap,
      'use_mlock': useMlock,
      'embedding_only': embeddingOnly,
      'rope_frequency_base': ropeFrequencyBase,
      'rope_frequency_scale': ropeFrequencyScale,
      'num_thread': numThread,
    };
  }
}
