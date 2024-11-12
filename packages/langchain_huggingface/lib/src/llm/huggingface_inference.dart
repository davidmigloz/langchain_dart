import 'package:huggingface_client/huggingface_client.dart';
import 'package:langchain_core/llms.dart';
import 'package:langchain_core/src/prompts/types.dart';
import 'package:meta/meta.dart';
import 'mappers.dart';
import 'types.dart';

@immutable
class HuggingfaceInference extends BaseLLM<HuggingFaceOptions> {
  HuggingfaceInference({
    required this.model,
    required this.apiKey,
    super.defaultOptions = const HuggingFaceOptions(),
  }) : _apiClient = InferenceApi(_getclient(apiKey));
  final InferenceApi _apiClient;
  final String apiKey;
  final String model;

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
    final result = await _apiClient.queryNLPTextGeneration(
        taskParameters: parameters, model: model);

    return result![0]!.toLLMResult();
  }

  static InferenceApiClient _getclient(String apikey) =>
      HuggingFaceClient.getInferenceClient(
          apikey, HuggingFaceClient.inferenceBasePath);

  @override
  String get modelType => 'llm';
  @override
  Future<List<int>> tokenize(PromptValue promptValue,
      {HuggingFaceOptions? options}) async {
    // TODO: implement tokenize
    throw UnimplementedError();
  }
}
