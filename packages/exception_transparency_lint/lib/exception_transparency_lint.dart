import 'package:custom_lint_builder/custom_lint_builder.dart';

import 'src/exception_swallowing_rule.dart';

PluginBase createPlugin() => _ExceptionTransparencyLint();

class _ExceptionTransparencyLint extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        ExceptionSwallowingRule(),
      ];
}
