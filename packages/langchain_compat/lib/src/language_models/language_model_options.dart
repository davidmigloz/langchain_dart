import 'package:meta/meta.dart';
import '../langchain/types.dart';

/// {@template language_model_options}
/// Options to pass into the language model.
/// {@endtemplate}
@immutable
class LanguageModelOptions extends BaseLangChainOptions {
  /// {@macro language_model_options}
  const LanguageModelOptions({super.concurrencyLimit});

  @override
  LanguageModelOptions copyWith({int? concurrencyLimit}) =>
      LanguageModelOptions(
        concurrencyLimit: concurrencyLimit ?? this.concurrencyLimit,
      );
}
