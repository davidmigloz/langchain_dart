import 'package:logging/logging.dart';

import 'agent.dart';

/// Configuration options for logging in the langchain_compat package.
///
/// Provides simple control over logging level, filtering, and output handling
/// for all dartantic loggers through the [Agent.loggingOptions] property.
///
/// Example usage:
/// ```dart
/// // Use defaults (Level.INFO, no filtering, print to console)
/// Agent.loggingOptions = LoggingOptions();
///
/// // Filter to only OpenAI operations
/// Agent.loggingOptions = LoggingOptions(filter: 'openai');
///
/// // Custom level and handler
/// Agent.loggingOptions = LoggingOptions(
///   level: Level.FINE,
///   filter: 'dartantic.chat',
///   onRecord: (record) => myLogger.log(record),
/// );
/// ```
class LoggingOptions {
  /// Creates logging options with the specified configuration.
  ///
  /// All parameters have sensible defaults:
  /// - [level]: Defaults to [Level.INFO] for balanced visibility
  /// - [filter]: Defaults to empty string (matches all logger names)
  /// - [onRecord]: Defaults to formatted console output
  const LoggingOptions({
    this.level = Level.INFO,
    this.filter = '',
    this.onRecord = _defaultOnRecord,
  });

  /// The minimum logging level to capture.
  ///
  /// Only log records at or above this level will be processed.
  /// Defaults to [Level.INFO].
  final Level level;

  /// Substring filter for logger names.
  ///
  /// Only log records whose logger name contains this string will be
  /// processed. Use empty string to match all logger names.
  ///
  /// Examples:
  /// - `'openai'` matches `dartantic.chat.providers.openai`
  /// - `'chat'` matches all chat-related loggers
  /// - `'http'` matches HTTP-related loggers
  /// - `''` matches all loggers (default)
  final String filter;

  /// Callback function to handle log records.
  ///
  /// Receives a [LogRecord] for each log entry that passes the level
  /// and filter criteria. Defaults to formatted console output.
  final void Function(LogRecord) onRecord;

  /// Creates a copy of this [LoggingOptions] with optionally updated values.
  LoggingOptions copyWith({
    Level? level,
    String? filter,
    void Function(LogRecord)? onRecord,
  }) => LoggingOptions(
    level: level ?? this.level,
    filter: filter ?? this.filter,
    onRecord: onRecord ?? this.onRecord,
  );

  @override
  String toString() => 'LoggingOptions(level: $level, filter: "$filter")';
}

/// Default log record handler that prints formatted output to console.
void _defaultOnRecord(LogRecord record) =>
    // ignore: avoid_print
    print('[${record.loggerName}] ${record.level.name}: ${record.message}');
