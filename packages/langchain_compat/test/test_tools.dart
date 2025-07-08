import 'package:json_schema/json_schema.dart';
import 'package:langchain_compat/langchain_compat.dart';

/// Comprehensive set of tools for testing various return types and edge cases.
/// These tools are designed to thoroughly test the tool calling capabilities
/// of different providers.

// String return tools
final stringTool = Tool<Map<String, dynamic>>(
  name: 'string_tool',
  description: 'Returns a simple string',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'input': {'type': 'string'},
    },
    'required': ['input'],
  }),
  inputFromJson: (json) => json,
  onCall: (input) => 'String result: ${input['input']}',
);

final emptyStringTool = Tool<Map<String, dynamic>>(
  name: 'empty_string_tool',
  description: 'Returns an empty string',
  inputFromJson: (json) => json,
  onCall: (_) => '',
);

// Numeric return tools
final intTool = Tool<Map<String, dynamic>>(
  name: 'int_tool',
  description: 'Returns an integer',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'value': {'type': 'integer'},
    },
    'required': ['value'],
  }),
  inputFromJson: (json) => json,
  onCall: (input) => input['value'] as int,
);

final doubleTool = Tool<Map<String, dynamic>>(
  name: 'double_tool',
  description: 'Returns a double',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'value': {'type': 'number'},
    },
    'required': ['value'],
  }),
  inputFromJson: (json) => json,
  onCall: (input) => input['value'] as double,
);

// Boolean return tool
final boolTool = Tool<Map<String, dynamic>>(
  name: 'bool_tool',
  description: 'Returns a boolean',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'value': {'type': 'boolean'},
    },
    'required': ['value'],
  }),
  inputFromJson: (json) => json,
  onCall: (input) => input['value'] as bool,
);

// Null return tool
final nullTool = Tool<Map<String, dynamic>>(
  name: 'null_tool',
  description: 'Returns null',
  inputFromJson: (json) => json,
  onCall: (_) => null,
);

// Collection return tools
final listTool = Tool<Map<String, dynamic>>(
  name: 'list_tool',
  description: 'Returns a list',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'items': {
        'type': 'array',
        'items': {'type': 'string'},
      },
    },
    'required': ['items'],
  }),
  inputFromJson: (json) => json,
  onCall: (input) => input['items'] as List,
);

final emptyListTool = Tool<Map<String, dynamic>>(
  name: 'empty_list_tool',
  description: 'Returns an empty list',
  inputFromJson: (json) => json,
  onCall: (_) => [],
);

final mapTool = Tool<Map<String, dynamic>>(
  name: 'map_tool',
  description: 'Returns a map',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'key': {'type': 'string'},
      'value': {'type': 'string'},
    },
    'required': ['key', 'value'],
  }),
  inputFromJson: (json) => json,
  onCall: (input) => {
    (input['key'] as String?).toString(): input['value'],
    'type': 'map_result',
  },
);

final nestedMapTool = Tool<Map<String, dynamic>>(
  name: 'nested_map_tool',
  description: 'Returns a nested map structure',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'level': {'type': 'integer'},
    },
    'required': ['level'],
  }),
  inputFromJson: (json) => json,
  onCall: (input) => {
    'level': input['level'],
    'data': {
      'nested': true,
      'items': ['a', 'b', 'c'],
      'metadata': {'created': DateTime.now().toIso8601String(), 'version': 1.0},
    },
  },
);

// Edge case tools
final veryLongStringTool = Tool<Map<String, dynamic>>(
  name: 'very_long_string_tool',
  description: 'Returns a very long string',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'repeat_count': {'type': 'integer'},
    },
    'required': ['repeat_count'],
  }),
  inputFromJson: (json) => json,
  onCall: (input) {
    final count = input['repeat_count'] as int;
    return 'Lorem ipsum dolor sit amet. ' * count;
  },
);

final unicodeTool = Tool<Map<String, dynamic>>(
  name: 'unicode_tool',
  description: 'Returns unicode and emoji characters',
  inputFromJson: (json) => json,
  onCall: (_) => '👋 Hello 世界 🌍 नमस्ते мир',
);

