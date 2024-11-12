import 'package:huggingface_client/huggingface_client.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/llms.dart';

extension HuggingFaceResponseMapper on ApiResponseNLPTextGeneration {
  //map to
  LLMResult toLLMResult() {
    return LLMResult(
        id: 'id',
        output: generatedText,
        finishReason: FinishReason.unspecified,
        metadata: {},
        usage: const LanguageModelUsage());
  }
}
