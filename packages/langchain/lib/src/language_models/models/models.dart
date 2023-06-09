/// Result returned by the model.
class LanguageModelResult<G> {
  const LanguageModelResult({
    required this.generations,
    this.tokensUsage,
    this.modelOutput,
  });

  /// Generated outputs.
  final List<G> generations;

  /// The total number of tokens used for the generation.
  final int? tokensUsage;

  /// For arbitrary model provider specific output.
  final Map<String, dynamic>? modelOutput;
}

/// Output of a single generation.
abstract class LanguageModelGeneration<O> {
  const LanguageModelGeneration(
    this.output, {
    this.generationInfo,
  });

  /// Generated output.
  final O output;

  /// Raw generation info response from the provider.
  /// May include things like reason for finishing.
  final Map<String, dynamic>? generationInfo;
}
