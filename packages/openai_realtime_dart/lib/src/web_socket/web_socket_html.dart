import 'package:web_socket_channel/html.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// Creates a new WebSocket connection using the `dart:html` implementation.
WebSocketChannel connectWebSocket(
  Uri uri,
  String? apiKey,
  Map<String, String>? headers,
) {
  return HtmlWebSocketChannel.connect(
    uri,
    protocols: [
      'realtime',
      if (apiKey != null) 'openai-insecure-api-key.$apiKey',
      'openai-beta.realtime-v1',
      if (headers != null)
        for (final entry in headers.entries) '${entry.key}.${entry.value}',
    ],
  );
}
