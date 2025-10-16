// ignore_for_file: public_member_api_docs, avoid_print, unnecessary_async
// Copyright 2024 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_firebase/langchain_firebase.dart';

void main() async {
  await initFirebase();
  runApp(const GenerativeAISample());
}

Future<void> initFirebase() async {
  await Firebase.initializeApp(
    // Replace these values with your own Firebase project configuration
    options: const FirebaseOptions(
      apiKey: 'apiKey',
      appId: 'appId',
      projectId: 'projectId',
      storageBucket: 'storageBucket',
      messagingSenderId: 'messagingSenderId',
    ),
  );
}

class GenerativeAISample extends StatelessWidget {
  const GenerativeAISample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter + Firebase Vertex AI + LangChain.dart',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: const Color.fromARGB(255, 171, 222, 244),
        ),
        useMaterial3: true,
      ),
      home: const ChatScreen(
        title: 'Flutter + Firebase Vertex AI + LangChain.dart',
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.title});

  final String title;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: const ChatWidget(),
    );
  }
}

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  late final ChatFirebaseVertexAI _model;
  late final RunnableSequence<ChatMessage, ChatResult> _chain;
  late final ConversationBufferMemory _memory;
  late final Tool exchangeRateTool;

  final _scrollController = ScrollController();
  final _textController = TextEditingController();
  final _textFieldFocus = FocusNode();
  final _generatedContent = <({Image? image, String? text, bool fromUser})>[];
  var _loading = false;

  @override
  void initState() {
    super.initState();
    _memory = ConversationBufferMemory(returnMessages: true);
    exchangeRateTool = Tool.fromFunction(
      name: 'findExchangeRate',
      description:
          'Returns the exchange rate between currencies on given date.',
      inputJsonSchema: {
        'type': 'object',
        'properties': {
          'currencyDate': {
            'type': 'string',
            'description':
                'A date in YYYY-MM-DD format or '
                'the exact value "latest" if a time period is not specified.',
          },
          'currencyFrom': {
            'type': 'string',
            'description':
                'The currency code of the currency to convert from, '
                'such as "USD".',
          },
          'currencyTo': {
            'type': 'string',
            'description':
                'The currency code of the currency to convert to, '
                'such as "USD".',
          },
        },
        'required': ['currencyDate', 'currencyFrom', 'currencyTo'],
      },
      func: (Map<String, Object?> input) async => {
        // This hypothetical API returns a JSON such as:
        // {"base":"USD","date":"2024-04-17","rates":{"SEK": 0.091}}
        'date': input['currencyDate'],
        'base': input['currencyFrom'],
        'rates': {input['currencyTo']! as String: 0.091},
      },
    );
    final promptTemplate = ChatPromptTemplate.fromTemplates(const [
      (ChatMessageType.system, 'You are a helpful assistant.'),
      (ChatMessageType.messagesPlaceholder, 'history'),
      (ChatMessageType.messagePlaceholder, 'input'),
    ]);
    final baseChain = Runnable.mapInput(
      (ChatMessage input) async => {
        'input': input,
        ...await _memory.loadMemoryVariables(),
      },
    ).pipe(promptTemplate);

    _model = ChatFirebaseVertexAI(
      defaultOptions: ChatFirebaseVertexAIOptions(
        model: 'gemini-1.5-pro',
        tools: [exchangeRateTool],
      ),
      // location: 'us-central1',
    );
    _chain = baseChain.pipe(_model);
  }

  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 750),
        curve: Curves.easeOutCirc,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textFieldDecoration = InputDecoration(
      contentPadding: const EdgeInsets.all(15),
      hintText: 'Enter a prompt...',
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(14)),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(14)),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemBuilder: (context, idx) {
                final content = _generatedContent[idx];
                return MessageWidget(
                  text: content.text,
                  image: content.image,
                  isFromUser: content.fromUser,
                );
              },
              itemCount: _generatedContent.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    autofocus: true,
                    focusNode: _textFieldFocus,
                    decoration: textFieldDecoration,
                    controller: _textController,
                    onSubmitted: _sendChatMessage,
                  ),
                ),
                const SizedBox.square(dimension: 15),
                IconButton(
                  tooltip: 'tokenCount Test',
                  onPressed: !_loading
                      ? () async {
                          await _testCountToken();
                        }
                      : null,
                  icon: Icon(
                    Icons.numbers,
                    color: _loading
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.primary,
                  ),
                ),
                IconButton(
                  tooltip: 'function calling Test',
                  onPressed: !_loading
                      ? () async {
                          await _testFunctionCalling();
                        }
                      : null,
                  icon: Icon(
                    Icons.functions,
                    color: _loading
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.primary,
                  ),
                ),
                IconButton(
                  tooltip: 'image prompt',
                  onPressed: !_loading
                      ? () async {
                          await _sendImagePrompt(_textController.text);
                        }
                      : null,
                  icon: Icon(
                    Icons.image,
                    color: _loading
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.primary,
                  ),
                ),
                IconButton(
                  tooltip: 'storage prompt',
                  onPressed: !_loading
                      ? () async {
                          await _sendStorageUriPrompt(_textController.text);
                        }
                      : null,
                  icon: Icon(
                    Icons.folder,
                    color: _loading
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.primary,
                  ),
                ),
                if (!_loading)
                  IconButton(
                    onPressed: () async {
                      await _sendChatMessage(_textController.text);
                    },
                    icon: Icon(
                      Icons.send,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  )
                else
                  const CircularProgressIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _sendStorageUriPrompt(String message) async {
    setState(() {
      _loading = true;
    });
    try {
      final chatMessage = ChatMessage.human(
        ChatMessageContent.multiModal([
          ChatMessageContent.text(message),
          ChatMessageContent.image(
            mimeType: 'image/jpeg',
            data: 'gs://vertex-ai-example-ef5a2.appspot.com/foodpic.jpg',
          ),
        ]),
      );

      _generatedContent.add((image: null, text: message, fromUser: true));

      final response = await _chain.invoke(chatMessage);
      final text = response.output.content;
      _generatedContent.add((image: null, text: text, fromUser: false));

      if (text.isEmpty) {
        await _showError('No response from API.');
        return;
      } else {
        setState(() {
          _loading = false;
          _scrollDown();
        });
      }
    } catch (e) {
      await _showError(e.toString());
      setState(() {
        _loading = false;
      });
    } finally {
      _textController.clear();
      setState(() {
        _loading = false;
      });
      _textFieldFocus.requestFocus();
    }
  }

  Future<void> _sendImagePrompt(String message) async {
    setState(() {
      _loading = true;
    });
    try {
      final ByteData catBytes = await rootBundle.load('assets/images/cat.jpg');
      final ByteData sconeBytes = await rootBundle.load(
        'assets/images/scones.jpg',
      );
      final chatMessage = ChatMessage.human(
        ChatMessageContent.multiModal([
          ChatMessageContent.text(message),
          ChatMessageContent.image(
            mimeType: 'image/jpeg',
            data: base64Encode(catBytes.buffer.asUint8List()),
          ),
          ChatMessageContent.image(
            mimeType: 'image/jpeg',
            data: base64Encode(sconeBytes.buffer.asUint8List()),
          ),
        ]),
      );

      _generatedContent
        ..add((
          image: Image.asset('assets/images/cat.jpg'),
          text: message,
          fromUser: true,
        ))
        ..add((
          image: Image.asset('assets/images/scones.jpg'),
          text: null,
          fromUser: true,
        ));

      final response = await _chain.invoke(chatMessage);

      final text = response.output.content;
      _generatedContent.add((image: null, text: text, fromUser: false));

      if (text.isEmpty) {
        await _showError('No response from API.');
        return;
      } else {
        await _memory.saveContext(
          inputValues: {'input': chatMessage},
          outputValues: {'output': response.output},
        );
        setState(() {
          _loading = false;
          _scrollDown();
        });
      }
    } catch (e) {
      await _showError(e.toString());
      setState(() {
        _loading = false;
      });
    } finally {
      _textController.clear();
      setState(() {
        _loading = false;
      });
      _textFieldFocus.requestFocus();
    }
  }

  Future<void> _sendChatMessage(String message) async {
    setState(() {
      _textController.clear();
      _loading = true;
    });

    try {
      final chatMessage = ChatMessage.humanText(message);

      _generatedContent.add((image: null, text: message, fromUser: true));
      final response = await _chain.invoke(chatMessage);
      final text = response.output.content;
      _generatedContent.add((image: null, text: text, fromUser: false));

      if (text.isEmpty) {
        await _showError('No response from API.');
        return;
      } else {
        await _memory.saveContext(
          inputValues: {'input': chatMessage},
          outputValues: {'output': response.output},
        );
        setState(() {
          _loading = false;
          _scrollDown();
        });
      }
    } catch (e) {
      await _showError(e.toString());
      setState(() {
        _loading = false;
      });
    } finally {
      _textController.clear();
      setState(() {
        _loading = false;
      });
      _textFieldFocus.requestFocus();
    }
  }

  Future<void> _testFunctionCalling() async {
    setState(() {
      _loading = true;
    });
    final chatMessage = ChatMessage.humanText(
      'How much is 50 US dollars worth in Swedish krona?',
    );

    // Send the message to the generative model.
    var response = await _chain.invoke(chatMessage);
    await _memory.saveContext(
      inputValues: {'input': chatMessage},
      outputValues: {'output': response.output},
    );

    final toolCalls = response.output.toolCalls;
    // When the model response with a function call, invoke the function.
    if (toolCalls.isNotEmpty) {
      final toolCall = toolCalls.first;
      final result = switch (toolCall.name) {
        // Forward arguments to the hypothetical API.
        'findExchangeRate' => await exchangeRateTool.invoke(toolCall.arguments),
        // Throw an exception if the model attempted to call a function that was
        // not declared.
        _ => throw UnimplementedError(
          'Function not implemented: ${toolCall.name}',
        ),
      };
      // Send the response to the model so that it can use the result to generate
      // text for the user.
      final toolMessage = ChatMessage.tool(
        toolCallId: toolCall.id,
        content: jsonEncode(result),
      );

      response = await _chain.invoke(toolMessage);
      await _memory.saveContext(
        inputValues: {'input': chatMessage},
        outputValues: {'output': response.output},
      );
    }
    // When the model responds with non-null text content, print it.
    if (response.output.content.isNotEmpty) {
      _generatedContent.add((
        image: null,
        text: response.output.content,
        fromUser: false,
      ));
      setState(() {
        _loading = false;
      });
    }
  }

  Future<void> _testCountToken() async {
    setState(() {
      _loading = true;
    });

    const prompt = 'tell a short story';
    final response = await _model.countTokens(PromptValue.string(prompt));
    print('token: $response');

    setState(() {
      _loading = false;
    });
  }

  Future<void> _showError(String message) async {
    await showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Something went wrong'),
          content: SingleChildScrollView(child: SelectableText(message)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class MessageWidget extends StatelessWidget {
  final Image? image;
  final String? text;
  final bool isFromUser;

  const MessageWidget({
    super.key,
    this.image,
    this.text,
    required this.isFromUser,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isFromUser
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600),
            decoration: BoxDecoration(
              color: isFromUser
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(18),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            margin: const EdgeInsets.only(bottom: 8),
            child: Column(
              children: [
                if (text case final text?) MarkdownBody(data: text),
                if (image case final image?) image,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
