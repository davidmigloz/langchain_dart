// ignore_for_file: avoid_redundant_argument_values
import 'package:langchain/src/model_io/chat_models/chat_models.dart';
import 'package:langchain/src/model_io/prompts/prompts.dart';
import 'package:test/test.dart';

void main() {
  group('ChatPromptTemplate tests', () {
    test('Create a chat prompt template', () {
      final prompt = ChatPromptTemplate.fromTemplate('hi {foo} {bar}');
      expect(
        prompt.promptMessages,
        [HumanChatMessagePromptTemplate.fromTemplate('hi {foo} {bar}')],
      );
    });

    test('Test format', () {
      final chatPrompt = _createChatPromptTemplate();
      final messages = chatPrompt.formatPrompt({
        'context': 'This is a context',
        'foo': 'Foo',
        'bar': 'Bar',
      });
      expect(messages.toChatMessages(), [
        ChatMessage.system("Here's some context: This is a context"),
        ChatMessage.humanText(
          "Hello Foo, I'm Bar. Thanks for the This is a context",
        ),
        ChatMessage.ai("I'm an AI. I'm Foo. I'm Bar."),
        ChatMessage.custom(
          "I'm a generic message. I'm Foo. I'm Bar.",
          role: 'test',
        ),
      ]);
    });

    test('Test ChatPromptTemplate.fromTemplates', () {
      final chatPrompt = ChatPromptTemplate.fromTemplates(
        const [
          (ChatMessageType.system, "Here's some context: {context}"),
          (
            ChatMessageType.human,
            "Hello {foo}, I'm {bar}. Thanks for the {context}"
          ),
          (ChatMessageType.ai, "I'm an AI. I'm {foo}. I'm {bar}."),
          (
            ChatMessageType.custom,
            "I'm a generic message. I'm {foo}. I'm {bar}."
          ),
        ],
        customRole: 'test',
      );
      final messages = chatPrompt.formatPrompt({
        'context': 'This is a context',
        'foo': 'Foo',
        'bar': 'Bar',
      });
      expect(messages.toChatMessages(), [
        ChatMessage.system("Here's some context: This is a context"),
        ChatMessage.humanText(
          "Hello Foo, I'm Bar. Thanks for the This is a context",
        ),
        ChatMessage.ai("I'm an AI. I'm Foo. I'm Bar."),
        ChatMessage.custom(
          "I'm a generic message. I'm Foo. I'm Bar.",
          role: 'test',
        ),
      ]);
    });

    test('Test ChatPromptTemplate.fromPromptMessages with factory constructors',
        () {
      final chatPrompt = ChatPromptTemplate.fromPromptMessages(
        [
          ChatMessagePromptTemplate.system(
            "Here's some context: {context}",
          ),
          ChatMessagePromptTemplate.human(
            "Hello {foo}, I'm {bar}. Thanks for the {context}",
          ),
          ChatMessagePromptTemplate.ai(
            "I'm an AI. I'm {foo}. I'm {bar}.",
          ),
          ChatMessagePromptTemplate.custom(
            "I'm a generic message. I'm {foo}. I'm {bar}.",
            role: 'test',
          ),
        ],
      );
      final messages = chatPrompt.formatPrompt({
        'context': 'This is a context',
        'foo': 'Foo',
        'bar': 'Bar',
      });
      expect(messages.toChatMessages(), [
        ChatMessage.system("Here's some context: This is a context"),
        ChatMessage.humanText(
          "Hello Foo, I'm Bar. Thanks for the This is a context",
        ),
        ChatMessage.ai("I'm an AI. I'm Foo. I'm Bar."),
        ChatMessage.custom(
          "I'm a generic message. I'm Foo. I'm Bar.",
          role: 'test',
        ),
      ]);
    });

    test('Test format with invalid input variables', () {
      const systemPrompt = PromptTemplate(
        template: "Here's some context: {context}",
        inputVariables: {'context'},
      );
      const userPrompt = PromptTemplate(
        template: "Hello {foo}, I'm {bar}",
        inputVariables: {'foo', 'bar'},
      );
      expect(
        () => const ChatPromptTemplate(
          promptMessages: [
            SystemChatMessagePromptTemplate(prompt: systemPrompt),
            HumanChatMessagePromptTemplate(prompt: userPrompt),
          ],
          inputVariables: {'context', 'foo', 'bar', 'baz'},
        ).validateTemplate(),
        throwsA(isA<TemplateValidationException>()),
      );
      expect(
        () => const ChatPromptTemplate(
          promptMessages: [
            SystemChatMessagePromptTemplate(prompt: systemPrompt),
            HumanChatMessagePromptTemplate(prompt: userPrompt),
          ],
          inputVariables: {'context', 'foo'},
        ).validateTemplate(),
        throwsA(isA<TemplateValidationException>()),
      );
    });

    test('Create a chat prompt template with partials', () {
      final prompt = ChatPromptTemplate.fromTemplate(
        'hi {foo} {bar}',
        partialVariables: const {'foo': 'jim'},
      );
      const expectedPrompt = PromptTemplate(
        template: 'hi {foo} {bar}',
        inputVariables: {'bar'},
        partialVariables: {'foo': 'jim'},
      );
      expect(prompt.promptMessages.length, 1);
      final outputPrompt = prompt.promptMessages[0];
      expect(outputPrompt is HumanChatMessagePromptTemplate, true);
      expect(
        (outputPrompt as HumanChatMessagePromptTemplate).prompt,
        expectedPrompt,
      );
    });

    test('Test chat prompt can be partial', () {
      const template = 'hi {foo} {bar}';
      final prompt = ChatPromptTemplate.fromTemplate(template);
      final expectedPrompt = ChatPromptTemplate(
        inputVariables: const {'foo', 'bar'},
        promptMessages: [HumanChatMessagePromptTemplate.fromTemplate(template)],
      );
      expect(prompt, expectedPrompt);

      final partialPrompt1 = prompt.partial(const {'foo': 'jim'});
      const expectedPrompt1 = ChatPromptTemplate(
        inputVariables: {'bar'},
        partialVariables: {'foo': 'jim'},
        promptMessages: [
          HumanChatMessagePromptTemplate(
            prompt: PromptTemplate(
              inputVariables: {'bar'},
              partialVariables: {'foo': 'jim'},
              template: template,
            ),
          ),
        ],
      );
      expect(partialPrompt1, expectedPrompt1);

      final partialPrompt2 = partialPrompt1.partial(const {'bar': 'morrison'});
      const expectedPrompt2 = ChatPromptTemplate(
        inputVariables: {},
        partialVariables: {'foo': 'jim', 'bar': 'morrison'},
        promptMessages: [
          HumanChatMessagePromptTemplate(
            prompt: PromptTemplate(
              inputVariables: {},
              partialVariables: {'foo': 'jim', 'bar': 'morrison'},
              template: template,
            ),
          ),
        ],
      );
      expect(partialPrompt2, expectedPrompt2);
    });

    test('Test using partial', () {
      const userPrompt = PromptTemplate(
        template: '{foo}{bar}',
        inputVariables: {'foo', 'bar'},
      );

      const prompt = ChatPromptTemplate(
        promptMessages: [HumanChatMessagePromptTemplate(prompt: userPrompt)],
        inputVariables: {'foo', 'bar'},
      );

      final partialPrompt = prompt.partial({'foo': 'foo'});

      expect(prompt.inputVariables, ['foo', 'bar']);
      expect(partialPrompt.inputVariables, ['bar']);

      expect(partialPrompt.format({'bar': 'baz'}), 'Human: foobaz');
    });

    test('Load chat prompt template from file', () async {
      const templateFile = './test/model_io/prompts/assets/prompt_file.txt';
      final expected = CustomChatMessagePromptTemplate.fromTemplate(
        'Question: {question}\nAnswer:',
        role: 'human',
      );
      final actual = await CustomChatMessagePromptTemplate.fromTemplateFile(
        templateFile,
        role: 'human',
      );
      expect(expected, actual);
    });

    test('Test chat prompt template', () {
      final promptTemplate = _createChatPromptTemplate();
      final prompt = promptTemplate.formatPrompt(
        {
          'foo': 'foo',
          'bar': 'bar',
          'context': 'context',
        },
      );
      expect(prompt is ChatPromptValue, true);
      final messages = prompt.toChatMessages();
      expect(messages.length, 4);
      expect(
        messages[0].contentAsString,
        "Here's some context: context",
      );
      expect(
        messages[1].contentAsString,
        "Hello foo, I'm bar. Thanks for the context",
      );
      expect(
        messages[2].contentAsString,
        "I'm an AI. I'm foo. I'm bar.",
      );
      expect(
        messages[3].contentAsString,
        "I'm a generic message. I'm foo. I'm bar.",
      );

      final string = prompt.toString();
      const expected =
          "System: Here's some context: context\nHuman: Hello foo, "
          "I'm bar. Thanks for the context\nAI: I'm an AI. I'm foo. I'm bar.\n"
          "test: I'm a generic message. I'm foo. I'm bar.";
      expect(string, expected);

      final string2 = promptTemplate.format(
        {
          'foo': 'foo',
          'bar': 'bar',
          'context': 'context',
        },
      );
      expect(string2, expected);
    });

    test('Test creating a chat prompt template from messages', () {
      final chatPromptTemplate =
          ChatPromptTemplate.fromPromptMessages(_createMessages());
      expect(
        chatPromptTemplate.inputVariables,
        {'context', 'foo', 'bar'},
      );
      expect(chatPromptTemplate.promptMessages.length, 4);
    });

    test('Test fromPromptMessages', () {
      const systemPrompt = PromptTemplate(
        template: "Here's some context: {context}",
        inputVariables: {'context'},
      );
      const userPrompt = PromptTemplate(
        template: "Hello {foo}, I'm {bar}",
        inputVariables: {'foo', 'bar'},
      );
      final chatPrompt = ChatPromptTemplate.fromPromptMessages(const [
        SystemChatMessagePromptTemplate(prompt: systemPrompt),
        HumanChatMessagePromptTemplate(prompt: userPrompt),
      ]);
      expect(chatPrompt.inputVariables, ['context', 'foo', 'bar']);
      final messages = chatPrompt.formatPrompt({
        'context': 'This is a context',
        'foo': 'Foo',
        'bar': 'Bar',
      });
      expect(messages.toChatMessages(), [
        ChatMessage.system("Here's some context: This is a context"),
        ChatMessage.humanText("Hello Foo, I'm Bar"),
      ]);
    });

    test('Test SimpleMessagePromptTemplate', () {
      const prompt = MessagesPlaceholder(variableName: 'foo');
      final values = {
        'foo': [ChatMessage.humanText("Hello Foo, I'm Bar")],
      };
      final messages = prompt.formatMessages(values);
      expect(messages, [ChatMessage.humanText("Hello Foo, I'm Bar")]);
    });

    test('Test MessagesPlaceholder', () {
      final chatPromptTemplate = ChatPromptTemplate.fromPromptMessages([
        const MessagesPlaceholder(variableName: 'conversation'),
        HumanChatMessagePromptTemplate.fromTemplate(
          'Summarize our conversation so far in {word_count} words.',
        ),
      ]);

      expect(
        chatPromptTemplate.inputVariables,
        {'conversation', 'word_count'},
      );

      final humanMessage = ChatMessage.humanText(
        'What is the best way to learn programming?',
      );
      final aiMessage = ChatMessage.ai('''
1. Choose a programming language: Decide on a programming language that you want to learn. 

2. Start with the basics: Familiarize yourself with the basic programming concepts such as variables, data types and control structures.

3. Practice, practice, practice: The best way to learn programming is through hands-on experience
        ''');

      final promptValue = chatPromptTemplate.formatPrompt(
        {
          'conversation': [humanMessage, aiMessage],
          'word_count': 10,
        },
      );

      expect(promptValue is ChatPromptValue, true);
      final chatPromptValue = promptValue as ChatPromptValue;

      expect(chatPromptValue.messages.length, 3);
      expect(chatPromptValue.messages[0], isA<HumanChatMessage>());
      expect(
        chatPromptValue.messages[0].contentAsString,
        startsWith('What is the best way to learn programming?'),
      );
      expect(chatPromptValue.messages[1], isA<AIChatMessage>());
      expect(
        chatPromptValue.messages[1].contentAsString,
        startsWith('1. Choose a programming language:'),
      );
      expect(chatPromptValue.messages[2], isA<HumanChatMessage>());
      expect(
        chatPromptValue.messages[2].contentAsString,
        startsWith('Summarize our conversation so far in 10 words.'),
      );
    });
  });
}

List<ChatMessagePromptTemplate> _createMessages() {
  return [
    SystemChatMessagePromptTemplate.fromTemplate(
      "Here's some context: {context}",
    ),
    HumanChatMessagePromptTemplate.fromTemplate(
      "Hello {foo}, I'm {bar}. Thanks for the {context}",
    ),
    AIChatMessagePromptTemplate.fromTemplate(
      "I'm an AI. I'm {foo}. I'm {bar}.",
    ),
    CustomChatMessagePromptTemplate.fromTemplate(
      "I'm a generic message. I'm {foo}. I'm {bar}.",
      role: 'test',
    ),
  ];
}

ChatPromptTemplate _createChatPromptTemplate() {
  return ChatPromptTemplate.fromPromptMessages(_createMessages());
}
