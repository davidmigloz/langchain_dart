// ignore_for_file: public_member_api_docs

import 'package:ollama_dart/ollama_dart.dart';

KeepAlive? mapKeepAlive(final int? value) => switch (value) {
  null => null,
  <= 0 => KeepAlive.number(value),
  _ => KeepAlive.duration('${value}m'),
};

StopSequence? mapStopSequences(final List<String>? values) =>
    values == null ? null : StopSequence.list(values);
