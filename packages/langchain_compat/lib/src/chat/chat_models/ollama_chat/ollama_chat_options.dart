import 'package:meta/meta.dart';

import '../chat_model_options.dart';

/// Options to pass into Ollama.
@immutable
class OllamaChatOptions extends ChatModelOptions {
  /// Creates a new ollama chat options instance.
  const OllamaChatOptions({
    this.format,
    this.keepAlive,
    this.numKeep,
    this.seed,
    this.numPredict,
    this.topK,
    this.topP,
    this.minP,
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
    this.numGpu,
    this.mainGpu,
    this.lowVram,
    this.f16KV,
    this.logitsAll,
    this.vocabOnly,
    this.useMmap,
    this.useMlock,
    this.numThread,
    super.concurrencyLimit,
  });

  /// The format of the response (e.g., 'json', 'text').
  final dynamic format;

  /// How long to keep the model loaded in memory (seconds).
  final int? keepAlive;

  /// Number of tokens to keep from the prompt during context swapping.
  final int? numKeep;

  /// The random seed for reproducibility.
  final int? seed;

  /// Maximum number of tokens to predict in the response.
  final int? numPredict;

  /// Limits the next token selection to the K most likely tokens.
  final int? topK;

  /// Nucleus sampling probability threshold.
  final double? topP;

  /// Minimum probability for nucleus sampling.
  final double? minP;

  /// Tail free sampling parameter.
  final double? tfsZ;

  /// Typical sampling parameter.
  final double? typicalP;

  /// Number of last tokens to consider for repetition penalty.
  final int? repeatLastN;

  /// Sampling temperature.
  final double? temperature;

  /// Penalty for repeating tokens.
  final double? repeatPenalty;

  /// Penalty for presence of tokens.
  final double? presencePenalty;

  /// Penalty for frequency of tokens.
  final double? frequencyPenalty;

  /// Mirostat sampling algorithm version.
  final int? mirostat;

  /// Mirostat target entropy.
  final double? mirostatTau;

  /// Mirostat learning rate.
  final double? mirostatEta;

  /// Whether to penalize newlines.
  final bool? penalizeNewline;

  /// List of stop sequences.
  final List<String>? stop;

  /// Whether to use NUMA optimizations.
  final bool? numa;

  /// Context window size (number of tokens).
  final int? numCtx;

  /// Batch size for prompt processing.
  final int? numBatch;

  /// Number of GPUs to use.
  final int? numGpu;

  /// Index of the main GPU to use.
  final int? mainGpu;

  /// Whether to use low VRAM mode.
  final bool? lowVram;

  /// Whether to use 16-bit key-value cache.
  final bool? f16KV;

  /// Whether to return logits for all tokens.
  final bool? logitsAll;

  /// Whether to restrict to vocabulary only.
  final bool? vocabOnly;

  /// Whether to use memory-mapped files.
  final bool? useMmap;

  /// Whether to use memory locking.
  final bool? useMlock;

  /// Number of CPU threads to use.
  final int? numThread;

  @override
  OllamaChatOptions copyWith({
    dynamic format,
    int? keepAlive,
    int? numKeep,
    int? seed,
    int? numPredict,
    int? topK,
    double? topP,
    double? minP,
    double? tfsZ,
    double? typicalP,
    int? repeatLastN,
    double? temperature,
    double? repeatPenalty,
    double? presencePenalty,
    double? frequencyPenalty,
    int? mirostat,
    double? mirostatTau,
    double? mirostatEta,
    bool? penalizeNewline,
    List<String>? stop,
    bool? numa,
    int? numCtx,
    int? numBatch,
    int? numGpu,
    int? mainGpu,
    bool? lowVram,
    bool? f16KV,
    bool? logitsAll,
    bool? vocabOnly,
    bool? useMmap,
    bool? useMlock,
    int? numThread,
    int? concurrencyLimit,
  }) => OllamaChatOptions(
    format: format ?? this.format,
    keepAlive: keepAlive ?? this.keepAlive,
    numKeep: numKeep ?? this.numKeep,
    seed: seed ?? this.seed,
    numPredict: numPredict ?? this.numPredict,
    topK: topK ?? this.topK,
    topP: topP ?? this.topP,
    minP: minP ?? this.minP,
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
    numGpu: numGpu ?? this.numGpu,
    mainGpu: mainGpu ?? this.mainGpu,
    lowVram: lowVram ?? this.lowVram,
    f16KV: f16KV ?? this.f16KV,
    logitsAll: logitsAll ?? this.logitsAll,
    vocabOnly: vocabOnly ?? this.vocabOnly,
    useMmap: useMmap ?? this.useMmap,
    useMlock: useMlock ?? this.useMlock,
    numThread: numThread ?? this.numThread,
    concurrencyLimit: concurrencyLimit ?? this.concurrencyLimit,
  );
}
