import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('PipelinePromptTemplate tests', () {
    test('Test prompts can be constructed', () {
      final promptA = PromptTemplate.fromTemplate('{foo}');
      final promptB = PromptTemplate.fromTemplate('{bar}');
      final pipelinePrompt = PipelinePromptTemplate(
        finalPrompt: promptB,
        pipelinePrompts: [('bar', promptA)],
      );
      expect(pipelinePrompt.inputVariables, ['foo']);
    });

    test('Simple pipeline', () {
      final promptA = PromptTemplate.fromTemplate('{foo}');
      final promptB = PromptTemplate.fromTemplate('{bar}');
      final pipelinePrompt = PipelinePromptTemplate(
        finalPrompt: promptB,
        pipelinePrompts: [('bar', promptA)],
      );
      final output = pipelinePrompt.format({'foo': 'jim'});
      expect(output, 'jim');
    });

    test('Multi variable pipeline', () {
      final promptA = PromptTemplate.fromTemplate('{foo}');
      final promptB = PromptTemplate.fromTemplate('okay {bar} {baz}');
      final pipelinePrompt = PipelinePromptTemplate(
        finalPrompt: promptB,
        pipelinePrompts: [('bar', promptA)],
      );
      final output = pipelinePrompt.format({'foo': 'jim', 'baz': 'deep'});
      expect(output, 'okay jim deep');
    });

    test('Partial with chat prompts', () {
      const promptA = ChatPromptTemplate(
        inputVariables: {'foo'},
        promptMessages: [MessagesPlaceholder(variableName: 'foo')],
      );
      final promptB = ChatPromptTemplate.fromTemplate('jim {bar}');
      final pipelinePrompt = PipelinePromptTemplate(
        finalPrompt: promptA,
        pipelinePrompts: [('foo', promptB)],
      );
      expect(pipelinePrompt.inputVariables, ['bar']);
      final output = pipelinePrompt.formatPrompt({'bar': 'okay'});
      expect(output.toChatMessages()[0].contentAsString, 'jim okay');
    });
  });
}
