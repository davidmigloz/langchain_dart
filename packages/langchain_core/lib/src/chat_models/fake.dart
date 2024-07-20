import 'package:collection/collection.dart';

import '../../language_models.dart';
import '../prompts/types.dart';
import 'base.dart';
import 'types.dart';

/// {@template fake_chat_model}
/// Fake Chat Model for testing.
/// You can pass in a list of responses to return in order when called.
/// {@endtemplate}
class FakeChatModel extends BaseChatModel<FakeChatModelOptions> {
  /// {@macro fake_list_llm}
  FakeChatModel({
    required this.responses,
    super.defaultOptions = const FakeChatModelOptions(),
  });

  /// Responses to return in order when called.
  final List<String> responses;

  int _i = 0;

  @override
  String get modelType => 'fake-chat-model';

  @override
  Future<ChatResult> invoke(
    final PromptValue input, {
    final FakeChatModelOptions? options,
  }) async {
    final text = responses[_i++ % responses.length];
    final message = AIChatMessage(content: text);
    return ChatResult(
      id: '1',
      output: message,
      finishReason: FinishReason.unspecified,
      metadata: {
        'model': options?.model ?? defaultOptions.model,
        ...?options?.metadata ?? defaultOptions.metadata,
      },
      usage: const LanguageModelUsage(),
    );
  }

  @override
  Stream<ChatResult> stream(
    final PromptValue input, {
    final FakeChatModelOptions? options,
  }) {
    final res = responses[_i++ % responses.length].split('');
    return Stream.fromIterable(res).map(
      (final char) => ChatResult(
        id: 'fake-chat-model',
        output: AIChatMessage(content: char),
        finishReason: FinishReason.stop,
        metadata: {
          'model': options?.model ?? defaultOptions.model,
          ...?options?.metadata ?? defaultOptions.metadata,
        },
        usage: const LanguageModelUsage(),
        streaming: true,
      ),
    );
  }

  @override
  Future<List<int>> tokenize(
    final PromptValue promptValue, {
    final ChatModelOptions? options,
  }) async {
    return promptValue
        .toString()
        .split(' ')
        .map((final word) => word.hashCode)
        .toList(growable: false);
  }
}

/// {@template fake_chat_model_options}
/// Fake Chat Model Options for testing.
/// {@endtemplate}
class FakeChatModelOptions extends ChatModelOptions {
  /// {@macro fake_chat_model_options}
  const FakeChatModelOptions({
    super.model,
    this.metadata,
    super.concurrencyLimit,
  });

  /// Metadata.
  final Map<String, dynamic>? metadata;

  @override
  FakeChatModelOptions copyWith({
    final String? model,
    final Map<String, dynamic>? metadata,
    final int? concurrencyLimit,
  }) {
    return FakeChatModelOptions(
      model: model ?? this.model,
      metadata: metadata ?? this.metadata,
      concurrencyLimit: concurrencyLimit ?? this.concurrencyLimit,
    );
  }

  @override
  FakeChatModelOptions merge(
    covariant final FakeChatModelOptions? other,
  ) {
    return copyWith(
      model: other?.model,
      metadata: other?.metadata,
      concurrencyLimit: other?.concurrencyLimit,
    );
  }

  @override
  bool operator ==(covariant final FakeChatModelOptions other) {
    return model == other.model &&
        const MapEquality<String, dynamic>().equals(metadata, other.metadata) &&
        concurrencyLimit == other.concurrencyLimit;
  }

  @override
  int get hashCode {
    return model.hashCode ^
        const MapEquality<String, dynamic>().hash(metadata) ^
        concurrencyLimit.hashCode;
  }
}

/// {@template fake_echo_chat_model}
/// Fake Chat Model for testing.
/// It just returns the content of the last message of the prompt
/// or streams it char by char.
/// {@endtemplate}
class FakeEchoChatModel extends BaseChatModel<FakeEchoChatModelOptions> {
  /// {@macro fake_echo_chat_model}
  const FakeEchoChatModel({
    super.defaultOptions = const FakeEchoChatModelOptions(),
  });

  @override
  String get modelType => 'fake-echo-chat-model';

  @override
  Future<ChatResult> invoke(
    final PromptValue input, {
    final FakeEchoChatModelOptions? options,
  }) async {
    final text = input.toChatMessages().last.contentAsString;
    final message = AIChatMessage(content: text);
    return ChatResult(
      id: '1',
      output: message,
      finishReason: FinishReason.unspecified,
      metadata: {
        'model': options?.model ?? defaultOptions.model,
        ...?options?.metadata ?? defaultOptions.metadata,
      },
      usage: const LanguageModelUsage(),
    );
  }

  @override
  Stream<ChatResult> stream(
    final PromptValue input, {
    final FakeEchoChatModelOptions? options,
  }) {
    final prompt = input.toChatMessages().first.contentAsString.split('');
    return Stream.fromIterable(prompt).map(
      (final char) => ChatResult(
        id: 'fake-echo-chat-model',
        output: AIChatMessage(content: char),
        finishReason: FinishReason.stop,
        metadata: {
          'model': options?.model ?? defaultOptions.model,
          ...?options?.metadata ?? defaultOptions.metadata,
        },
        usage: const LanguageModelUsage(),
        streaming: true,
      ),
    );
  }

  @override
  Future<List<int>> tokenize(
    final PromptValue promptValue, {
    final ChatModelOptions? options,
  }) async {
    return promptValue
        .toString()
        .split(' ')
        .map((final word) => word.hashCode)
        .toList(growable: false);
  }
}

/// {@template fake_chat_model_options}
/// Fake Echo Chat Model Options for testing.
/// {@endtemplate}
class FakeEchoChatModelOptions extends ChatModelOptions {
  /// {@macro fake_chat_model_options}
  const FakeEchoChatModelOptions({
    super.model,
    this.metadata,
    super.concurrencyLimit,
  });

  /// Metadata.
  final Map<String, dynamic>? metadata;

  @override
  FakeEchoChatModelOptions copyWith({
    final String? model,
    final Map<String, dynamic>? metadata,
    final int? concurrencyLimit,
  }) {
    return FakeEchoChatModelOptions(
      model: model ?? this.model,
      metadata: metadata ?? this.metadata,
      concurrencyLimit: concurrencyLimit ?? this.concurrencyLimit,
    );
  }

  @override
  FakeEchoChatModelOptions merge(
    covariant final FakeEchoChatModelOptions? other,
  ) {
    return copyWith(
      model: other?.model,
      metadata: other?.metadata,
      concurrencyLimit: other?.concurrencyLimit,
    );
  }

  @override
  bool operator ==(covariant final FakeEchoChatModelOptions other) {
    return model == other.model &&
        const MapEquality<String, dynamic>().equals(metadata, other.metadata) &&
        concurrencyLimit == other.concurrencyLimit;
  }

  @override
  int get hashCode {
    return model.hashCode ^
        const MapEquality<String, dynamic>().hash(metadata) ^
        concurrencyLimit.hashCode;
  }
}
