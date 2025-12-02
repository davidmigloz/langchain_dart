enum ThinkingLevel { thinkingLevelUnspecified, low, high }

class ThinkingConfig {
  final bool? includeThoughts;
  final int? thinkingBudget;
  final ThinkingLevel? thinkingLevel;

  ThinkingConfig({
    this.includeThoughts,
    this.thinkingBudget,
    this.thinkingLevel,
  });

  factory ThinkingConfig.fromJson(Map<String, dynamic> json) {
    return ThinkingConfig(
      includeThoughts: json['includeThoughts'] as bool?,
      thinkingBudget: json['thinkingBudget'] as int?,
      thinkingLevel: _thinkingLevelFromString(json['thinkingLevel']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (includeThoughts != null) 'includeThoughts': includeThoughts,
      if (thinkingBudget != null) 'thinkingBudget': thinkingBudget,
      if (thinkingLevel != null)
        'thinkingLevel': _thinkingLevelToString(thinkingLevel!),
    };
  }

  static ThinkingLevel? _thinkingLevelFromString(String? value) {
    switch (value) {
      case 'LOW':
        return ThinkingLevel.low;
      case 'HIGH':
        return ThinkingLevel.high;
      case 'THINKING_LEVEL_UNSPECIFIED':
      default:
        return ThinkingLevel.thinkingLevelUnspecified;
    }
  }

  static String _thinkingLevelToString(ThinkingLevel level) {
    switch (level) {
      case ThinkingLevel.low:
        return 'LOW';
      case ThinkingLevel.high:
        return 'HIGH';
      case ThinkingLevel.thinkingLevelUnspecified:
        return 'THINKING_LEVEL_UNSPECIFIED';
    }
  }
}
