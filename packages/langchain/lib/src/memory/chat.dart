import 'dart:async';

import '../chains/base.dart';
import '../model_io/chat_models/models/models.dart';
import '../utils/exception.dart';
import 'base.dart';
import 'chat_message_history/chat_message_history.dart';
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
  ///
  /// If null, the input key is inferred from the prompt (the input key hat
  /// was filled in by the user (i.e. not a memory key)).
  final String? inputKey;

  /// The output key to use for the chat history.
  final String? outputKey;

  /// If true, when [loadMemoryVariables] is called, it will return
  /// [ChatMessage] objects. If false, it will return a String representation
  /// of the messages.
  ///
  /// Set this to true when you are using a Chat model like `ChatOpenAI`.
  /// Set this to false when you are use a text LLM like `OpenAI`.
  final bool returnMessages;

  @override
  Future<void> saveContext({
    required final MemoryInputValues inputValues,
    required final MemoryOutputValues outputValues,
  }) async {
    // this is purposefully done in sequence so they're saved in order
    final (input, output) = _getInputOutputValues(inputValues, outputValues);

    if (input is ChatMessage) {
      await chatHistory.addChatMessage(input);
    } else {
      await chatHistory.addHumanChatMessage(input.toString());
    }

    if (output is ChatMessage) {
      await chatHistory.addChatMessage(output);
    } else {
      await chatHistory.addAIChatMessage(output.toString());
    }
  }

  (dynamic input, dynamic output) _getInputOutputValues(
    final MemoryInputValues inputValues,
    final MemoryOutputValues outputValues,
  ) {
    final promptInputKey =
        inputKey ?? getPromptInputKey(inputValues, memoryKeys);
    String outputKey;
    if (this.outputKey == null) {
      if (outputValues.isEmpty) {
        outputKey = '';
      } else if (outputValues.length == 1) {
        outputKey = outputValues.keys.first;
      } else if (outputValues.containsKey(BaseChain.defaultOutputKey)) {
        outputKey = BaseChain.defaultOutputKey;
      } else {
        throw LangChainException(
          message: 'One output key expected, got ${outputValues.keys}',
        );
      }
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
