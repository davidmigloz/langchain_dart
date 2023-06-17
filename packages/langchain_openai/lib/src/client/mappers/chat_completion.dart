import 'package:dart_openai/dart_openai.dart' as c;

import '../models/chat_completion.dart';
import 'functions.dart';

/// Mapper for [ChatMessage] to [c.OpenAIChatCompletionMessage].
extension OpenAIChatCompletionChoiceMessageDtoMapper
    on OpenAIChatCompletionMessage {
  c.OpenAIChatCompletionChoiceMessageModel toDto() {
    return c.OpenAIChatCompletionChoiceMessageModel(
      role: role.toDto(),
      content: content,
      functionCall: functionCall?.toDto(),
      functionName: functionName,
    );
  }
}

/// Mapper for [c.OpenAIChatCompletionChoiceMessageModel] to
/// [OpenAIChatCompletionMessage].
extension _OpenAIChatCompletionChoiceMessageMapper
    on c.OpenAIChatCompletionChoiceMessageModel {
  OpenAIChatCompletionMessage toModel() {
    return OpenAIChatCompletionMessage(
      role: role.toModel(),
      content: content,
      functionCall: functionCall?.toModel(),
    );
  }
}

/// Mapper for [OpenAIChatCompletionChoice] to
/// [c.OpenAIChatCompletionChoiceModel].
extension _OpenAIChatMessageRoleDtoMapper on OpenAIChatMessageRole {
  c.OpenAIChatMessageRole toDto() => switch (this) {
        OpenAIChatMessageRole.system => c.OpenAIChatMessageRole.system,
        OpenAIChatMessageRole.user => c.OpenAIChatMessageRole.user,
        OpenAIChatMessageRole.assistant => c.OpenAIChatMessageRole.assistant,
        OpenAIChatMessageRole.function => c.OpenAIChatMessageRole.function,
      };
}

/// Mapper for [c.OpenAIChatCompletionChoiceModel] to
/// [OpenAIChatCompletionChoice].
extension _OpenAIChatMessageRoleMapper on c.OpenAIChatMessageRole {
  OpenAIChatMessageRole toModel() => switch (this) {
        c.OpenAIChatMessageRole.system => OpenAIChatMessageRole.system,
        c.OpenAIChatMessageRole.user => OpenAIChatMessageRole.user,
        c.OpenAIChatMessageRole.assistant => OpenAIChatMessageRole.assistant,
        c.OpenAIChatMessageRole.function => OpenAIChatMessageRole.function,
      };
}

/// Mapper for [c.OpenAIChatCompletionModel] to [OpenAIChatCompletion].
extension OpenAIChatCompletionMapper on c.OpenAIChatCompletionModel {
  OpenAIChatCompletion toModel() {
    return OpenAIChatCompletion(
      id: id,
      created: created,
      choices: choices.map((final c) => c.toModel()).toList(growable: false),
      usage: usage.toModel(),
    );
  }
}

/// Mapper for [c.OpenAIChatCompletionChoiceModel] to
/// [OpenAIChatCompletionChoice].
extension _OpenAIChatCompletionChoiceMapper
    on c.OpenAIChatCompletionChoiceModel {
  OpenAIChatCompletionChoice toModel() {
    return OpenAIChatCompletionChoice(
      index: index,
      message: message.toModel(),
      finishReason: finishReason,
    );
  }
}

/// Mapper for [c.OpenAIChatCompletionUsageModel] to
/// [OpenAIChatCompletionUsage].
extension _OpenAIChatCompletionUsageMapper on c.OpenAIChatCompletionUsageModel {
  OpenAIChatCompletionUsage toModel() {
    return OpenAIChatCompletionUsage(
      promptTokens: promptTokens,
      completionTokens: completionTokens,
      totalTokens: totalTokens,
    );
  }
}
