import '../agents/agent.dart';
import '../utils/exception.dart';
import 'models/models.dart';

/// This function is used by memory classes to select the input value to use
/// for the memory.
///
/// Given the [inputValues] and [memoryKeys], it returns the input key
/// from the prompt that was filled in by the user (i.e. not a memory key).
String getPromptInputKey(
  final MemoryInputValues inputValues,
  final Set<String> memoryKeys,
) {
  // Reserved keys can be passed as input but is not used to format the prompt
  final promptInputKeys = inputValues.keys.toSet().difference({
    ...memoryKeys,
    'stop',
    BaseActionAgent.agentScratchpadInputKey,
  });
  if (promptInputKeys.length != 1) {
    throw LangChainException(
      message: 'One input key expected got $promptInputKeys. '
          'If you have multiple input keys in your prompt you need to specify '
          'the input key to use for the memory using the `inputKey` parameter.',
    );
  }
  return promptInputKeys.first;
}
