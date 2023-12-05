import 'package:langchain/langchain.dart';
import 'package:ollama_dart/ollama_dart.dart';

/// Mapper for [GenerateCompletionResponse].
extension OllamaChatMessagesMapper on List<ChatMessage> {
  /// Converts a [List<ChatMessage>] to a [String].
  String toStringPrompt() {
    return map((final msg) {
      return switch (msg) {
        SystemChatMessage() => '<<SYS>> ${msg.content} <</SYS>>',
        HumanChatMessage() => '[INST] ${msg.content} [/INST]',
        AIChatMessage() => msg.content,
        CustomChatMessage() => '\n\n${msg.role.toUpperCase()}: ${msg.content}',
        _ => throw UnsupportedError(
            'Unsupported message type passed to Ollama $msg',
          ),
      };
    }).join('\n');
  }
}

/// Mapper for [GenerateCompletionResponse].
extension ChatResultMapper on GenerateCompletionResponse {
  /// Converts a [GenerateCompletionResponse] to a [ChatResult].
  ChatResult toChatResult({final bool streaming = false}) {
    return ChatResult(
      generations: [_toChatGeneration()],
      usage: _toLanguageModelUsage(),
      modelOutput: {
        'created_at': createdAt,
        'model': model,
      },
      streaming: streaming,
    );
  }

  ChatGeneration _toChatGeneration() {
    return ChatGeneration(
      AIChatMessage(
        content: response ?? '',
      ),
      generationInfo: {
        'done': done,
        'context': context,
        'sample_count': sampleCount,
        'sample_duration': sampleDuration,
        'total_duration': totalDuration,
        'load_duration': loadDuration,
        'prompt_eval_count': promptEvalCount,
        'prompt_eval_duration': promptEvalDuration,
        'eval_count': evalCount,
        'eval_duration': evalDuration,
      },
    );
  }

  LanguageModelUsage _toLanguageModelUsage() {
    return LanguageModelUsage(
      promptTokens: promptEvalCount,
      responseTokens: evalCount,
      totalTokens: (promptEvalCount != null && evalCount != null)
          ? promptEvalCount! + evalCount!
          : null,
    );
  }
}
