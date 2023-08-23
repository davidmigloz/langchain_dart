import '../chat_models/base.dart';
import '../language_models/base.dart';
import '../llms/base.dart';
import 'base_prompt.dart';

/// {@template base_prompt_template}
/// Base class for a prompt template.
/// {@endtemplate}
abstract interface class BasePromptSelector {
  /// {@macro base_prompt_template}
  const BasePromptSelector();

  /// Get default prompt for a language model.
  BasePromptTemplate getPrompt(final BaseLanguageModel llm);
}

/// {@template conditional_prompt_selector}
/// Prompt collection that goes through conditionals
/// to select the appropriate prompt.
/// {@endtemplate}
class ConditionalPromptSelector implements BasePromptSelector {
  /// {@macro conditional_prompt_selector}
  const ConditionalPromptSelector({
    required this.defaultPrompt,
    this.conditionals = const [],
  });

  /// Default prompt to use if no conditionals match.
  final BasePromptTemplate defaultPrompt;

  /// Conditional prompts to use.
  final List<PromptCondition> conditionals;

  @override
  BasePromptTemplate getPrompt(final BaseLanguageModel llm) {
    for (final conditional in conditionals) {
      if (conditional.condition(llm)) {
        return conditional.prompt;
      }
    }
    return defaultPrompt;
  }
}

/// {@template prompt_condition}
/// Condition for a prompt.
/// {@endtemplate}
class PromptCondition {
  /// {@macro prompt_condition}
  const PromptCondition({
    required this.condition,
    required this.prompt,
  });

  final bool Function(BaseLanguageModel llm) condition;
  final BasePromptTemplate prompt;

  /// A prompt for a language mode that is an LLM.
  factory PromptCondition.isLlm(final BasePromptTemplate prompt) {
    return PromptCondition(
      condition: (final BaseLanguageModel llm) => llm is BaseLLM,
      prompt: prompt,
    );
  }

  /// A prompt for a language mode that is a chat model.
  factory PromptCondition.isChatModel(final BasePromptTemplate prompt) {
    return PromptCondition(
      condition: (final BaseLanguageModel llm) => llm is BaseChatModel,
      prompt: prompt,
    );
  }
}
