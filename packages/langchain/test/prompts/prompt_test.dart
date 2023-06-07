// ignore_for_file: avoid_redundant_argument_values

import 'package:langchain/langchain.dart';
import 'package:langchain/src/prompts/template.dart';
import 'package:test/test.dart';

void main() {
  group('Prompt tests', () {
    test('Test prompts can be constructed', () {
      const template = 'This is a {foo} test.';
      final inputVariables = ['foo'];
      final prompt = PromptTemplate(
        inputVariables: inputVariables,
        template: template,
      );
      expect(prompt.template, template);
      expect(prompt.inputVariables, inputVariables);
    });

    test('Test error is raised when input variables are using reserved names',
        () {
      const template = 'This is a {stop} test.';
      const inputVariables = <String>['stop', ''];
      expect(
        () => PromptTemplate(
          inputVariables: inputVariables,
          template: template,
        ),
        throwsA(isA<AssertionError>()),
      );
    });

    test('Test prompts can be constructed from a template', () {
      // Single input variable.
      const template1 = 'This is a {foo} test.';
      final prompt1 = PromptTemplate.fromTemplate(template1);
      final expectedPrompt1 = PromptTemplate(
        template: template1,
        inputVariables: const ['foo'],
      );
      expect(prompt1, expectedPrompt1);

      // Multiple input variables
      const template2 = 'This {bar} is a {foo} test.';
      final prompt2 = PromptTemplate.fromTemplate(template2);
      final expectedPrompt2 = PromptTemplate(
        template: template2,
        inputVariables: const ['bar', 'foo'],
      );
      expect(prompt2, expectedPrompt2);

      // Multiple input variables with repeats
      const template3 = 'This {bar} is a {foo} test {foo}.';
      final prompt3 = PromptTemplate.fromTemplate(template3);
      final expectedPrompt3 = PromptTemplate(
        template: template3,
        inputVariables: const ['bar', 'foo'],
      );
      expect(prompt3, expectedPrompt3);
    });

    test('Test error is raised when input variables are not provided', () {
      const template = 'This is a {foo} test.';
      const inputVariables = <String>[];
      expect(
        () => PromptTemplate(
          inputVariables: inputVariables,
          template: template,
        ),
        throwsException,
      );
    });

    test('Test error is raised when there are too many input variables', () {
      const template = 'This is a {foo} test.';
      const inputVariables = ['foo', 'bar'];
      expect(
        () => PromptTemplate(
          inputVariables: inputVariables,
          template: template,
        ),
        throwsException,
      );
    });

    test('Test error is raised when name of input variable is wrong', () {
      const template = 'This is a {foo} test.';
      const inputVariables = ['bar'];
      expect(
        () => PromptTemplate(
          inputVariables: inputVariables,
          template: template,
        ),
        throwsException,
      );
    });

    test('Test error is raised when jinja2 template format is used', () {
      const template = 'This is a {foo} test.';
      const inputVariables = ['foo'];
      expect(
        () => PromptTemplate(
          inputVariables: inputVariables,
          template: template,
          templateFormat: TemplateFormat.jinja2,
        ),
        throwsException,
      );
    });

    test('Test prompt can be successfully constructed from examples', () {
      const template = '''
Test Prompt:

Question: who are you?
Answer: foo

Question: what are you?
Answer: bar

Question: {question}
Answer:''';
      const inputVariables = ['question'];
      const exampleSeparator = '\n\n';
      const prefix = 'Test Prompt:';
      const suffix = 'Question: {question}\nAnswer:';
      const examples = [
        'Question: who are you?\nAnswer: foo',
        'Question: what are you?\nAnswer: bar',
      ];

      final promptFromExamples = PromptTemplate.fromExamples(
        examples: examples,
        suffix: suffix,
        inputVariables: inputVariables,
        exampleSeparator: exampleSeparator,
        prefix: prefix,
      );
      final promptFromTemplate = PromptTemplate(
        template: template,
        inputVariables: inputVariables,
      );
      expect(promptFromExamples, promptFromTemplate);
    });
  });

  test('Test prompt can be successfully constructed from a file', () async {
    const templateFile = './test/prompts/assets/prompt_file.txt';
    const inputVariables = ['question'];
    final prompt = await PromptTemplate.fromFile(templateFile, inputVariables);
    expect(prompt.template, 'Question: {question}\nAnswer:');
  });

  test('Test prompt can be initialized with partial variables', () {
    const template = 'This is a {foo} test.';
    final prompt = PromptTemplate(
      inputVariables: const [],
      template: template,
      partialVariables: const {'foo': 1},
    );
    expect(prompt.template, template);
    expect(prompt.inputVariables, <String>[]);
    final result = prompt.format();
    expect(result, 'This is a 1 test.');
  });

  test('Test prompt can be initialized with partial variables', () {
    const template = 'This is a {foo} test.';
    final prompt = PromptTemplate(
      inputVariables: const [],
      template: template,
      partialVariables: const {'foo': 2},
    );
    expect(prompt.template, template);
    expect(prompt.inputVariables, <String>[]);
    final result = prompt.format();
    expect(result, 'This is a 2 test.');
  });

  test('Test prompt can be partial', () {
    const template = 'This is a {foo} test.';
    final prompt = PromptTemplate(
      inputVariables: const ['foo'],
      template: template,
    );
    expect(prompt.template, template);
    expect(prompt.inputVariables, ['foo']);

    final newPrompt = prompt.partial({'foo': '3'});
    final newResult = newPrompt.format();
    expect(newResult, 'This is a 3 test.');

    final result = prompt.format({'foo': 'foo'});
    expect(result, 'This is a foo test.');
  });

  test('Test another partial prompt', () {
    final prompt = PromptTemplate(
      template: '{foo}{bar}',
      inputVariables: const ['foo'],
      partialVariables: const {'bar': 'baz'},
    );
    expect(prompt.format({'foo': 'foo'}), 'foobaz');
  });

  test('Test using full partial', () {
    final prompt = PromptTemplate(
      template: '{foo}{bar}',
      inputVariables: const [],
      partialVariables: const {'bar': 'baz', 'foo': 'boo'},
    );
    expect(prompt.format({}), 'boobaz');
  });

  test('Test partial', () {
    final prompt = PromptTemplate(
      template: '{foo}{bar}',
      inputVariables: const ['foo', 'bar'],
    );
    expect(prompt.inputVariables, ['foo', 'bar']);
    final partialPrompt = prompt.partial({'foo': 'foo'});
    // original prompt is not modified
    expect(prompt.inputVariables, ['foo', 'bar']);
    // partial prompt has only remaining variables
    expect(partialPrompt.inputVariables, ['bar']);
    expect(partialPrompt.format({'bar': 'baz'}), 'foobaz');
  });
}
