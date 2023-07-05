import 'package:langchain/src/documents/transformers/text_splitters/utils.dart';
import 'package:test/test.dart';

void main() {
  group('TextSplitter utils tests', () {
    test('Test splitTextWithRegex keepSeparator=false', () {
      const text = 'This is a weird text to write';
      final output = splitTextWithRegex(text, ' ', false);
      expect(output, [
        'This',
        'is',
        'a',
        'weird',
        'text',
        'to',
        'write',
      ]);
    });

    test('Test splitTextWithRegex keepSeparator=true', () {
      const text = 'This is a weird text to write';
      final output = splitTextWithRegex(text, ' ', true);
      expect(output, [
        'This',
        ' is',
        ' a',
        ' weird',
        ' text',
        ' to',
        ' write',
      ]);
    });

    test('Test splitTextWithRegex empty string separator', () {
      const text = 'splittingggg';
      final output = splitTextWithRegex(text, '', true);
      expect(output, [
        's',
        'p',
        'l',
        'i',
        't',
        't',
        'i',
        'n',
        'g',
        'g',
        'g',
        'g',
      ]);
    });
  });
}
