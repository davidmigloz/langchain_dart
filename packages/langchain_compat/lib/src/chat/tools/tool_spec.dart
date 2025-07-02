import 'tool_utils.dart';

/// The specification of a LangChain tool without the actual implementation.
class ToolSpec {
  /// Creates a [ToolSpec].
  ToolSpec({
    required this.name,
    required this.description,
    Map<String, dynamic>? inputJsonSchema,
    this.strict = false,
  }) : inputJsonSchema = normalizeAndValidateSchema(inputJsonSchema);

  /// The unique name of the tool that clearly communicates its purpose.
  final String name;

  /// Used to tell the model how/when/why to use the tool.
  /// You can provide few-shot examples as a part of the description.
  final String description;

  /// Schema to parse and validate tool's input arguments.
  /// Following the [JSON Schema specification](https://json-schema.org).
  ///
  /// Example:
  /// ```json
  /// {
  ///   'type': 'object',
  ///   'properties': {
  ///     'answer': {
  ///       'type': 'string',
  ///       'description': 'The answer to the question being asked',
  ///     },
  ///     'sources': {
  ///       'type': 'array',
  ///       'items': {'type': 'string'},
  ///       'description': 'The sources used to answer the question',
  ///     },
  ///   },
  ///   'required': ['answer', 'sources'],
  /// },
  /// ```
  final Map<String, dynamic> inputJsonSchema;

  /// Whether to enable strict schema adherence when generating the tool call.
  /// If set to true, the model will follow the exact schema defined in the
  /// [inputJsonSchema] field.
  ///
  /// This is only supported by some providers (e.g. OpenAI). Mind that when
  /// enabled, only a subset of JSON Schema may be supported. Check out the
  /// provider's tool calling documentation for more information.
  final bool strict;
}
