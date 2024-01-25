import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:googleai_dart/googleai_dart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<void> _run() async {

    final client = GoogleAIClient(
      apiKey: 'AIzaSyDJU9hObzLx3n1F2LyWRbSLOm-wPlEaoPU',
    );

    print('Generating...');

    final res = client.generateContent(
    modelId: 'gemini-pro',
    request: const GenerateContentRequest(
      contents: [
        Content(
          parts: [
            Part(text: 'Write a story about a magic backpack.'),
          ],
        ),
      ],
      generationConfig: GenerationConfig(
        temperature: 0.8,
      ),
    ),
  );
    print('Generated!');

    inspect(res);
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo Home Page'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              _run();
            },
            child: const Text('Press me!'),
          )
        ),
      )
    );
  }
}
