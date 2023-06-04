// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain_openai/langchain_openai.dart';

/// The most basic building block of LangChain is calling an LLM on some input.
void main() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final openai = OpenAI(apiKey: openaiApiKey, temperature: 0.9);
  const prompt = 'What would be a good company name '
      'for a company that makes colorful socks?';
  final result = await openai(prompt: prompt);
  print(result);
}
