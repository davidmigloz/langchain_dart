import 'package:langchain/langchain.dart';

import '../../llms/models/models.dart';

/// {@template chat_ollama_options}
/// Options to pass into ChatOllama.
/// {@endtemplate}
class ChatOllamaOptions extends ChatModelOptions {
  /// {@macro chat_ollama_options}
  const ChatOllamaOptions({
    this.model = 'llama2',
    this.format,
    this.numKeep,
    this.seed,
    this.numPredict,
    this.topK,
    this.topP,
    this.tfsZ,
    this.typicalP,
    this.repeatLastN,
    this.temperature,
    this.repeatPenalty,
    this.presencePenalty,
    this.frequencyPenalty,
    this.mirostat,
    this.mirostatTau,
    this.mirostatEta,
    this.penalizeNewline,
    this.stop,
    this.numa,
    this.numCtx,
    this.numBatch,
    this.numGqa,
    this.numGpu,
    this.mainGpu,
    this.lowVram,
    this.f16KV,
    this.logitsAll,
    this.vocabOnly,
    this.useMmap,
    this.useMlock,
    this.embeddingOnly,
    this.ropeFrequencyBase,
    this.ropeFrequencyScale,
    this.numThread,
  });

  /// The model used to generate completions
  final String? model;

  /// The format to return a response in. Currently the only accepted value is
  /// json.
  ///
  /// Enable JSON mode by setting the format parameter to json. This will
  /// structure the response as valid JSON.
  ///
  /// Note: it's important to instruct the model to use JSON in the prompt.
  /// Otherwise, the model may generate large amounts whitespace.
  final OllamaResponseFormat? format;

  /// Number of tokens to keep from the prompt.
  /// (Default: 0)
  final int? numKeep;

  /// Sets the random number seed to use for generation. Setting this to a
  /// specific number will make the model generate the same text for the same
  /// prompt.
  /// (Default: 0)
  final int? seed;

  /// Maximum number of tokens to predict when generating text.
  /// (Default: 128, -1 = infinite generation, -2 = fill context)
  final int? numPredict;

  /// Reduces the probability of generating nonsense. A higher value (e.g. 100)
  /// will give more diverse answers, while a lower value (e.g. 10) will be
  /// more conservative.
  /// (Default: 40)
  final int? topK;

  /// Works together with top-k. A higher value (e.g., 0.95) will lead to more
  /// diverse text, while a lower value (e.g., 0.5) will generate more focused
  /// and conservative text.
  /// (Default: 0.9)
  final double? topP;

  /// Tail free sampling is used to reduce the impact of less probable tokens
  /// from the output. A higher value (e.g., 2.0) will reduce the impact more,
  /// while a value of 1.0 disables this setting.
  /// (default: 1)
  final double? tfsZ;

  /// Typical p is used to reduce the impact of less probable tokens from the
  /// output.
  /// (Default: 1.0)
  final double? typicalP;

  /// Sets how far back for the model to look back to prevent repetition.
  /// (Default: 64, 0 = disabled, -1 = num_ctx)
  final int? repeatLastN;

  /// The temperature of the model. Increasing the temperature will make the
  /// model answer more creatively.
  /// (Default: 0.8)
  final double? temperature;

  /// Sets how strongly to penalize repetitions. A higher value (e.g., 1.5)
  /// will penalize repetitions more strongly, while a lower value (e.g., 0.9)
  /// will be more lenient.
  /// (Default: 1.1)
  final double? repeatPenalty;

  /// Positive values penalize new tokens based on whether they appear in the
  /// text so far, increasing the model's likelihood to talk about new topics.
  final double? presencePenalty;

  /// Positive values penalize new tokens based on their existing frequency in
  /// the text so far, decreasing the model's likelihood to repeat the same
  /// line verbatim.
  final double? frequencyPenalty;

  /// Enable Mirostat sampling for controlling perplexity.
  /// (default: 0, 0 = disabled, 1 = Mirostat, 2 = Mirostat 2.0)
  final int? mirostat;

  /// Controls the balance between coherence and diversity of the output. A
  /// lower value will result in more focused and coherent text.
  /// (Default: 5.0)
  final double? mirostatTau;

  /// Influences how quickly the algorithm responds to feedback from the
  /// generated text. A lower learning rate will result in slower adjustments,
  /// while a higher learning rate will make the algorithm more responsive.
  /// (Default: 0.1)
  final double? mirostatEta;

  /// Penalize newlines in the output.
  /// (Default: false)
  final bool? penalizeNewline;

  /// Sequences where the API will stop generating further tokens. The returned
  /// text will not contain the stop sequence.
  final List<String>? stop;

  /// Enable NUMA support.
  /// (Default: false)
  final bool? numa;

  /// Sets the size of the context window used to generate the next token.
  final int? numCtx;

