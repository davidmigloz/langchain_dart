import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

/// {@template openai_chat_completion_choice_message_model}
/// This represents the message of the [OpenAIChatCompletionChoiceModel] model
/// of the OpenAI API, which is used and get returned while using the
/// [OpenAIChat] methods.
/// {@endtemplate}
@immutable
final class OpenAIChatCompletionChoiceMessageModel {
  /// The [role] of the message.
  final OpenAIChatMessageRole role;

  /// The [content] of the message.
  final String content;

  @override
  int get hashCode {
    return role.hashCode ^ content.hashCode;
  }

  /// {@macro openai_chat_completion_choice_message_model}
  const OpenAIChatCompletionChoiceMessageModel({
    required this.role,
    required this.content,
  });

  @override
  String toString() {
    return 'OpenAIChatCompletionChoiceMessageModel(role: $role, '
        'content: $content)';
  }

  @override
  bool operator ==(
    covariant final OpenAIChatCompletionChoiceMessageModel other,
  ) {
    if (identical(this, other)) return true;

    return other.role == role && other.content == content;
  }
}

enum OpenAIChatMessageRole { system, user, assistant }

/// {@template openai_chat_completion}
/// This class represents the chat completion response model of the OpenAI API,
/// which is used and get returned while using the [OpenAIChat] methods.
/// {@endtemplate}
@immutable
final class OpenAIChatCompletionModel {
  /// The [id] of the chat completion.
  final String id;

  /// The date and time when the chat completion is [created].
  final DateTime created;

  /// The [choices] of the chat completion.
  final List<OpenAIChatCompletionChoiceModel> choices;

  /// The [usage] of the chat completion.
  final OpenAIChatCompletionUsageModel usage;

  /// Whether the chat completion have at least one choice in [choices].
  bool get haveChoices => choices.isNotEmpty;

  @override
  int get hashCode {
    return id.hashCode ^ created.hashCode ^ choices.hashCode ^ usage.hashCode;
  }

  /// {@macro openai_chat_completion}
  const OpenAIChatCompletionModel({
    required this.id,
    required this.created,
    required this.choices,
    required this.usage,
  });

  @override
  String toString() {
    return 'OpenAIChatCompletionModel(id: $id, created: $created, choices: '
        '$choices, usage: $usage)';
  }

  @override
  bool operator ==(covariant final OpenAIChatCompletionModel other) {
    const listEquals = ListEquality<OpenAIChatCompletionChoiceModel>();
    if (identical(this, other)) return true;

    return other.id == id &&
        other.created == created &&
        listEquals.equals(other.choices, choices) &&
        other.usage == usage;
  }
}

/// {@template openai_chat_completion_choice}
/// This class represents a choice of the [OpenAIChatCompletionModel] model of
/// the OpenAI API, which is used and get returned while using the [OpenAIChat]
/// methods.
/// {@endtemplate}
@immutable
final class OpenAIChatCompletionChoiceModel {
  /// The [index] of the choice.
  final int index;

  /// The [message] of the choice.
  final OpenAIChatCompletionChoiceMessageModel message;

  /// The [finishReason] of the choice.
  final String? finishReason;

  @override
  int get hashCode {
    return index.hashCode ^ message.hashCode ^ finishReason.hashCode;
  }

  /// {@macro openai_chat_completion_choice}
  const OpenAIChatCompletionChoiceModel({
    required this.index,
    required this.message,
    required this.finishReason,
  });

  @override
  String toString() {
    return 'OpenAIChatCompletionChoiceModel(index: $index, message: $message, '
        'finishReason: $finishReason)';
  }

  @override
  bool operator ==(covariant final OpenAIChatCompletionChoiceModel other) {
    if (identical(this, other)) return true;

    return other.index == index &&
        other.message == message &&
        other.finishReason == finishReason;
  }
}

/// {@template openai_chat_completion_usage}
/// This class represents the chat completion usage model of the OpenAI API,
/// which is used and get returned while using the [OpenAIChat] methods.
/// {@endtemplate}
@immutable
final class OpenAIChatCompletionUsageModel {
  /// The number of tokens used for the prompt(s).
  final int promptTokens;

  /// The number of tokens used for the chat completion(s).
  final int completionTokens;

  /// The total number of tokens used for the chat completion(s).
  /// This is the sum of [promptTokens] and [completionTokens].
  final int totalTokens;

  @override
  int get hashCode {
    return promptTokens.hashCode ^
        completionTokens.hashCode ^
        totalTokens.hashCode;
  }

  /// {@macro openai_chat_completion_usage}
  const OpenAIChatCompletionUsageModel({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });

  @override
  String toString() {
    return 'OpenAIChatCompletionUsageModel(promptTokens: $promptTokens, '
        'completionTokens: $completionTokens, totalTokens: $totalTokens)';
  }

  @override
  bool operator ==(covariant final OpenAIChatCompletionUsageModel other) {
    if (identical(this, other)) return true;

    return other.promptTokens == promptTokens &&
        other.completionTokens == completionTokens &&
        other.totalTokens == totalTokens;
  }
}
