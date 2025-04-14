import 'package:web_socket_channel/web_socket_channel.dart';

/// Creates a new WebSocket connection.
WebSocketChannel connectWebSocket(
  Uri uri,
  String? apiKey,
  Map<String, String>? headers,
) =>
    throw UnsupportedError(
      'Cannot create a WebSocket connection without dart:html or dart:io.',
    );
