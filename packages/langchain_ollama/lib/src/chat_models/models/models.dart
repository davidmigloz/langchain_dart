import 'package:langchain/langchain.dart';

import '../../llms/models/models.dart';

/// {@template chat_ollama_options}
/// Options to pass into ChatOllama.
/// {@endtemplate}
class ChatOllamaOptions extends ChatModelOptions implements OllamaOptions {
  /// {@macro chat_ollama_options}
  const ChatOllamaOptions({
    this.model = 'llama2',
    this.system,
    this.template,
    this.context,
    this.format,
    this.raw,
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

  @override
  final String model;

  @override
  final String? system;

  @override
  final String? template;

  @override
  final List<int>? context;

  @override
  final OllamaResponseFormat? format;

  @override
  final bool? raw;

  @override
  final int? numKeep;

  @override
  final int? seed;

  @override
  final int? numPredict;

  @override
  final int? topK;

  @override
  final double? topP;

  @override
  final double? tfsZ;

  @override
  final double? typicalP;

  @override
  final int? repeatLastN;

  @override
  final double? temperature;

  @override
  final double? repeatPenalty;

  @override
  final double? presencePenalty;

  @override
  final double? frequencyPenalty;

  @override
  final int? mirostat;

  @override
  final double? mirostatTau;

  @override
  final double? mirostatEta;

  @override
  final bool? penalizeNewline;

  @override
  final List<String>? stop;

  @override
  final bool? numa;

  @override
  final int? numCtx;

  @override
  final int? numBatch;

  @override
  final int? numGqa;

  @override
  final int? numGpu;

  @override
  final int? mainGpu;

  @override
  final bool? lowVram;

  @override
  final bool? f16KV;

  @override
  final bool? logitsAll;

  @override
  final bool? vocabOnly;

  @override
  final bool? useMmap;

  @override
  final bool? useMlock;

  @override
  final bool? embeddingOnly;

  @override
  final double? ropeFrequencyBase;

  @override
  final double? ropeFrequencyScale;

  @override
  final int? numThread;
}
