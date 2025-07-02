/// The kind of model supported by a provider.
///
/// Used to classify models for listing, filtering, and selection.
/// - [chat]: Chat completion models for conversational AI
/// - [image]: Image generation or vision models
/// - [embedding]: Text embedding models for semantic similarity
/// - [audio]: Audio processing models (speech-to-text, etc.)
/// - [tts]: Text-to-speech models
/// - [countTokens]: Count the number of tokens in a text string
/// - [other]: Other specialized model types
enum ModelKind {
  /// Chat completion models for conversational AI
  chat,

  /// Image generation or vision models
  image,

  /// Text embedding models for semantic similarity
  embedding,

  /// Audio processing models (speech-to-text, etc.)
  audio,

  /// Text-to-speech models
  tts,

  /// Count the number of tokens in a text string
  countTokens,

  /// Other specialized model types
  other,
}
