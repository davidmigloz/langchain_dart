import '../copy_with_sentinel.dart';

/// Configuration options for model generation.
class GenerationConfig {
  /// Number of generated responses to return.
  final int? candidateCount;

  /// Stop sequences.
  final List<String>? stopSequences;

  /// Maximum number of tokens to generate.
  final int? maxOutputTokens;

  /// Controls randomness (0.0 to 2.0).
  final double? temperature;

  /// Top-p sampling (0.0 to 1.0).
  final double? topP;

  /// Top-k sampling.
  final int? topK;

  /// Presence penalty.
  final double? presencePenalty;

  /// Frequency penalty.
  final double? frequencyPenalty;

  /// Response MIME type.
  final String? responseMimeType;

  /// Response schema (for structured output).
  final Map<String, dynamic>? responseSchema;

  /// Creates a [GenerationConfig].
  const GenerationConfig({
    this.candidateCount,
    this.stopSequences,
    this.maxOutputTokens,
    this.temperature,
    this.topP,
    this.topK,
    this.presencePenalty,
    this.frequencyPenalty,
    this.responseMimeType,
    this.responseSchema,
  });

  /// Creates a [GenerationConfig] from JSON.
  factory GenerationConfig.fromJson(Map<String, dynamic> json) =>
      GenerationConfig(
        candidateCount: json['candidateCount'] as int?,
        stopSequences: (json['stopSequences'] as List?)?.cast<String>(),
        maxOutputTokens: json['maxOutputTokens'] as int?,
        temperature: (json['temperature'] as num?)?.toDouble(),
        topP: (json['topP'] as num?)?.toDouble(),
        topK: json['topK'] as int?,
        presencePenalty: (json['presencePenalty'] as num?)?.toDouble(),
        frequencyPenalty: (json['frequencyPenalty'] as num?)?.toDouble(),
        responseMimeType: json['responseMimeType'] as String?,
        responseSchema: json['responseSchema'] as Map<String, dynamic>?,
      );

  /// Converts to JSON.
  Map<String, dynamic> toJson() => {
    if (candidateCount != null) 'candidateCount': candidateCount,
    if (stopSequences != null) 'stopSequences': stopSequences,
    if (maxOutputTokens != null) 'maxOutputTokens': maxOutputTokens,
    if (temperature != null) 'temperature': temperature,
    if (topP != null) 'topP': topP,
    if (topK != null) 'topK': topK,
    if (presencePenalty != null) 'presencePenalty': presencePenalty,
    if (frequencyPenalty != null) 'frequencyPenalty': frequencyPenalty,
    if (responseMimeType != null) 'responseMimeType': responseMimeType,
    if (responseSchema != null) 'responseSchema': responseSchema,
  };

  /// Creates a copy with replaced values.
  GenerationConfig copyWith({
    Object? candidateCount = unsetCopyWithValue,
    Object? stopSequences = unsetCopyWithValue,
    Object? maxOutputTokens = unsetCopyWithValue,
    Object? temperature = unsetCopyWithValue,
    Object? topP = unsetCopyWithValue,
    Object? topK = unsetCopyWithValue,
    Object? presencePenalty = unsetCopyWithValue,
    Object? frequencyPenalty = unsetCopyWithValue,
    Object? responseMimeType = unsetCopyWithValue,
    Object? responseSchema = unsetCopyWithValue,
  }) {
    return GenerationConfig(
      candidateCount: candidateCount == unsetCopyWithValue
          ? this.candidateCount
          : candidateCount as int?,
      stopSequences: stopSequences == unsetCopyWithValue
          ? this.stopSequences
          : stopSequences as List<String>?,
      maxOutputTokens: maxOutputTokens == unsetCopyWithValue
          ? this.maxOutputTokens
          : maxOutputTokens as int?,
      temperature: temperature == unsetCopyWithValue
          ? this.temperature
          : temperature as double?,
      topP: topP == unsetCopyWithValue ? this.topP : topP as double?,
      topK: topK == unsetCopyWithValue ? this.topK : topK as int?,
      presencePenalty: presencePenalty == unsetCopyWithValue
          ? this.presencePenalty
          : presencePenalty as double?,
      frequencyPenalty: frequencyPenalty == unsetCopyWithValue
          ? this.frequencyPenalty
          : frequencyPenalty as double?,
      responseMimeType: responseMimeType == unsetCopyWithValue
          ? this.responseMimeType
          : responseMimeType as String?,
      responseSchema: responseSchema == unsetCopyWithValue
          ? this.responseSchema
          : responseSchema as Map<String, dynamic>?,
    );
  }
}
