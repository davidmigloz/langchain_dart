// ignore_for_file: avoid_redundant_argument_values
import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('PromptTemplate tests', () {
    test('Test prompts can be constructed', () {
      const template = 'This is a {foo} test.';
      final inputVariables = {'foo'};
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
      const inputVariables = {'stop', ''};
      expect(
        () => const PromptTemplate(
          inputVariables: inputVariables,
          template: template,
        ).validateTemplate(),
        throwsA(isA<TemplateValidationException>()),
      );
    });

    test('Test prompts can be constructed from a template', () {
      // Single input variable.
      const template1 = 'This is a {foo} test.';
      final prompt1 = PromptTemplate.fromTemplate(template1);
      const expectedPrompt1 = PromptTemplate(
        template: template1,
        inputVariables: {'foo'},
      );
      expect(prompt1, expectedPrompt1);

      // Multiple input variables
      const template2 = 'This {bar} is a {foo} test.';
      final prompt2 = PromptTemplate.fromTemplate(template2);
      const expectedPrompt2 = PromptTemplate(
        template: template2,
        inputVariables: {'bar', 'foo'},
      );
      expect(prompt2, expectedPrompt2);

      // Multiple input variables with repeats
      const template3 = 'This {bar} is a {foo} test {foo}.';
      final prompt3 = PromptTemplate.fromTemplate(template3);
      const expectedPrompt3 = PromptTemplate(
        template: template3,
        inputVariables: {'bar', 'foo'},
      );
      expect(prompt3, expectedPrompt3);
    });

    test('Create a prompt template with partials', () {
      const template = 'This is a {foo} {bar} test.';
      final prompt = PromptTemplate.fromTemplate(
        template,
        partialVariables: const {'foo': 'jim'},
      );
      const expectedPrompt = PromptTemplate(
        template: template,
        inputVariables: {'bar'},
        partialVariables: {'foo': 'jim'},
      );
      expect(prompt, expectedPrompt);
    });

    test('Test error is raised when partial variables overlap', () {
      expect(
        () => const PromptTemplate(
          inputVariables: {'foo', 'bar'},
          partialVariables: {'foo': 'jim'},
          template: 'This is a {foo} {bar} test.',
        ).validateTemplate(),
        throwsA(isA<TemplateValidationException>()),
      );
    });

    test('Test error is raised when input variables are not provided', () {
      const template = 'This is a {foo} test.';
      const inputVariables = <String>{};
      expect(
        () => const PromptTemplate(
          inputVariables: inputVariables,
          template: template,
        ).validateTemplate(),
        throwsA(isA<TemplateValidationException>()),
      );
    });

    test('Test error is raised when there are too many input variables', () {
      const template = 'This is a {foo} test.';
      const inputVariables = {'foo', 'bar'};
      expect(
        () => const PromptTemplate(
          inputVariables: inputVariables,
          template: template,
        ).validateTemplate(),
        throwsA(isA<TemplateValidationException>()),
      );
    });

    test('Test error is raised when name of input variable is wrong', () {
      const template = 'This is a {foo} test.';
      const inputVariables = {'bar'};
      expect(
        () => const PromptTemplate(
          inputVariables: inputVariables,
          template: template,
        ).validateTemplate(),
        throwsA(isA<TemplateValidationException>()),
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
      const inputVariables = {'question'};
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
      const promptFromTemplate = PromptTemplate(
        template: template,
        inputVariables: inputVariables,
      );
      expect(promptFromExamples, promptFromTemplate);
    });

    test('Test prompt can be successfully constructed from a file', () async {
      const templateFile = './test/model_io/prompts/assets/prompt_file.txt';
      const inputVariables = ['question'];
      final prompt = await PromptTemplate.fromFile(templateFile);
      expect(prompt.template, 'Question: {question}\nAnswer:');
      expect(prompt.inputVariables, inputVariables);
    });

    test('Test prompt can be initialized with partial variables', () {
      const template = 'This is a {foo} test.';
      const prompt = PromptTemplate(
        inputVariables: {},
        template: template,
        partialVariables: {'foo': 1},
      );
      expect(prompt.template, template);
      expect(prompt.inputVariables, <String>[]);
      final result = prompt.format();
      expect(result, 'This is a 1 test.');
    });

    test('Test prompt can be initialized with partial variables', () {
      const template = 'This is a {foo} test.';
      const prompt = PromptTemplate(
        inputVariables: {},
        template: template,
        partialVariables: {'foo': 2},
      );
      expect(prompt.template, template);
      expect(prompt.inputVariables, <String>[]);
      final result = prompt.format();
      expect(result, 'This is a 2 test.');
    });

    test('Test prompt can be partial', () {
      const template = 'This is a {foo} test.';
      const prompt = PromptTemplate(
        inputVariables: {'foo'},
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
      const prompt = PromptTemplate(
        template: '{foo}{bar}',
        inputVariables: {'foo'},
        partialVariables: {'bar': 'baz'},
      );
      expect(prompt.format({'foo': 'foo'}), 'foobaz');
    });

    test('Test using full partial', () {
      const prompt = PromptTemplate(
        template: '{foo}{bar}',
        inputVariables: {},
        partialVariables: {'bar': 'baz', 'foo': 'boo'},
      );
      expect(prompt.format({}), 'boobaz');
    });

    test('Test partial', () {
      const prompt = PromptTemplate(
        template: '{foo}{bar}',
        inputVariables: {'foo', 'bar'},
      );
      expect(prompt.inputVariables, ['foo', 'bar']);
      final partialPrompt = prompt.partial({'foo': 'foo'});
      // original prompt is not modified
      expect(prompt.inputVariables, ['foo', 'bar']);
      // partial prompt has only remaining variables
      expect(partialPrompt.inputVariables, ['bar']);
      expect(partialPrompt.format({'bar': 'baz'}), 'foobaz');
    });
  });
}
