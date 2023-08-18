import 'package:langchain/langchain.dart';
import 'package:langchain/src/model_io/prompts/template.dart';
import 'package:test/test.dart';

void main() {
  group('Template tests', () {
    test('Render renderFStringTemplate', () {
      final List<(String, InputValues, String)> scenarios = [
        ('{foo}', {'foo': 'bar'}, 'bar'),
        ('pre{foo}post', {'foo': 'bar'}, 'prebarpost'),
        ('{{pre{foo}post}}', {'foo': 'bar'}, '{prebarpost}'),
        ('text', {}, 'text'),
        ('}}{{', {}, '}{'),
        ('{first}_{second}', {'first': 'foo', 'second': 'bar'}, 'foo_bar'),
      ];

      for (final scenario in scenarios) {
        final (template, inputValues, expected) = scenario;
        final actual = renderFStringTemplate(template, inputValues);
        expect(
          actual,
          expected,
          reason: 'Template: $template | Input: $inputValues',
        );
      }
    });

    test('Invalid f-strings', () {
      final List<(String, InputValues)> scenarios = [
        ('{', {}),
        ('}', {}),
        ('{foo', {}),
        ('foo}', {}),
      ];

      for (final scenario in scenarios) {
        final (template, inputValues) = scenario;
        // Expect exception to be thrown
        expect(
          () => renderFStringTemplate(template, inputValues),
          throwsA(isA<TemplateValidationException>()),
          reason: 'Template: $template',
        );
      }
    });
  });
}
