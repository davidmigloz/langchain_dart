// ignore_for_file: avoid_print

import 'dart:io';

void main() {
  // testing whether I can properly inject environment variables into the
  // process via a Claude Code hook.
  print(
    'ANTHROPIC_API_KEY.length: '
    '${Platform.environment['ANTHROPIC_API_KEY']?.length ?? 0}',
  );
  print(
    'ANTHROPIC_API_TEST_KEY.length: '
    '${Platform.environment['ANTHROPIC_API_TEST_KEY']?.length ?? 0}',
  );
}
