import 'dart:async';

import '../../langchain.dart';
import '../stores/message/history.dart';
import '../stores/message/in_memory.dart';
import 'base.dart';
import 'models/models.dart';

/// {@template base_chat_memory}
/// Base interface for chat memory.
/// {@endtemplate}
abstract base class BaseChatMemory implements BaseMemory {
  /// {@macro base_chat_memory}
  BaseChatMemory({
    final BaseChatMessageHistory? chatHistory,
    this.inputKey,
    this.outputKey,
    this.returnMessages = false,
  }) : chatHistory = chatHistory ?? ChatMessageHistory();

  /// The chat history.
  final BaseChatMessageHistory chatHistory;

  /// The input key to use for the chat history.
  final String? inputKey;

  /// The output key to use for the chat history.
  final String? outputKey;

  /// If true, when [loadMemoryVariables] is called, it will return
  /// [ChatMessage] objects. If false, it will return a String representation
  /// of the messages.
  final bool returnMessages;

  @override
  Future<void> saveContext(
    final MemoryInputValues inputValues,
    final MemoryOutputValues outputValues,
  ) async {
    // this is purposefully done in sequence so they're saved in order
    await chatHistory.addUserMessage(getMemoryValue(inputValues, inputKey));
    await chatHistory.addAIChatMessage(getMemoryValue(outputValues, outputKey));
  }

  @override
  Future<void> clear() async {
    await chatHistory.clear();
  }
}
