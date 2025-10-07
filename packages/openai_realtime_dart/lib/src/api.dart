// ignore_for_file: avoid_print
import 'dart:async';
import 'dart:convert';

import 'package:logging/logging.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

import 'event_handler.dart';
import 'schema/generated/schema/schema.dart';
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
    this.headers,
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

  /// The custom headers to include in the WebSocket connection.
  final Map<String, String>? headers;

  /// Whether to log debug messages.
  final bool debug;

  /// Whether to allow the API key to be used in the browser.
  final bool dangerouslyAllowAPIKeyInBrowser;

  WebSocketChannel? _ws;
  var _model = '';
  StreamSubscription<dynamic>? _logSubscription;

  /// Tells us whether or not the WebSocket is connected.
  bool isConnected() => _ws != null;

  /// Connects to Realtime API Websocket Server.
  ///
  /// [model] specifies which model to use. You can find the list of available
  /// models [here](https://platform.openai.com/docs/models).
  Future<bool> connect({
    final String model = RealtimeUtils.defaultModel,
  }) async {
    if (isConnected()) {
      throw Exception('Already connected');
    }

    _configLogger();

    _model = model;
    final uri = Uri.parse('$url?model=$_model');

    try {
      _ws = connectWebSocket(uri, apiKey, headers);

      // Wait for the connection to be established
      await _ws!.ready;

      _log.info('Connected to "$url"');

      _ws!.stream.listen(
        (data) {
          final message = json.decode(data) as Map<String, dynamic>;
          unawaited(receive(message));
        },
        onError: (dynamic error) {
          _log.severe('Error', error);
          unawaited(
            dispatch(
              RealtimeEventType.close,
              RealtimeEvent.close(
                eventId: RealtimeUtils.generateId(),
                error: true,
              ),
            ),
          );
        },
        onDone: () {
          _log.info('Disconnected from "$url"');
          unawaited(
            dispatch(
              RealtimeEventType.close,
              RealtimeEvent.close(
                eventId: RealtimeUtils.generateId(),
                error: false,
              ),
            ),
          );
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
  /// "[RealtimeEventType]" and "[RealtimeEventType.serverAll]" events.
  Future<void> receive(Map<String, dynamic> eventData) async {
    final event = RealtimeEvent.fromJson(eventData);
    _logEvent(event, fromClient: false);
    await dispatch(event.type, event);
    await dispatch(RealtimeEventType.serverAll, event);
    await dispatch(RealtimeEventType.all, event);
  }

  /// Sends an event to WebSocket and dispatches as "[RealtimeEventType]"
  /// and "[RealtimeEventType.clientAll]" events.
  Future<void> send(RealtimeEvent event) async {
    if (!isConnected()) {
      throw Exception('RealtimeAPI is not connected');
    }

    final finalEvent = event.copyWith(
      eventId: RealtimeUtils.generateId(),
    );

    _logEvent(finalEvent, fromClient: true);
    await dispatch(finalEvent.type, finalEvent);
    await dispatch(RealtimeEventType.clientAll, finalEvent);
    await dispatch(RealtimeEventType.all, finalEvent);

    final data = json.encode(finalEvent.toJson());
    _ws!.sink.add(data);
  }

  void _logEvent(
    RealtimeEvent event, {
    required bool fromClient,
  }) {
    if (!debug) {
      return;
    }

    final eventJson = event.toJson();

    // Recursive function to replace "audio" property content
    void replaceAudioProperty(dynamic json) {
      if (json is Map<String, dynamic>) {
        json.forEach((key, value) {
          if (key == 'audio' ||
              (key == 'delta' && json['type'] == 'response.audio.delta')) {
            json[key] = 'base64-encoded-audio';
          } else {
            replaceAudioProperty(value);
          }
        });
      } else if (json is List) {
        for (var i = 0; i < json.length; i++) {
          replaceAudioProperty(json[i]);
        }
      }
    }

    // Replace "audio" property content in the event JSON
    replaceAudioProperty(eventJson);

    final eventString = jsonEncode(eventJson);
    _log.info(
      '${fromClient ? 'sent' : 'received'}: ${event.type.name} $eventString',
    );
  }
}
