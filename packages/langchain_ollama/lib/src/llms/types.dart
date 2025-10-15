import 'package:collection/collection.dart';
import 'package:langchain_core/llms.dart';
import 'package:meta/meta.dart';

/// {@template ollama_options}
/// Options to pass into the Ollama LLM.
///
/// For a complete list of supported models and model variants, see the
/// [Ollama model library](https://ollama.ai/library).
/// {@endtemplate}
@immutable
class OllamaOptions extends LLMOptions {
  /// {@macro ollama_options}
  const OllamaOptions({
    super.model,
    this.system,
    this.suffix,
    this.template,
    this.context,
    this.format,
    this.raw,
    this.keepAlive,
    this.think,
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

  /// The system prompt (Overrides what is defined in the Modelfile).
  final String? system;

  /// The text that comes after the inserted text.
  final String? suffix;

  /// The full prompt or prompt template (overrides what is defined in the
  /// Modelfile).
  final String? template;

  /// The context parameter returned from a previous request to
  /// [generateCompletion], this can be used to keep a short conversational
  /// memory.
  final List<int>? context;

  /// The format to return a response in. Currently the only accepted value is
  /// json.
  ///
  /// Enable JSON mode by setting the format parameter to json. This will
  /// structure the response as valid JSON.
  ///
  /// Note: it's important to instruct the model to use JSON in the prompt.
  /// Otherwise, the model may generate large amounts whitespace.
  final OllamaResponseFormat? format;

  /// If `true` no formatting will be applied to the prompt and no context will
  /// be returned.
  ///
  /// You may choose to use the `raw` parameter if you are specifying a full
  /// templated prompt in your request to the API, and are managing history
  /// yourself.
  final bool? raw;

  /// How long (in minutes) to keep the model loaded in memory.
  ///
  /// - If set to a positive duration (e.g. 20), the model will stay loaded for the provided duration.
  /// - If set to a negative duration (e.g. -1), the model will stay loaded indefinitely.
  /// - If set to 0, the model will be unloaded immediately once finished.
  /// - If not set, the model will stay loaded for 5 minutes by default
  final int? keepAlive;

  /// Controls whether thinking/reasoning models will think before responding.
  ///
  /// Can be set to a [OllamaThinkingLevel] to control the intensity level:
  /// - [OllamaThinkingLevel.high]: Maximum reasoning depth
  /// - [OllamaThinkingLevel.medium]: Balanced reasoning
  /// - [OllamaThinkingLevel.low]: Minimal reasoning
  final OllamaThinkingLevel? think;

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

  /// Works together with [topK]. A higher value (e.g., 0.95) will lead to more
  /// diverse text, while a lower value (e.g., 0.5) will generate more focused
  /// and conservative text.
  /// (Default: 0.9)
  final double? topP;

  /// Alternative to the [topP], and aims to ensure a balance of quality and
  /// variety. [minP] represents the minimum probability for a token to be
  /// considered, relative to the probability of the most likely token. For
  /// example, with min_p=0.05 and the most likely token having a probability
  /// of 0.9, logits with a value less than 0.05*0.9=0.045 are filtered out.
  /// (Default: 0.0)
  final double? minP;

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

  /// Sets the number of threads to use during computation. By default, Ollama
  /// will detect this for optimal performance. It is recommended to set this
  /// value to the number of physical CPU cores your system has (as opposed to
  /// the logical number of cores).
  final int? numThread;

  @override
  OllamaOptions copyWith({
    final String? model,
    final String? system,
    final String? suffix,
    final String? template,
    final List<int>? context,
    final OllamaResponseFormat? format,
    final bool? raw,
    final int? keepAlive,
    final OllamaThinkingLevel? think,
    final int? numKeep,
    final int? seed,
    final int? numPredict,
    final int? topK,
    final double? topP,
    final double? minP,
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
    final int? numGpu,
    final int? mainGpu,
    final bool? lowVram,
    final bool? f16KV,
    final bool? logitsAll,
    final bool? vocabOnly,
    final bool? useMmap,
    final bool? useMlock,
    final int? numThread,
    final int? concurrencyLimit,
  }) {
    return OllamaOptions(
      model: model ?? this.model,
      system: system ?? this.system,
      suffix: suffix ?? this.suffix,
      template: template ?? this.template,
      context: context ?? this.context,
      format: format ?? this.format,
      raw: raw ?? this.raw,
      keepAlive: keepAlive ?? this.keepAlive,
      think: think ?? this.think,
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
      concurrencyLimit: concurrencyLimit ?? super.concurrencyLimit,
    );
  }

  @override
  OllamaOptions merge(covariant final OllamaOptions? other) {
    return copyWith(
      model: other?.model,
      system: other?.system,
      suffix: other?.suffix,
      template: other?.template,
      context: other?.context,
      format: other?.format,
      raw: other?.raw,
      keepAlive: other?.keepAlive,
      think: other?.think,
      numKeep: other?.numKeep,
      seed: other?.seed,
      numPredict: other?.numPredict,
      topK: other?.topK,
      topP: other?.topP,
      minP: other?.minP,
      tfsZ: other?.tfsZ,
      typicalP: other?.typicalP,
      repeatLastN: other?.repeatLastN,
      temperature: other?.temperature,
      repeatPenalty: other?.repeatPenalty,
      presencePenalty: other?.presencePenalty,
      frequencyPenalty: other?.frequencyPenalty,
      mirostat: other?.mirostat,
      mirostatTau: other?.mirostatTau,
      mirostatEta: other?.mirostatEta,
      penalizeNewline: other?.penalizeNewline,
      stop: other?.stop,
      numa: other?.numa,
      numCtx: other?.numCtx,
      numBatch: other?.numBatch,
      numGpu: other?.numGpu,
      mainGpu: other?.mainGpu,
      lowVram: other?.lowVram,
      f16KV: other?.f16KV,
      logitsAll: other?.logitsAll,
      vocabOnly: other?.vocabOnly,
      useMmap: other?.useMmap,
      useMlock: other?.useMlock,
      numThread: other?.numThread,
      concurrencyLimit: other?.concurrencyLimit,
    );
  }

  @override
  bool operator ==(covariant final OllamaOptions other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            model == other.model &&
            system == other.system &&
            suffix == other.suffix &&
            template == other.template &&
            const ListEquality<int>().equals(context, other.context) &&
            format == other.format &&
            raw == other.raw &&
            keepAlive == other.keepAlive &&
            think == other.think &&
            numKeep == other.numKeep &&
            seed == other.seed &&
            numPredict == other.numPredict &&
            topK == other.topK &&
            topP == other.topP &&
            minP == other.minP &&
            tfsZ == other.tfsZ &&
            typicalP == other.typicalP &&
            repeatLastN == other.repeatLastN &&
            temperature == other.temperature &&
            repeatPenalty == other.repeatPenalty &&
            presencePenalty == other.presencePenalty &&
            frequencyPenalty == other.frequencyPenalty &&
            mirostat == other.mirostat &&
            mirostatTau == other.mirostatTau &&
            mirostatEta == other.mirostatEta &&
            penalizeNewline == other.penalizeNewline &&
            const ListEquality<String>().equals(stop, other.stop) &&
            numa == other.numa &&
            numCtx == other.numCtx &&
            numBatch == other.numBatch &&
            numGpu == other.numGpu &&
            mainGpu == other.mainGpu &&
            lowVram == other.lowVram &&
            f16KV == other.f16KV &&
            logitsAll == other.logitsAll &&
            vocabOnly == other.vocabOnly &&
            useMmap == other.useMmap &&
            useMlock == other.useMlock &&
            numThread == other.numThread &&
            concurrencyLimit == other.concurrencyLimit;
  }

  @override
  int get hashCode {
    return model.hashCode ^
        system.hashCode ^
        suffix.hashCode ^
        template.hashCode ^
        const ListEquality<int>().hash(context) ^
        format.hashCode ^
        raw.hashCode ^
        keepAlive.hashCode ^
        think.hashCode ^
        numKeep.hashCode ^
        seed.hashCode ^
        numPredict.hashCode ^
        topK.hashCode ^
        topP.hashCode ^
        minP.hashCode ^
        tfsZ.hashCode ^
        typicalP.hashCode ^
        repeatLastN.hashCode ^
        temperature.hashCode ^
        repeatPenalty.hashCode ^
        presencePenalty.hashCode ^
        frequencyPenalty.hashCode ^
        mirostat.hashCode ^
        mirostatTau.hashCode ^
        mirostatEta.hashCode ^
        penalizeNewline.hashCode ^
        const ListEquality<String>().hash(stop) ^
        numa.hashCode ^
        numCtx.hashCode ^
        numBatch.hashCode ^
        numGpu.hashCode ^
        mainGpu.hashCode ^
        lowVram.hashCode ^
        f16KV.hashCode ^
        logitsAll.hashCode ^
        vocabOnly.hashCode ^
        useMmap.hashCode ^
        useMlock.hashCode ^
        numThread.hashCode ^
        concurrencyLimit.hashCode;
  }
}

/// The format to return a response in.
///
/// Currently the only accepted value is json.
enum OllamaResponseFormat {
  /// Enable JSON mode by setting the format parameter to json. This will
  /// structure the response as valid JSON.
  ///
  /// Note: it's important to instruct the model to use JSON in the prompt.
  /// Otherwise, the model may generate large amounts whitespace.
  json,
}

/// The thinking intensity level for reasoning models.
enum OllamaThinkingLevel {
  /// High thinking intensity - maximum reasoning depth
  high,

  /// Medium thinking intensity - balanced reasoning
  medium,

  /// Low thinking intensity - minimal reasoning
  low,
}