  /// Sets the number of batches to use for generation.
  /// (Default: 1)
  final int? numBatch;

  /// The number of GQA groups in the transformer layer. Required for some
  /// models, for example it is 8 for `llama2:70b`.
  final int? numGqa;

  /// The number of layers to send to the GPU(s). On macOS it defaults to 1 to
  /// enable metal support, 0 to disable.
  final int? numGpu;

  /// The GPU to use for the main model.
  /// (Default: 0)
  final int? mainGpu;

  /// Enable low VRAM mode.
  /// (Default: false)
  final bool? lowVram;

  /// Enable f16 key/value.
  /// (Default: false)
  final bool? f16KV;

  /// Enable logits all.
  /// (Default: false)
  final bool? logitsAll;

  /// Enable vocab only.
  /// (Default: false)
  final bool? vocabOnly;

  /// Enable mmap.
  /// (Default: false)
  final bool? useMmap;

  /// Enable mlock.
  /// (Default: false)
  final bool? useMlock;

  /// Enable embedding only.
  /// (Default: false)
  final bool? embeddingOnly;

  /// The base of the rope frequency scale.
  /// (Default: 1.0)
  final double? ropeFrequencyBase;

  /// The scale of the rope frequency.
  /// (Default: 1.0)
  final double? ropeFrequencyScale;

  /// Sets the number of threads to use during computation. By default, Ollama
  /// will detect this for optimal performance. It is recommended to set this
  /// value to the number of physical CPU cores your system has (as opposed to
  /// the logical number of cores).
  final int? numThread;

  /// Creates a copy of this [ChatOllamaOptions] object with the given fields
  /// replaced with the new values.
  ChatOllamaOptions copyWith({
    final String? model,
    final OllamaResponseFormat? format,
    final int? numKeep,
    final int? seed,
    final int? numPredict,
    final int? topK,
    final double? topP,
    final double? tfsZ,
    final double? typicalP,
    final int? repeatLastN,
    final double? temperature,
    final double? repeatPenalty,
    final double? presencePenalty,
    final double? frequencyPenalty,
    final int? mirostat,
    final double? mirostatTau,
    final double? mirostatEta,
    final bool? penalizeNewline,
    final List<String>? stop,
    final bool? numa,
    final int? numCtx,
    final int? numBatch,
    final int? numGqa,
    final int? numGpu,
    final int? mainGpu,
    final bool? lowVram,
    final bool? f16KV,
    final bool? logitsAll,
    final bool? vocabOnly,
    final bool? useMmap,
    final bool? useMlock,
    final bool? embeddingOnly,
    final double? ropeFrequencyBase,
    final double? ropeFrequencyScale,
    final int? numThread,
  }) {
    return ChatOllamaOptions(
      model: model ?? this.model,
      format: format ?? this.format,
      numKeep: numKeep ?? this.numKeep,
      seed: seed ?? this.seed,
      numPredict: numPredict ?? this.numPredict,
      topK: topK ?? this.topK,
      topP: topP ?? this.topP,
      tfsZ: tfsZ ?? this.tfsZ,
      typicalP: typicalP ?? this.typicalP,
      repeatLastN: repeatLastN ?? this.repeatLastN,
      temperature: temperature ?? this.temperature,
      repeatPenalty: repeatPenalty ?? this.repeatPenalty,
      presencePenalty: presencePenalty ?? this.presencePenalty,
      frequencyPenalty: frequencyPenalty ?? this.frequencyPenalty,
      mirostat: mirostat ?? this.mirostat,
      mirostatTau: mirostatTau ?? this.mirostatTau,
      mirostatEta: mirostatEta ?? this.mirostatEta,
      penalizeNewline: penalizeNewline ?? this.penalizeNewline,
      stop: stop ?? this.stop,
      numa: numa ?? this.numa,
      numCtx: numCtx ?? this.numCtx,
      numBatch: numBatch ?? this.numBatch,
      numGqa: numGqa ?? this.numGqa,
      numGpu: numGpu ?? this.numGpu,
      mainGpu: mainGpu ?? this.mainGpu,
      lowVram: lowVram ?? this.lowVram,
      f16KV: f16KV ?? this.f16KV,
      logitsAll: logitsAll ?? this.logitsAll,
      vocabOnly: vocabOnly ?? this.vocabOnly,
      useMmap: useMmap ?? this.useMmap,
      useMlock: useMlock ?? this.useMlock,
      embeddingOnly: embeddingOnly ?? this.embeddingOnly,
      ropeFrequencyBase: ropeFrequencyBase ?? this.ropeFrequencyBase,
      ropeFrequencyScale: ropeFrequencyScale ?? this.ropeFrequencyScale,
      numThread: numThread ?? this.numThread,
    );
  }
}
