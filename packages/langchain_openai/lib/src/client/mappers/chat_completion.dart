import 'package:dart_openai/dart_openai.dart' as c;

import '../models/chat_completion.dart';

extension OpenAIChatCompletionChoiceMessageModelDtoMapper
    on OpenAIChatCompletionChoiceMessageModel {
  c.OpenAIChatCompletionChoiceMessageModel toDto() {
    return c.OpenAIChatCompletionChoiceMessageModel(
      role: role.toDto(),
      content: content,
    );
  }
}

extension _OpenAIChatCompletionChoiceMessageModelMapper
    on c.OpenAIChatCompletionChoiceMessageModel {
  OpenAIChatCompletionChoiceMessageModel toModel() {
    return OpenAIChatCompletionChoiceMessageModel(
      role: role.toModel(),
      content: content,
    );
  }
}

extension _OpenAIChatMessageRoleDtoMapper on OpenAIChatMessageRole {
  c.OpenAIChatMessageRole toDto() => switch (this) {
        OpenAIChatMessageRole.system => c.OpenAIChatMessageRole.system,
        OpenAIChatMessageRole.user => c.OpenAIChatMessageRole.user,
        OpenAIChatMessageRole.assistant => c.OpenAIChatMessageRole.assistant,
      };
}

extension _OpenAIChatMessageRoleMapper on c.OpenAIChatMessageRole {
  OpenAIChatMessageRole toModel() => switch (this) {
        c.OpenAIChatMessageRole.system => OpenAIChatMessageRole.system,
        c.OpenAIChatMessageRole.user => OpenAIChatMessageRole.user,
        c.OpenAIChatMessageRole.assistant => OpenAIChatMessageRole.assistant,
      };
}

extension OpenAIChatCompletionModelMapper on c.OpenAIChatCompletionModel {
  OpenAIChatCompletionModel toModel() {
    return OpenAIChatCompletionModel(
      id: id,
      created: created,
      choices: choices.map((final c) => c.toModel()).toList(growable: false),
      usage: usage.toModel(),
    );
  }
}

extension _OpenAIChatCompletionChoiceModelMapper
    on c.OpenAIChatCompletionChoiceModel {
  OpenAIChatCompletionChoiceModel toModel() {
    return OpenAIChatCompletionChoiceModel(
      index: index,
      message: message.toModel(),
      finishReason: finishReason,
    );
  }
}

extension _OpenAIChatCompletionUsageModelMapper
    on c.OpenAIChatCompletionUsageModel {
  OpenAIChatCompletionUsageModel toModel() {
    return OpenAIChatCompletionUsageModel(
      promptTokens: promptTokens,
      completionTokens: completionTokens,
      totalTokens: totalTokens,
    );
  }
}
