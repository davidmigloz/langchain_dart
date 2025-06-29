import 'package:collection/collection.dart';

import '../../language_models.dart';
import '../prompts/types.dart';
import '../tools/base.dart';
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

  var _i = 0;

  @override
  String get modelType => 'fake-chat-model';

  @override
  Future<ChatResult> invoke(
    PromptValue input, {
    FakeChatModelOptions? options,
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
    PromptValue input, {
    FakeChatModelOptions? options,
  }) {
    final res = responses[_i++ % responses.length].split('');
    return Stream.fromIterable(res).map(
      (char) => ChatResult(
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
    PromptValue promptValue, {
    ChatModelOptions? options,
  }) async => promptValue
        .toString()
        .split(' ')
        .map((word) => word.hashCode)
        .toList(growable: false);
}

/// {@template fake_chat_model_options}
/// Fake Chat Model Options for testing.
/// {@endtemplate}
class FakeChatModelOptions extends ChatModelOptions {
  /// {@macro fake_chat_model_options}
  const FakeChatModelOptions({
    super.model,
    this.metadata,
    super.tools,
    super.toolChoice,
    super.concurrencyLimit,
  });

  /// Metadata.
  final Map<String, dynamic>? metadata;

  @override
  FakeChatModelOptions copyWith({
    String? model,
    Map<String, dynamic>? metadata,
    List<ToolSpec>? tools,
    ChatToolChoice? toolChoice,
    int? concurrencyLimit,
  }) => FakeChatModelOptions(
      model: model ?? this.model,
      metadata: metadata ?? this.metadata,
      tools: tools ?? this.tools,
      toolChoice: toolChoice ?? this.toolChoice,
      concurrencyLimit: concurrencyLimit ?? this.concurrencyLimit,
    );

  @override
  FakeChatModelOptions merge(covariant FakeChatModelOptions? other) => copyWith(
      model: other?.model,
      metadata: other?.metadata,
      concurrencyLimit: other?.concurrencyLimit,
    );

  @override
  bool operator ==(covariant FakeChatModelOptions other) => model == other.model &&
        const MapEquality<String, dynamic>().equals(metadata, other.metadata) &&
        concurrencyLimit == other.concurrencyLimit;

  @override
  int get hashCode => model.hashCode ^
        const MapEquality<String, dynamic>().hash(metadata) ^
        concurrencyLimit.hashCode;
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
    PromptValue input, {
    FakeEchoChatModelOptions? options,
  }) async {
    final throwError =
        options?.throwRandomError ?? defaultOptions.throwRandomError;
    if (throwError) {
      throw Exception('Random error');
    }

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
    PromptValue input, {
    FakeEchoChatModelOptions? options,
  }) {
    final prompt = input.toChatMessages().first.contentAsString.split('');
    final throwError =
        options?.throwRandomError ?? defaultOptions.throwRandomError;

    var index = 0;
    return Stream.fromIterable(prompt).map((char) {
      if (throwError && index == prompt.length ~/ 2) {
        throw Exception('Random error');
      }

      return ChatResult(
        id: 'fake-echo-chat-model',
        output: AIChatMessage(content: char),
        finishReason: FinishReason.stop,
        metadata: {
          'model': options?.model ?? defaultOptions.model,
          ...?options?.metadata ?? defaultOptions.metadata,
          'index': index++,
        },
        usage: const LanguageModelUsage(),
        streaming: true,
      );
    });
  }

  @override
  Future<List<int>> tokenize(
    PromptValue promptValue, {
    ChatModelOptions? options,
  }) async => promptValue
        .toString()
        .split(' ')
        .map((word) => word.hashCode)
        .toList(growable: false);
}

/// {@template fake_chat_model_options}
/// Fake Echo Chat Model Options for testing.
/// {@endtemplate}
class FakeEchoChatModelOptions extends ChatModelOptions {
  /// {@macro fake_chat_model_options}
  const FakeEchoChatModelOptions({
    super.model,
    this.metadata,
    this.throwRandomError = false,
    super.tools,
    super.toolChoice,
    super.concurrencyLimit,
  });

  /// Metadata.
  final Map<String, dynamic>? metadata;

  /// If true, throws a random error.
  final bool throwRandomError;

  @override
  FakeEchoChatModelOptions copyWith({
    String? model,
    Map<String, dynamic>? metadata,
    bool? throwRandomError,
    List<ToolSpec>? tools,
    ChatToolChoice? toolChoice,
    int? concurrencyLimit,
  }) => FakeEchoChatModelOptions(
      model: model ?? this.model,
      metadata: metadata ?? this.metadata,
      throwRandomError: throwRandomError ?? this.throwRandomError,
      tools: tools ?? this.tools,
      toolChoice: toolChoice ?? this.toolChoice,
      concurrencyLimit: concurrencyLimit ?? this.concurrencyLimit,
    );

  @override
  FakeEchoChatModelOptions merge(
    covariant FakeEchoChatModelOptions? other,
  ) => copyWith(
      model: other?.model,
      metadata: other?.metadata,
      throwRandomError: other?.throwRandomError,
      concurrencyLimit: other?.concurrencyLimit,
    );

  @override
  bool operator ==(covariant FakeEchoChatModelOptions other) => model == other.model &&
        const MapEquality<String, dynamic>().equals(metadata, other.metadata) &&
        throwRandomError == other.throwRandomError &&
        concurrencyLimit == other.concurrencyLimit;

  @override
  int get hashCode => model.hashCode ^
        const MapEquality<String, dynamic>().hash(metadata) ^
        throwRandomError.hashCode ^
        concurrencyLimit.hashCode;
}
