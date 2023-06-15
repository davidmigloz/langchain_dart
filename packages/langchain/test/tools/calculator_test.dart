import 'package:langchain/langchain.dart';
import 'package:langchain/src/tools/calculator.dart';
import 'package:test/test.dart';

void main() {
  group('CalculatorTool tests', () {
    test('Calculate expressions', () async {
      final echoTool = CalculatorTool();

      expect(echoTool.run(toolInput: '1 + 1'), '2.0');
      expect(echoTool.run(toolInput: '1 - 1'), '0.0');
      expect(echoTool.run(toolInput: '10*1 - (-5)'), '15.0');
      expect(
        double.parse(await echoTool.run(toolInput: '(2^2 + cos(3.14)) / 3')),
        closeTo(1.0, 0.000001),
      );
    });
  });
}
