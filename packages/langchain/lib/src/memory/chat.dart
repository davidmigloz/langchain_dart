import 'dart:async';

import '../stores/message/history.dart';
import '../stores/message/in_memory.dart';
import '../utils/exception.dart';
import 'base.dart';
import 'models/models.dart';
import 'utils.dart';

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
  Future<void> saveContext({
    required final MemoryInputValues inputValues,
    required final MemoryOutputValues outputValues,
  }) async {
    // this is purposefully done in sequence so they're saved in order
    final (input, output) = _getInputOutputValues(inputValues, outputValues);
    await chatHistory.addUserChatMessage(input);
    await chatHistory.addAIChatMessage(output);
  }

  (String input, String output) _getInputOutputValues(
    final MemoryInputValues inputValues,
    final MemoryOutputValues outputValues,
  ) {
    final promptInputKey = inputKey == null
        ? getPromptInputKey(inputValues, memoryKeys)
        : inputKey!;
    String outputKey;
    if (this.outputKey == null) {
      if (outputValues.length != 1) {
        throw LangChainException(
          message: 'One output key expected, got ${outputValues.keys}',
        );
      }
      outputKey = outputValues.keys.first;
    } else {
      outputKey = this.outputKey!;
    }
    return (inputValues[promptInputKey], outputValues[outputKey]);
  }

  @override
  Future<void> clear() async {
    await chatHistory.clear();
  }
}
