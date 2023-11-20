// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: Options
// ==========================================

/// additional model parameters listed in the documentation for the Modelfile such as temperature
@freezed
class Options with _$Options {
  const Options._();

  /// Factory constructor for Options
  const factory Options({
    /// No Description
    @JsonKey(name: 'num_keep', includeIfNull: false) int? numKeep,

    /// No Description
    @JsonKey(includeIfNull: false) int? seed,

    /// No Description
    @JsonKey(name: 'num_predict', includeIfNull: false) int? numPredict,

    /// No Description
    @JsonKey(name: 'top_k', includeIfNull: false) int? topK,

    /// No Description
    @JsonKey(name: 'top_p', includeIfNull: false) double? topP,

    /// No Description
    @JsonKey(name: 'tfs_z', includeIfNull: false) double? tfsZ,

    /// No Description
    @JsonKey(name: 'typical_p', includeIfNull: false) double? typicalP,

    /// No Description
    @JsonKey(name: 'repeat_last_n', includeIfNull: false) int? repeatLastN,

    /// No Description
    @JsonKey(includeIfNull: false) double? temperature,

    /// No Description
    @JsonKey(name: 'repeat_penalty', includeIfNull: false)
    double? repeatPenalty,

    /// No Description
    @JsonKey(name: 'presence_penalty', includeIfNull: false)
    double? presencePenalty,

    /// No Description
    @JsonKey(name: 'frequency_penalty', includeIfNull: false)
    double? frequencyPenalty,

    /// No Description
    @JsonKey(includeIfNull: false) int? mirostat,

    /// No Description
    @JsonKey(name: 'mirostat_tau', includeIfNull: false) double? mirostatTau,

    /// No Description
    @JsonKey(name: 'mirostat_eta', includeIfNull: false) double? mirostatEta,

    /// No Description
    @JsonKey(name: 'penalize_newline', includeIfNull: false)
    bool? penalizeNewline,

    /// No Description
    @JsonKey(includeIfNull: false) List<String>? stop,

    /// No Description
    @JsonKey(includeIfNull: false) bool? numa,

    /// No Description
    @JsonKey(name: 'num_ctx', includeIfNull: false) int? numCtx,

    /// No Description
    @JsonKey(name: 'num_batch', includeIfNull: false) int? numBatch,

    /// No Description
    @JsonKey(name: 'num_gqa', includeIfNull: false) int? numGqa,

    /// No Description
    @JsonKey(name: 'num_gpu', includeIfNull: false) int? numGpu,

    /// No Description
    @JsonKey(name: 'main_gpu', includeIfNull: false) int? mainGpu,

    /// No Description
    @JsonKey(name: 'low_vram', includeIfNull: false) bool? lowVram,

    /// No Description
    @JsonKey(name: 'f16_kv', includeIfNull: false) bool? f16Kv,

    /// No Description
    @JsonKey(name: 'logits_all', includeIfNull: false) bool? logitsAll,

    /// No Description
    @JsonKey(name: 'vocab_only', includeIfNull: false) bool? vocabOnly,

    /// No Description
    @JsonKey(name: 'use_mmap', includeIfNull: false) bool? useMmap,

    /// No Description
    @JsonKey(name: 'use_mlock', includeIfNull: false) bool? useMlock,

    /// No Description
    @JsonKey(name: 'embedding_only', includeIfNull: false) bool? embeddingOnly,

    /// No Description
    @JsonKey(name: 'rope_frequency_base', includeIfNull: false)
    double? ropeFrequencyBase,

    /// No Description
    @JsonKey(name: 'rope_frequency_scale', includeIfNull: false)
    double? ropeFrequencyScale,

    /// No Description
    @JsonKey(name: 'num_thread', includeIfNull: false) int? numThread,
  }) = _Options;

  /// Object construction from a JSON representation
  factory Options.fromJson(Map<String, dynamic> json) =>
      _$OptionsFromJson(json);

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
