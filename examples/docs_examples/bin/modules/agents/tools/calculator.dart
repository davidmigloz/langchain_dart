// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_community/langchain_community.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final llm = ChatOpenAI(
    apiKey: openaiApiKey,
    defaultOptions: const ChatOpenAIOptions(model: 'gpt-4', temperature: 0),
  );
  final tool = CalculatorTool();
  final agent = ToolsAgent.fromLLMAndTools(llm: llm, tools: [tool]);
  final executor = AgentExecutor(agent: agent);
  final res = await executor.run('What is 40 raised to the 0.43 power? ');
  print(res); // -> '40 raised to the power of 0.43 is approximately 4.8852'
}
