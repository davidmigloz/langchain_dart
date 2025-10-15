// ignore_for_file: avoid_print, unused_element
import 'dart:convert';
import 'dart:io';

import 'package:googleapis_auth/auth_io.dart';
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_google/langchain_google.dart';

void main() async {
  // Uncomment the example you want to run:
  await _example1();
  // await _example2();
}

/// The most basic building block of LangChain is calling an LLM on some input.
Future<void> _example1() async {
  final llm = VertexAI(
    authProvider: _getAuthProvider(),
    project: _getProjectId(),
    defaultOptions: const VertexAIOptions(
      temperature: 0.9,
    ),
  );
  final result = await llm('Tell me a joke');
  print(result);
}

/// The most frequent use case is to create a chat-bot.
/// This is the most basic one.
Future<void> _example2() async {
  final chat = ChatVertexAI(
    authProvider: _getAuthProvider(),
    project: _getProjectId(),
    defaultOptions: const ChatVertexAIOptions(
      temperature: 0,
    ),
  );

  while (true) {
    stdout.write('> ');
    final usrMsg = ChatMessage.humanText(stdin.readLineSync() ?? '');
    final aiMsg = await chat([usrMsg]);
    print(aiMsg.content);
  }
}

HttpClientAuthProvider _getAuthProvider() {
  final serviceAccountCredentials = ServiceAccountCredentials.fromJson(
    json.decode(Platform.environment['VERTEX_AI_SERVICE_ACCOUNT']!),
  );
  return HttpClientAuthProvider(
    credentials: serviceAccountCredentials,
    scopes: [VertexAI.cloudPlatformScope],
  );
}

String _getProjectId() {
  return Platform.environment['VERTEX_AI_PROJECT_ID']!;
}
