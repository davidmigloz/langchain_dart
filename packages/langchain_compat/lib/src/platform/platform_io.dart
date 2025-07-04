import 'dart:io';

import '../agent_message.dart';

/// Gets an environment variable from the [Agent.environment] map.
///
/// Throws an exception if the environment variable is not set.
String getEnv(String name) {
  if (name.isEmpty) throw Exception('Environment variable name is empty');
  final value = tryGetEnv(name);
  return value ?? (throw Exception('Environment variable $name is not set'));
}

/// Gets an environment variable first from the [Agent.environment] map, then
/// the [Platform.environment] map.
///
/// Returns `null` if the environment variable is not set.
String? tryGetEnv(String name) =>
    name.isEmpty ? null : Agent.environment[name] ?? Platform.environment[name];
