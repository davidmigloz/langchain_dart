import 'package:langchain_community/langchain_community.dart';
import 'package:test/test.dart';

void main() {
  group('CalculatorTool tests', () {
    test('Calculate expressions', () async {
      final echoTool = CalculatorTool();

      expect(await echoTool.invoke('1 + 1'), '2.0');
      expect(await echoTool.invoke('1 - 1'), '0.0');
      expect(await echoTool.invoke('10*1 - (-5)'), '15.0');
      expect(
        double.parse(await echoTool.invoke('(2^2 + cos(3.14)) / 3')),
        closeTo(1.0, 0.000001),
      );
    });
  });
}
