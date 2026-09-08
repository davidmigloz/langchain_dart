import 'package:langchain_core/callbacks.dart';
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_core/src/agents/types.dart';
import 'package:langchain_core/src/documents/document.dart';

class FakeCallbackHandler extends BaseCallbackHandler {
  FakeCallbackHandler({
    super.ignoreLlm,
    super.ignoreChain,
    super.ignoreTool,
    super.ignoreRetriever,
    super.ignoreAgent,
    super.ignoreCustomEvent,
    super.raiseError,
  });

  int llmStarts = 0;
  int llmEnds = 0;
  int llmErrors = 0;
  int chatModelStarts = 0;
  int newTokens = 0;
  int chainStarts = 0;
  int chainEnds = 0;
  int chainErrors = 0;
  int toolStarts = 0;
  int toolEnds = 0;
  int toolErrors = 0;
  int retrieverStarts = 0;
  int retrieverEnds = 0;
  int retrieverErrors = 0;
  int agentActions = 0;
  int agentFinishes = 0;
  int customEvents = 0;

  @override
  void onLlmStart({required RunInfo runInfo, required PromptValue input}) {
    llmStarts++;
  }

  @override
  void onChatModelStart({
    required RunInfo runInfo,
    required List<ChatMessage> messages,
  }) {
    chatModelStarts++;
  }

  @override
  void onLlmNewToken({required RunInfo runInfo, required String token}) {
    newTokens++;
  }

  @override
  void onLlmEnd({
    required RunInfo runInfo,
    required LanguageModelResult<Object> output,
  }) {
    llmEnds++;
  }

  @override
  void onLlmError({required RunInfo runInfo, required Object error}) {
    llmErrors++;
  }

  @override
  void onChainStart({
    required RunInfo runInfo,
    required Map<String, dynamic> inputs,
  }) {
    chainStarts++;
  }

  @override
  void onChainEnd({
    required RunInfo runInfo,
    required Map<String, dynamic> outputs,
  }) {
    chainEnds++;
  }

  @override
  void onChainError({required RunInfo runInfo, required Object error}) {
    chainErrors++;
  }

  @override
  void onToolStart({required RunInfo runInfo, required Object input}) {
    toolStarts++;
  }

  @override
  void onToolEnd({required RunInfo runInfo, required Object output}) {
    toolEnds++;
  }

  @override
  void onToolError({required RunInfo runInfo, required Object error}) {
    toolErrors++;
  }

  @override
  void onRetrieverStart({required RunInfo runInfo, required String query}) {
    retrieverStarts++;
  }

  @override
  void onRetrieverEnd({
    required RunInfo runInfo,
    required List<Document> documents,
  }) {
    retrieverEnds++;
  }

  @override
  void onRetrieverError({required RunInfo runInfo, required Object error}) {
    retrieverErrors++;
  }

  @override
  void onAgentAction({required RunInfo runInfo, required AgentAction action}) {
    agentActions++;
  }

  @override
  void onAgentFinish({required RunInfo runInfo, required AgentFinish finish}) {
    agentFinishes++;
  }

  @override
  void onCustomEvent({
    required RunInfo runInfo,
    required String name,
    required Object? data,
  }) {
    customEvents++;
  }
}
