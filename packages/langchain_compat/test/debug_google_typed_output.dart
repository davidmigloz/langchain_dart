// Debug Google typed output issue
// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:json_schema/json_schema.dart' as js;
import 'package:langchain_compat/langchain_compat.dart';

void main() async {
  // Test nested objects
  final schema = js.JsonSchema.create({
    'type': 'object',
    'properties': {
      'user': {
        'type': 'object',
        'properties': {
          'name': {'type': 'string'},
          'email': {'type': 'string'},
        },
        'required': ['name', 'email'],
      },
      'settings': {
        'type': 'object',
        'properties': {
          'theme': {'type': 'string'},
          'notifications': {'type': 'boolean'},
        },
      },
    },
    'required': ['user', 'settings'],
  });

  print('Testing Google typed output with nested objects...\n');

  final agent = Agent('google');
  final result = await agent.run(
    'Create a user object with name "Alice", email "alice@example.com", '
    'theme "dark", and notifications enabled',
    outputSchema: schema,
  );

  print('Result output: "${result.output}"');
  
  try {
    final json = jsonDecode(result.output) as Map<String, dynamic>;
    print('\nParsed JSON:');
    print(const JsonEncoder.withIndent('  ').convert(json));
    
    print('\nChecking values:');
    print('  user: ${json['user']}');
    print('  user.name: ${json['user']?['name']}');
    print('  user.email: ${json['user']?['email']}');
    print('  settings: ${json['settings']}');
    
    if (json['user']?['name'] == null) {
      print('\nERROR: user.name is null!');
    }
  } catch (e) {
    print('JSON parse error: $e');
  }
}