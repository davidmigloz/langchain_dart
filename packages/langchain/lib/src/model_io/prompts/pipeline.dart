import 'base_prompt.dart';
import 'chat_prompt.dart';
import 'models/models.dart';
import 'prompt.dart';

/// {@template pipeline_prompt_template}
/// A prompt template for composing multiple prompts together.
///
/// This can be useful when you want to reuse parts of prompts.
/// A [PipelinePromptTemplate] consists of two main parts:
/// - [finalPrompt] This is the final prompt that is returned.
/// - [pipelinePrompts] This is a list of records, consisting of a string
///   (`name`) and a [BasePromptTemplate]. Each [BasePromptTemplate] will be
///   formatted and then passed to future prompt templates as a variable with
///   the same name as `name`.
///
/// Example:
/// ```dart
/// final promptA = PromptTemplate.fromTemplate('{foo}');
/// final promptB = PromptTemplate.fromTemplate('{bar}');
/// final pipelinePromptTemplate = PipelinePromptTemplate(
///   finalPrompt: promptB,
///   pipelinePrompts: [('bar', promptA)],
/// );
/// final prompt = pipelinePromptTemplate.formatPrompt({'foo': 'jim'});
/// final res = await llm.invoke(prompt);
/// ```
/// {@endtemplate}
final class PipelinePromptTemplate extends BasePromptTemplate {
  /// {@macro pipeline_prompt_template}
  PipelinePromptTemplate({
    required this.finalPrompt,
    required this.pipelinePrompts,
  }) : super(
          inputVariables: _computeInputValues(finalPrompt, pipelinePrompts),
        );

  /// The final prompt that is returned.
  final BasePromptTemplate finalPrompt;

  /// Tuples of the name of the variable and the prompt template in the
  /// pipeline.
  final List<(String name, BasePromptTemplate)> pipelinePrompts;

  static Set<String> _computeInputValues(
    final BasePromptTemplate finalPrompt,
    final List<(String name, BasePromptTemplate)> pipelinePrompts,
  ) {
    final intermediateValues = pipelinePrompts.map((final pipelinePrompt) {
      final (name, _) = pipelinePrompt;
      return name;
    }).toSet();

    return pipelinePrompts.expand(
      (final pipelinePrompt) {
        final (_, prompt) = pipelinePrompt;
        return prompt.inputVariables.where(
          (final inputValue) => !intermediateValues.contains(inputValue),
        );
      },
    ).toSet();
  }

  @override
  String format(final InputValues values) {
    return finalPrompt.format(_formatPipelinePrompts(values));
  }

  @override
  PromptValue formatPrompt(final InputValues values) {
    return finalPrompt.formatPrompt(_formatPipelinePrompts(values));
  }

  Map<String, dynamic> _formatPipelinePrompts(
    final InputValues values,
  ) {
    final allValues = mergePartialAndUserVariables(values);
    for (final pipelinePrompt in pipelinePrompts) {
      final (name, prompt) = pipelinePrompt;
      final pipelinePromptInputValues = _extractRequiredInputValues(
        allValues,
        prompt.inputVariables,
      );
      allValues[name] = switch (prompt) {
        final ChatPromptTemplate p =>
          p.formatMessages(pipelinePromptInputValues),
        final PromptTemplate p => p.format(pipelinePromptInputValues),
        _ => throw UnsupportedError('Unsupported prompt type: $prompt'),
      };
    }
    return _extractRequiredInputValues(allValues, finalPrompt.inputVariables);
  }

  Map<String, dynamic> _extractRequiredInputValues(
    final Map<String, dynamic> allValues,
    final Set<String> requiredValueNames,
  ) {
    return requiredValueNames.fold(<String, dynamic>{},
        (final requiredValues, final valueName) {
      requiredValues[valueName] = allValues[valueName];
      return requiredValues;
    });
  }

  @override
  PipelinePromptTemplate copyWith({
    final BasePromptTemplate? finalPrompt,
    final List<(String name, BasePromptTemplate)>? pipelinePrompts,
    final Set<String>? inputVariables,
    final Map<String, dynamic>? partialVariables,
  }) {
    return PipelinePromptTemplate(
      finalPrompt: finalPrompt ?? this.finalPrompt,
      pipelinePrompts: pipelinePrompts ?? this.pipelinePrompts,
    );
  }

  @override
  String get type => 'pipeline';
}
