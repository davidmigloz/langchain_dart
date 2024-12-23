import 'package:langchain_core/prompts.dart';
import 'package:langchain_core/src/prompts/template.dart';
import 'package:test/test.dart';

void main() {
  group('Template tests', () {
    test('Render renderFStringTemplate', () {
      final scenarios = <(String, InputValues, String)>[
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
      final scenarios = <(String, InputValues)>[
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
