import 'package:huggingface_client/huggingface_client.dart';
import 'package:langchain_core/llms.dart';
import 'package:langchain_core/src/prompts/types.dart';
import 'package:meta/meta.dart';
import '../../langchain_huggingface.dart';
import 'mappers.dart';
import 'types.dart';

@immutable
class HuggingfaceInference extends BaseLLM<HuggingFaceOptions> {
  const HuggingfaceInference._({
    required this.model,
    required this.apiKey,
    required this.apiClient,
    super.defaultOptions = const HuggingFaceOptions(),
  });
  final InferenceApi apiClient;
  final String apiKey;
  final String model;
  factory HuggingfaceInference.call({
    required String apiKey,
    required String model,
  }) {
    final apiClient = InferenceApi(HuggingFaceClient.getInferenceClient(
        apiKey, HuggingFaceClient.inferenceBasePath));
    return HuggingfaceInference._(
        model: model, apiKey: apiKey, apiClient: apiClient);
  }
  @override
  Future<LLMResult> invoke(PromptValue input,
      {HuggingFaceOptions? options}) async {
    final parameters = ApiQueryNLPTextGeneration(
        inputs: input.toString(),
        temperature: options?.temperature ?? 1.0,
        topK: options?.topK ?? 0,
        topP: options?.topP ?? 0.0,
        maxTime: options?.maxTime ?? -1.0,
        returnFullText: options?.returnFullText ?? true,
        repetitionPenalty: options?.repetitionPenalty ?? -1,
        doSample: options?.doSample ?? true,
        maxNewTokens: options?.maxNewTokens ?? -1,
        options: InferenceOptions(
            useCache: options?.useCache ?? true,
            waitForModel: options?.waitForModel ?? false));
    final result = await apiClient.queryNLPTextGeneration(
        taskParameters: parameters, model: model);

    return result![0]!.toLLMResult();
  }

  @override
  String get modelType => 'llm';
  @override
  Future<List<int>> tokenize(PromptValue promptValue,
      {HuggingFaceOptions? options}) async {
    // TODO: implement tokenize
    throw UnimplementedError();
  }
}
