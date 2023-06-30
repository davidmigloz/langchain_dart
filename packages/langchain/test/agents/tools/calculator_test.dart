import 'package:langchain/src/agents/tools/tools.dart';
import 'package:test/test.dart';

void main() {
  group('CalculatorTool tests', () {
    test('Calculate expressions', () async {
      final echoTool = CalculatorTool();

      expect(echoTool.run({Tool.inputVar: '1 + 1'}), '2.0');
      expect(echoTool.run({Tool.inputVar: '1 - 1'}), '0.0');
      expect(echoTool.run({Tool.inputVar: '10*1 - (-5)'}), '15.0');
      expect(
        double.parse(
          await echoTool.run({Tool.inputVar: '(2^2 + cos(3.14)) / 3'}),
        ),
        closeTo(1.0, 0.000001),
      );
    });
  });
}
