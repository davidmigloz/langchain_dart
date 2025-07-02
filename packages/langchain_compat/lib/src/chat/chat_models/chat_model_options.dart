import 'package:meta/meta.dart';
import '../../language_models/language_model_options.dart';
import '../../language_models/language_models.dart';

/// Generation options to pass into the Chat Model.
@immutable
abstract class ChatModelOptions extends LanguageModelOptions {
  /// Creates a new chat model options instance.
  const ChatModelOptions({super.concurrencyLimit});

  @override
  ChatModelOptions copyWith({int? concurrencyLimit});
}
