// ignore_for_file: avoid_print
import 'dart:async';
import 'dart:convert';

import 'package:logging/logging.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

import 'event_handler.dart';
import 'utils.dart';
import 'web_socket/web_socket.dart';

final _log = Logger('openai_realtime_dart.api');

/// Thin wrapper over [WebSocket](https://developer.mozilla.org/en-US/docs/Web/API/WebSocket)
/// to handle the communication with OpenAI Realtime API.
///
/// Dispatches events as `server.{event_name}` and `client.{event_name}`,
/// respectively.
class RealtimeAPI extends RealtimeEventHandler {
  /// Create a new [RealtimeAPI] instance.
  RealtimeAPI({
    this.url = 'wss://api.openai.com/v1/realtime',
    this.apiKey,
    this.debug = false,
    this.dangerouslyAllowAPIKeyInBrowser = true,
  }) {
    if (apiKey != null && !dangerouslyAllowAPIKeyInBrowser) {
      throw Exception(
        'Cannot provide API key in the browser without '
        '"dangerouslyAllowAPIKeyInBrowser" set to true',
      );
    }
  }

  /// The base URL of the Realtime API.
  final String url;

  /// The API key to authenticate with the Realtime API.
  final String? apiKey;

  /// Whether to log debug messages.
  final bool debug;

  /// Whether to allow the API key to be used in the browser.
  final bool dangerouslyAllowAPIKeyInBrowser;

  WebSocketChannel? _ws;
  String _model = '';
  StreamSubscription<dynamic>? _logSubscription;

  /// Tells us whether or not the WebSocket is connected.
  bool isConnected() => _ws != null;

  /// Connects to Realtime API Websocket Server.
  Future<bool> connect({
    final String model = 'gpt-4o-realtime-preview-2024-10-01',
  }) async {
    if (isConnected()) {
      throw Exception('Already connected');
    }

    _configLogger();

    _model = model;
    final uri = Uri.parse('$url?model=$_model');

    try {
      _ws = connectWebSocket(uri, apiKey);

      // Wait for the connection to be established
      await _ws!.ready;

      _log.info('Connected to "$url"');

      _ws!.stream.listen(
        (data) {
          final message = json.decode(data) as Map<String, dynamic>;
          receive(message['type'], message);
        },
        onError: (dynamic error) {
          _log.severe('Error', error);
          dispatch('close', {'error': true});
        },
        onDone: () {
          _log.info('Disconnected from "$url"');
          dispatch('close', {'error': false});
        },
      );

      return true;
    } catch (e) {
      _log.severe('Could not connect to "$url"', e);
      return false;
    }
  }

  void _configLogger() {
    if (debug) {
      final logger = Logger('openai_realtime_dart');
      _logSubscription = logger.onRecord.listen((record) {
        if (record.level >= Level.INFO) {
          print(
            '[${record.loggerName}/${record.time.toIso8601String()}]: '
            '${record.message} ${record.error ?? ""}',
          );
        }
      });
    }
  }

  /// Disconnects from Realtime API server.
  Future<void> disconnect() async {
    if (_ws != null) {
      await _ws!.sink.close(status.normalClosure);
      _ws = null;
    }
    await _logSubscription?.cancel();
  }

  /// Receives an event from WebSocket and dispatches as
  /// "server.{eventName}" and "server.*" events.
  void receive(String eventName, Map<String, dynamic> event) {
    _log.info('received: $eventName $event');
    dispatch('server.$eventName', event);
    dispatch('server.*', event);
  }

  /// Sends an event to WebSocket and dispatches as "client.{eventName}"
  /// and "client.*" events.
  void send(String eventName, [Map<String, dynamic>? data]) {
    if (!isConnected()) {
      throw Exception('RealtimeAPI is not connected');
    }

    final event = {
      'event_id': RealtimeUtils.generateId('evt_'),
      'type': eventName,
      ...?data,
    };

    dispatch('client.$eventName', event);
    dispatch('client.*', event);
    _log.info('sent: $eventName $event');

    _ws!.sink.add(json.encode(event));
  }
}
