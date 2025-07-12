// Simple debug test for typed output
// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:json_schema/json_schema.dart' as js;
import 'package:langchain_compat/langchain_compat.dart';

void main() async {
  final schema = js.JsonSchema.create({
    'type': 'object',
    'properties': {
      'name': {'type': 'string'},
      'age': {'type': 'integer'},
    },
    'required': ['name', 'age'],
  });

  print('Testing Anthropic typed output...\n');

  final agent = Agent('anthropic');
  
  print('Calling runStream to see chunks...');
  var chunkCount = 0;
  final chunks = <ChatResult<String>>[];
  
  await for (final chunk in agent.runStream(
    'Generate a person with name "John" and age 30',
    outputSchema: schema,
  )) {
    chunkCount++;
    chunks.add(chunk);
    print('Chunk $chunkCount:');
    print('  output: "${chunk.output}"');
    print('  outputAsString: "${chunk.outputAsString}"');
    print('  messages: ${chunk.messages.length}');
    if (chunk.messages.isNotEmpty) {
      for (final msg in chunk.messages) {
        print('    - ${msg.role}: ${msg.parts.map((p) => p.runtimeType).join(', ')}');
        if (msg.text.isNotEmpty) {
          print('      text: "${msg.text.substring(0, msg.text.length.clamp(0, 50))}..."');
        }
      }
    }
  }
  
  print('\nTotal chunks: $chunkCount');
  
  print('\nNow calling run()...');
  final result = await agent.run(
    'Generate a person with name "John" and age 30',
    outputSchema: schema,
  );
  
  print('Result:');
  print('  output: "${result.output}"');
  print('  output length: ${result.output.length}');
  
  if (result.output.isEmpty) {
    print('\nERROR: Output is empty!');
  } else {
    try {
      final json = jsonDecode(result.output);
      print('  parsed JSON: $json');
    } catch (e) {
      print('  JSON parse error: $e');
    }
  }
}