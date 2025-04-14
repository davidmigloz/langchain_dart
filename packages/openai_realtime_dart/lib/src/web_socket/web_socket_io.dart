import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// Creates a new WebSocket connection using the `dart:io` implementation.
WebSocketChannel connectWebSocket(
  Uri uri,
  String? apiKey,
  Map<String, String>? headers,
) {
  return IOWebSocketChannel.connect(
    uri,
    headers: {
      if (apiKey != null) 'Authorization': 'Bearer $apiKey',
      'OpenAI-Beta': 'realtime=v1',
      ...?headers,
    },
  );
}
