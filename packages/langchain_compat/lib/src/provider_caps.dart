/// Capabilities of a chat provider.
enum ProviderCaps {
  /// The provider supports chat.
  chat,

  /// The provider supports embeddings.
  embeddings,

  /// The provider supports multiple tool calls.
  multiToolCalls,

  /// The provider supports typed output.
  typedOutput,
  
  /// The provider supports typed output with tool calls simultaneously.
  /// This includes providers that use return_result pattern (Anthropic) or
  /// native response_format (OpenAI).
  typedOutputWithTools,
  
  /// The provider supports typed output with tool calls NATIVELY.
  /// Only true for providers that can use response_format + tools without
  /// needing the return_result workaround (e.g., OpenAI).
  nativeTypedOutputWithTools,

  /// The provider supports vision/multi-modal input (images, etc.).
  vision,
}
