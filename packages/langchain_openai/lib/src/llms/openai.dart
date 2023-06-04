import 'base.dart';

/// Wrapper around OpenAI large language models.
final class OpenAI extends BaseOpenAI {
  OpenAI({
    super.apiKey,
    super.apiClient,
    super.model = 'text-davinci-003',
    super.maxTokens = 256,
    super.temperature = 0.7,
    super.topP = 1,
    super.n = 1,
    super.presencePenalty = 0,
    super.frequencyPenalty = 0,
    super.bestOf = 1,
    super.logitBias,
  });
}
