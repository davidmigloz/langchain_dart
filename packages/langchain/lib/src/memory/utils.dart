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
  // "stop" is a special key that can be passed as input but is not used to
  // format the prompt
  final promptInputKeys =
      inputValues.keys.toSet().difference({...memoryKeys, 'stop'});
  if (promptInputKeys.length != 1) {
    throw LangChainException(
      message: 'One input key expected got $promptInputKeys',
    );
  }
  return promptInputKeys.first;
}
