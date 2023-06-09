import 'package:meta/meta.dart';

import '../prompts/models/models.dart';

/// Options for formatting instructions.
interface class FormatInstructionsOptions {}

/// Class to parse the output of an LLM call.
abstract class BaseOutputParser<T> {
  /// Parse the output of an LLM call.
  ///
  /// A method which takes in a string (assumed output of a language model)
  /// and parses it into some structure.
  ///
  /// [text] - LLM output to parse.
  Future<T> parse(final String text);

  /// Optional method to parse the output of an LLM call with a prompt.
  ///
  /// The prompt is largely provided in the event the OutputParser wants to
  /// retry or fix the output in some way, and needs information from the
  /// prompt to do so.
  ///
  /// [text] - LLM output to parse.
  /// [prompt] - Prompt used to generate the output.
  Future<T> parseWithPrompt(
    final String text,
    final PromptValue prompt,
  ) async {
    return parse(text);
  }

  /// Return a string describing the format of the LLM output.
  ///
  /// [options] - Options for formatting instructions.
  String getFormatInstructions([final FormatInstructionsOptions? options]);

  /// Return the string type key uniquely identifying this class of parser
  @visibleForOverriding
  String type();
}

/// Exception that output parsers should raise to signify a parsing error.
///
/// This exists to differentiate parsing errors from other code or execution
/// errors that also may arise inside the output parser. OutputParserExceptions
/// will be available to catch and handle in ways to fix the parsing error,
/// while other errors will be raised.
class OutputParserException implements Exception {
  const OutputParserException({
    this.message,
    this.llmOutput,
  });

  final String? message;
  final String? llmOutput;
}
