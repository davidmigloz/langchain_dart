// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:json_schema/json_schema.dart' as js;
import 'package:langchain_compat/langchain_compat.dart';

void main() async {
  print('=== Typed Output Example ===\n');

  // Simple structured output with Anthropic
  print('--- Simple JSON Object (Anthropic) ---');
  var schema = js.JsonSchema.create({
    'type': 'object',
    'properties': {
      'name': {'type': 'string'},
      'age': {'type': 'integer'},
      'email': {'type': 'string'},
    },
    'required': ['name', 'age', 'email'],
  });

  // Use Agent with outputSchema
  var agent = Agent('anthropic:claude-3-5-haiku-latest');
  var result = await agent.run(
    'Generate a person object with name "Alice Smith", age 28, '
    'and email "alice@example.com"',
    outputSchema: schema,
  );

  print('Generated person:');
  print(const JsonEncoder.withIndent('  ').convert(jsonDecode(result.output)));

  // Array output with OpenAI
  print('\n--- Array Output (OpenAI) ---');
  schema = js.JsonSchema.create({
    'type': 'object',
    'properties': {
      'tasks': {
        'type': 'array',
        'items': {
          'type': 'object',
          'properties': {
            'id': {'type': 'integer'},
            'title': {'type': 'string'},
            'completed': {'type': 'boolean'},
          },
          'required': ['id', 'title', 'completed'],
        },
      },
    },
    'required': ['tasks'],
  });

  agent = Agent('openai:gpt-4o-mini');
  result = await agent.run(
    'Create a todo list with 3 items: '
    '1) "Write tests" (not completed), '
    '2) "Review PR" (completed), '
    '3) "Deploy to production" (not completed)',
    outputSchema: schema,
  );

  print('Generated todo list:');
  print(const JsonEncoder.withIndent('  ').convert(jsonDecode(result.output)));

  // Nested structure with Google
  print('\n--- Nested Structure (Google) ---');
  schema = js.JsonSchema.create({
    'type': 'object',
    'properties': {
      'company': {
        'type': 'object',
        'properties': {
          'name': {'type': 'string'},
          'founded': {'type': 'integer'},
          'employees': {
            'type': 'array',
            'items': {
              'type': 'object',
              'properties': {
                'name': {'type': 'string'},
                'role': {'type': 'string'},
                'department': {'type': 'string'},
              },
              'required': ['name', 'role'],
            },
          },
        },
        'required': ['name', 'founded', 'employees'],
      },
    },
    'required': ['company'],
  });

  agent = Agent('google:gemini-2.0-flash');
  result = await agent.run(
    'Create a tech company called "TechCorp" founded in 2020 with 3 employees: '
    'CEO John Doe, CTO Jane Smith in Engineering, '
    'and CFO Bob Johnson in Finance',
    outputSchema: schema,
  );

  print('Generated company structure:');
  print(const JsonEncoder.withIndent('  ').convert(jsonDecode(result.output)));

  // Enum constraints example
  print('\n--- Enum Constraints (Anthropic) ---');
  schema = js.JsonSchema.create({
    'type': 'object',
    'properties': {
      'order': {
        'type': 'object',
        'properties': {
          'id': {'type': 'string'},
          'status': {
            'type': 'string',
            'enum': [
              'pending',
              'processing',
              'shipped',
              'delivered',
              'cancelled',
            ],
          },
          'priority': {
            'type': 'string',
            'enum': ['low', 'medium', 'high', 'urgent'],
          },
          'paymentMethod': {
            'type': 'string',
            'enum': ['credit_card', 'debit_card', 'paypal', 'bank_transfer'],
          },
        },
        'required': ['id', 'status', 'priority', 'paymentMethod'],
      },
    },
    'required': ['order'],
  });

  agent = Agent('anthropic:claude-3-5-haiku-latest');
  result = await agent.run(
    'Create an order with ID "ORD-12345", status "processing", '
    'high priority, paid with credit card',
    outputSchema: schema,
  );

  print('Generated order:');
  print(const JsonEncoder.withIndent('  ').convert(jsonDecode(result.output)));

  // Complex real-world example
  print('\n--- Real-world Example: API Response (OpenAI) ---');
  schema = js.JsonSchema.create({
    'type': 'object',
    'properties': {
      'success': {'type': 'boolean'},
      'data': {
        'type': 'object',
        'properties': {
          'user': {
            'type': 'object',
            'properties': {
              'id': {'type': 'string'},
              'username': {'type': 'string'},
              'profile': {
                'type': 'object',
                'properties': {
                  'firstName': {'type': 'string'},
                  'lastName': {'type': 'string'},
                  'avatar': {'type': 'string'},
                },
              },
            },
          },
          'posts': {
            'type': 'array',
            'items': {
              'type': 'object',
              'properties': {
                'id': {'type': 'string'},
                'title': {'type': 'string'},
                'content': {'type': 'string'},
                'likes': {'type': 'integer'},
                'createdAt': {'type': 'string'},
              },
            },
          },
        },
      },
      'metadata': {
        'type': 'object',
        'properties': {
          'totalPosts': {'type': 'integer'},
          'page': {'type': 'integer'},
          'perPage': {'type': 'integer'},
        },
      },
    },
    'required': ['success', 'data'],
  });

  agent = Agent('openai:gpt-4o-mini');
  result = await agent.run(
    'Create a successful API response for user "john_doe" with 2 blog posts '
    'about programming. Include realistic metadata.',
    outputSchema: schema,
  );

  print('Generated API response:');
  print(const JsonEncoder.withIndent('  ').convert(jsonDecode(result.output)));

  exit(0);
}
