import 'package:collection/collection.dart';
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/tools.dart';
import 'package:meta/meta.dart';

import '../chat_ollama/types.dart';
import 'chat_ollama_tools.dart';

export '../chat_ollama/types.dart';

/// {@template chat_ollama_tools_options}
/// Options to pass into [ChatOllamaTools].
/// {@endtemplate}
@immutable
class ChatOllamaToolsOptions extends ChatModelOptions {
  /// {@macro chat_ollama_tools_options}
  const ChatOllamaToolsOptions({
    this.options,
    super.tools,
    super.toolChoice,
    this.toolsSystemPromptTemplate,
  });

  /// [ChatOllamaOptions] to pass into Ollama.
  final ChatOllamaOptions? options;

  /// Prompt template for the system message where the model is instructed to
  /// use the tools.
  ///
  /// The following placeholders can be used:
  /// - `{tools}`: The list of tools available to the model.
  /// - `{tool_choice}`: the tool choice the model must always select.
  ///
  /// If not provided, [defaultToolsSystemPromtTemplate] will be used.
  final String? toolsSystemPromptTemplate;

  /// Default [toolsSystemPromptTemplate].
  static const String defaultToolsSystemPromtTemplate = '''
You have access to these tools: 
{tools}

Instructions:

Based on the user input, select {tool_choice} from the available tools.
Respond with a JSON object containing a "tool_calls" array.
Each tool call in the array should have:

"tool_name": The name of the selected tool (string)
"tool_input": A JSON string with the input for the tool

Example response format:
```json
{{
  "tool_calls": [
    {{
      "tool_name": "tool_name",
      "tool_input": "{{"param1":"value1","param2":"value2"}}"
    }}
  ]
}}
```

Important notes:

Ensure your response is valid JSON and follows this exact format.
If no new tools need to be called, respond with an empty "tool_calls" array.
If "tool_answer" is present anywhere, do not make a tool call. Instead, provide a response that incorporates the original question and the tool's answer.

Example combined response:

```json
{{
  "tool_calls": [],
  "output": "You asked about [original question]. Based on our [tool name], [incorporate tool answer]."
}}
```

Remember: Do not make a tool call if "tool_answer" is present in the response.
''';

  /// Creates a copy of this [ChatOllamaToolsOptions] object with the given
  /// fields replaced with the new values.
  ChatOllamaToolsOptions copyWith({
    ChatOllamaOptions? options,
    List<Tool>? tools,
    ChatToolChoice? toolChoice,
    String? toolsSystemPromptTemplate,
  }) {
    return ChatOllamaToolsOptions(
      options: options ?? this.options,
      tools: tools ?? this.tools,
      toolChoice: toolChoice ?? this.toolChoice,
      toolsSystemPromptTemplate:
          toolsSystemPromptTemplate ?? this.toolsSystemPromptTemplate,
    );
  }

  @override
  bool operator ==(covariant final ChatOllamaToolsOptions other) {
    return options == other.options &&
        const ListEquality<ToolSpec>().equals(tools, other.tools) &&
        toolChoice == other.toolChoice &&
        toolsSystemPromptTemplate == other.toolsSystemPromptTemplate;
  }

  @override
  int get hashCode {
    return options.hashCode ^
        const ListEquality<ToolSpec>().hash(tools) ^
        toolChoice.hashCode ^
        toolsSystemPromptTemplate.hashCode;
  }
}

/// Default tool called if model decides no other tools should be called
/// for a given query.
final conversationalResponseTool = StringTool.fromFunction(
  name: '_conversational_response',
  description:
      'Respond conversationally if no other tools should be called for a given query.',
  inputDescription: 'Conversational response to the user',
  func: (input) => input,
);