final specialCharsTool = Tool<Map<String, dynamic>>(
  name: 'special_chars_tool',
  description: 'Returns special characters that need escaping',
  inputFromJson: (json) => json,
  onCall: (_) =>
      'Line 1\nLine 2\tTabbed\r\nWindows line\n"Quoted"\n\'Single quoted\'',
);

// Error testing tools
final errorTool = Tool<Map<String, dynamic>>(
  name: 'error_tool',
  description: 'Throws an error when called',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'error_message': {'type': 'string'},
    },
    'required': ['error_message'],
  }),
  inputFromJson: (json) => json,
  onCall: (input) => throw Exception(input['error_message']),
);

final invalidJsonTool = Tool<Map<String, dynamic>>(
  name: 'invalid_json_tool',
  description: 'Returns a value that might cause JSON encoding issues',
  inputFromJson: (json) => json,
  onCall: (_) => double.infinity,
);

// Tools for testing optional and default parameters
final optionalParamsTool = Tool<Map<String, dynamic>>(
  name: 'optional_params_tool',
  description: 'Tool with optional parameters',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'required_param': {'type': 'string'},
      'optional_param': {
        'type': 'string',
        'description': 'This parameter is optional',
      },
    },
    'required': ['required_param'],
  }),
  inputFromJson: (json) => json,
  onCall: (input) => {
    'required': input['required_param'],
    'optional': input['optional_param'] ?? 'default_value',
  },
);

// Tools for testing multiple tools in one call
final multiStepTool1 = Tool<Map<String, dynamic>>(
  name: 'step1',
  description: 'First step in a multi-tool process',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'input': {'type': 'string'},
    },
    'required': ['input'],
  }),
  inputFromJson: (json) => json,
  onCall: (input) => 'Step 1 processed: ${input['input']}',
);

final multiStepTool2 = Tool<Map<String, dynamic>>(
  name: 'step2',
  description: 'Second step that depends on step1',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'step1_result': {'type': 'string'},
    },
    'required': ['step1_result'],
  }),
  inputFromJson: (json) => json,
  onCall: (input) => 'Step 2 processed: ${input['step1_result']}',
);

// Tools for testing parameter validation
final strictTypeTool = Tool<Map<String, dynamic>>(
  name: 'strict_type_tool',
  description: 'Tool that requires specific types',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'string_param': {'type': 'string'},
      'int_param': {'type': 'integer'},
      'bool_param': {'type': 'boolean'},
      'array_param': {
        'type': 'array',
        'items': {'type': 'integer'},
      },
    },
    'required': ['string_param', 'int_param', 'bool_param', 'array_param'],
  }),
  inputFromJson: (json) => json,
  onCall: (input) => {
    'types_received': {
      'string': input['string_param'].runtimeType.toString(),
      'int': input['int_param'].runtimeType.toString(),
      'bool': input['bool_param'].runtimeType.toString(),
      'array': input['array_param'].runtimeType.toString(),
    },
    'values': input,
  },
);

// No-parameter tool
final noParamsTool = Tool<Map<String, dynamic>>(
  name: 'no_params_tool',
  description: 'Tool that takes no parameters',
  inputFromJson: (json) => json,
  onCall: (_) => 'Called with no parameters',
);

/// Returns all test tools for comprehensive testing
List<Tool> get allTestTools => [
  stringTool,
  emptyStringTool,
  intTool,
  doubleTool,
  boolTool,
  nullTool,
  listTool,
  emptyListTool,
  mapTool,
  nestedMapTool,
  veryLongStringTool,
  unicodeTool,
  specialCharsTool,
  errorTool,
  invalidJsonTool,
  optionalParamsTool,
  multiStepTool1,
  multiStepTool2,
  strictTypeTool,
  noParamsTool,
];

/// Returns a subset of tools for basic testing
List<Tool> get basicTestTools => [
  stringTool,
  intTool,
  boolTool,
  listTool,
  mapTool,
];

/// Returns tools that test edge cases
List<Tool> get edgeCaseTools => [
  emptyStringTool,
  nullTool,
  emptyListTool,
  veryLongStringTool,
  unicodeTool,
  specialCharsTool,
  noParamsTool,
];

/// Returns tools for error testing
List<Tool> get errorTestTools => [errorTool, invalidJsonTool];
