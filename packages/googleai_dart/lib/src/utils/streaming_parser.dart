import 'dart:async';
import 'dart:convert';

/// Parses an SSE stream into a stream of JSON objects.
Stream<Map<String, dynamic>> parseSSE(Stream<String> stream) async* {
  await for (final line in stream) {
    if (line.startsWith('data: ')) {
      final data = line.substring(6).trim();
      if (data.isNotEmpty && data != '[DONE]') {
        try {
          yield jsonDecode(data) as Map<String, dynamic>;
        } catch (_) {
          // Skip malformed JSON
        }
      }
    }
  }
}

/// Parses an NDJSON stream into a stream of JSON objects.
Stream<Map<String, dynamic>> parseNDJSON(Stream<String> stream) async* {
  await for (final line in stream) {
    final trimmed = line.trim();
    if (trimmed.isNotEmpty) {
      try {
        yield jsonDecode(trimmed) as Map<String, dynamic>;
      } catch (_) {
        // Skip malformed JSON
      }
    }
  }
}

/// Converts a byte stream to a line stream.
Stream<String> bytesToLines(Stream<List<int>> byteStream) {
  return byteStream
      .cast<List<int>>()
      .transform(utf8.decoder)
      .transform(const LineSplitter());
}
