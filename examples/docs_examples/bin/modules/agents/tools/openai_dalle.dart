// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_community/langchain_community.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main() async {
  final openAiKey = Platform.environment['OPENAI_API_KEY'];
  final llm = ChatOpenAI(
    apiKey: openAiKey,
    defaultOptions: const ChatOpenAIOptions(
      model: 'gpt-4-turbo',
      temperature: 0,
    ),
  );
  final tools = <Tool>[
    CalculatorTool(),
    OpenAIDallETool(apiKey: openAiKey),
  ];
  final agent = OpenAIFunctionsAgent.fromLLMAndTools(llm: llm, tools: tools);
  final executor = AgentExecutor(agent: agent);
  final res = await executor.run(
    'Calculate the result of 40 raised to the power of 0.43 and generate a funny illustration with it. '
    'Return ONLY the URL of the image. Do not add any explanation.',
  );
  print(res);
  // https://oaidalleapiprodscus.blob.core.windows.net/private/org-dtDDtkEGoFccn5xaP5W1p3Rr/user-3XZA7QXb1LF8ADMIxEZC0Qp4/img-EV9QNf2sNZfdjqmTnPp5RKMf.png?st=2023-11-19T14:54:29Z&se=2023-11-19T16:54:29Z&sp=r&sv=2021-08-06&sr=b&rscd=inline&rsct=image/png&skoid=6aaadede-4fb3-4698-a8f6-684d7786b067&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2023-11-18T20:08:16Z&ske=2023-11-19T20:08:16Z&sks=b&skv=2021-08-06&sig=vOi21StWgPSVBptFpxk1ToBphdWKWc3YcRPdHREAXGI%3D
}
