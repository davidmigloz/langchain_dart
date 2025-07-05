// ignore_for_file: avoid_print

import 'package:langchain_compat/langchain_compat.dart';

Future<void> main() async {
  print('=== Debug Logging Filter ===\n');

  // Test 1: No filter - should see all logs
  print('1. No filter (should see all):');
  Agent.loggingOptions = const LoggingOptions(filter: '');
  
  final agent1 = Agent('openai:gpt-4o-mini', systemPrompt: 'Test');
  await agent1.run([
    const ChatMessage(role: MessageRole.user, parts: [TextPart('Hi')]),
  ]);
  
  // Test 2: Filter 'chat.model' - should see system prompt logs
  print('\n2. Filter "chat.model" (should see system prompt logs):');
  Agent.loggingOptions = const LoggingOptions(filter: 'chat.model');
  
  await agent1.run([
    const ChatMessage(role: MessageRole.user, parts: [TextPart('Hi again')]),
  ]);
  
  // Test 3: Filter 'chat.models' - should see provider logs but not system prompt
  print('\n3. Filter "chat.models" (should see provider logs but not system prompt):');
  Agent.loggingOptions = const LoggingOptions(filter: 'chat.models');
  
  await agent1.run([
    const ChatMessage(role: MessageRole.user, parts: [TextPart('Hi third')]),
  ]);

  // Test 4: Debug - manually check logger names
  print('\n4. Logger name check:');
  print('Expected system prompt logger: "dartantic.chat.model"');
  print('"dartantic.chat.model".contains("chat.model"): ${"dartantic.chat.model".contains("chat.model")}');
  print('"dartantic.chat.model".contains("chat.models"): ${"dartantic.chat.model".contains("chat.models")}');
  
  agent1.dispose();
}