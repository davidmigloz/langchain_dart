/// Capabilities of a chat provider.
enum ProviderCaps {
  /// The provider supports chat.
  chat,

  /// The provider supports embeddings.
  embeddings,

  /// The provider supports multiple tool calls.
  multiToolCalls,

  /// The provider supports typed output.
  typedOutput;

  /// All chat capabilities.
  static const allChat = {chat, multiToolCalls, typedOutput};

  /// All embeddings capabilities.
  static const allEmbeddings = {embeddings};

  /// Returns all capabilities except those specified in [these].
  static Set<ProviderCaps> allChatExcept(Set<ProviderCaps> these) =>
      allChat.difference(these);
}
