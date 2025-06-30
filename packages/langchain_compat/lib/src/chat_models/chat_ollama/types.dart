// ignore_for_file: public_member_api_docs

import 'package:meta/meta.dart';

import '../../../chat_models.dart';
import '../../../tools.dart';

/// {@template chat_ollama_options}
/// Options to pass into ChatOllama.
///
/// For a complete list of supported models and model variants, see the
/// [Ollama model library](https://ollama.ai/library).
/// {@endtemplate}
@immutable
class ChatOllamaOptions extends ChatModelOptions {
  /// {@macro chat_ollama_options}
  const ChatOllamaOptions({
    super.model,
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
    super.tools,
    super.toolChoice,
    super.concurrencyLimit,
  });

  final dynamic format;
  final int? keepAlive;
  final int? numKeep;
  final int? seed;
  final int? numPredict;
  final int? topK;
  final double? topP;
  final double? minP;
  final double? tfsZ;
  final double? typicalP;
  final int? repeatLastN;
  final double? temperature;
  final double? repeatPenalty;
  final double? presencePenalty;
  final double? frequencyPenalty;
  final int? mirostat;
  final double? mirostatTau;
  final double? mirostatEta;
  final bool? penalizeNewline;
  final List<String>? stop;
  final bool? numa;
  final int? numCtx;
  final int? numBatch;
  final int? numGpu;
  final int? mainGpu;
  final bool? lowVram;
  final bool? f16KV;
  final bool? logitsAll;
  final bool? vocabOnly;
  final bool? useMmap;
  final bool? useMlock;
  final int? numThread;

  @override
  ChatOllamaOptions copyWith({
    String? model,
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
    List<ToolSpec>? tools,
    dynamic toolChoice,
    int? concurrencyLimit,
  }) => ChatOllamaOptions(
    model: model ?? this.model,
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
    tools: tools ?? this.tools,
    toolChoice: toolChoice ?? this.toolChoice,
    concurrencyLimit: concurrencyLimit ?? this.concurrencyLimit,
  );
}
