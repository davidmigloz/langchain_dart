import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'api.dart';
import 'conversation.dart';
import 'event_handler.dart';
import 'utils.dart';

/// Dart client for the OpenAI Realtime API.
/// Enables rapid application development with a simplified control flow.
///
/// It reduces the event overhead from server events to five main events
/// that are most critical for your application control flow:
/// - `conversation.updated`: When the conversation state is updated.
/// - `conversation.interrupted`: When the conversation is interrupted.
/// - `conversation.item.appended`: When a new item is appended to the conversation.
/// - `conversation.item.completed`: When an item is completed.
/// - `realtime.event`: All events from the Realtime API.
///
/// These events are not part of the API specification itself, but wrap logic
/// to make application development easier.
class RealtimeClient extends RealtimeEventHandler {
  /// Create a new [RealtimeClient] instance.
  RealtimeClient({
    final String url = 'wss://api.openai.com/v1/realtime',
    final String? apiKey,
    final bool debug = false,
    final bool dangerouslyAllowAPIKeyInBrowser = true,
  })  : realtime = RealtimeAPI(
          url: url,
          apiKey: apiKey,
          debug: debug,
          dangerouslyAllowAPIKeyInBrowser: dangerouslyAllowAPIKeyInBrowser,
        ),
        conversation = RealtimeConversation() {
    _resetConfig();
    _addApiEventHandlers();
  }

  /// The Realtime API instance.
  final RealtimeAPI realtime;

  /// The Realtime conversation instance.
  final RealtimeConversation conversation;

  /// The session configuration.
  Map<String, dynamic> sessionConfig = {};

  /// The tools added to the client.
  final Map<String, dynamic> tools = {};

  /// Whether the session has been created.
  bool sessionCreated = false;

  /// The input audio buffer.
  Uint8List inputAudioBuffer = Uint8List(0);

  void _resetConfig() {
    sessionCreated = false;
    tools.clear();
    sessionConfig = {
      'modalities': ['text', 'audio'],
      'instructions': '',
      'voice': 'alloy',
      'input_audio_format': 'pcm16',
      'output_audio_format': 'pcm16',
      'input_audio_transcription': null,
      'turn_detection': null,
      'tools': <dynamic>[],
      'tool_choice': 'auto',
      'temperature': 0.8,
      'max_response_output_tokens': 4096,
    };
    inputAudioBuffer = Uint8List(0);
  }

  void _addApiEventHandlers() {
    realtime
      ..on('client.*', (event) {
        dispatch('realtime.event', {
          'time': DateTime.now().toIso8601String(),
          'source': 'client',
          'event': event,
        });
      })
      ..on('server.*', (event) {
        dispatch('realtime.event', {
          'time': DateTime.now().toIso8601String(),
          'source': 'server',
          'event': event,
        });
      })
      ..on('server.session.created', (_) => sessionCreated = true);

    Future<Map<String, dynamic>> handler(
      Map<String, dynamic>? event, [
      dynamic args,
    ]) async {
      return conversation.processEvent(event, args);
    }

    Future<Map<String, dynamic>> handlerWithDispatch(
      Map<String, dynamic>? event, [
      dynamic args,
    ]) async {
      final result = await handler(event, args);
      if (result['item'] != null) {
        dispatch('conversation.updated', result);
      }
      return result;
    }

    realtime
      ..on('server.response.created', handler)
      ..on('server.response.output_item.added', handler)
      ..on('server.response.content_part.added', handler)
      ..on('server.input_audio_buffer.speech_started', (event) async {
        await handler(event);
        dispatch('conversation.interrupted', null);
      })
      ..on(
        'server.input_audio_buffer.speech_stopped',
        (event) async => handler(event, inputAudioBuffer),
      )
      ..on('server.conversation.item.created', (event) async {
        final result = await handlerWithDispatch(event);
        final item = result['item'] as Map<String, dynamic>?;
        dispatch('conversation.item.appended', {'item': item});
        if (item?['status'] == 'completed') {
          dispatch('conversation.item.completed', {'item': item});
        }
      })
      ..on('server.conversation.item.truncated', handlerWithDispatch)
      ..on('server.conversation.item.deleted', handlerWithDispatch)
      ..on(
        'server.conversation.item.input_audio_transcription.completed',
        handlerWithDispatch,
      )
      ..on('server.response.audio_transcript.delta', handlerWithDispatch)
      ..on('server.response.audio.delta', handlerWithDispatch)
      ..on('server.response.text.delta', handlerWithDispatch)
      ..on(
        'server.response.function_call_arguments.delta',
        handlerWithDispatch,
      )
      ..on('server.response.output_item.done', (event) async {
        final result = await handlerWithDispatch(event);
        final item = result['item'] as Map<String, dynamic>?;
        if (item?['status'] == 'completed') {
          dispatch('conversation.item.completed', {'item': item});
        }
        final formatted = item?['formatted'] as Map<String, dynamic>?;
        if (formatted?['tool'] != null) {
          await _callTool(formatted!['tool']);
        }
      });
  }

  Future<void> _callTool(Map<String, dynamic> tool) async {
    try {
      final jsonArguments = tool['arguments'] as Map<String, dynamic>;
      final toolConfig = tools[tool['name']] as Map<String, dynamic>?;
      if (toolConfig == null) {
        throw Exception('Tool "${tool['name']}" has not been added');
      }
      final handler = toolConfig['handler'] as FutureOr<Map<String, dynamic>>
          Function(Map<String, dynamic>);
      final result = await handler(jsonArguments);
      realtime.send('conversation.item.create', {
        'item': {
          'type': 'function_call_output',
          'call_id': tool['call_id'],
          'output': result,
        },
      });
    } catch (e) {
      realtime.send('conversation.item.create', {
        'item': {
          'type': 'function_call_output',
          'call_id': tool['call_id'],
          'output': {'error': e.toString()},
        },
      });
    }
    createResponse();
  }

  /// Tells us whether the realtime socket is connected and the session has
  /// started.
  bool isConnected() => realtime.isConnected();

  /// Resets the client instance entirely: disconnects and clears active config.
  Future<void> reset() async {
    await disconnect();
    clearEventHandlers();
    realtime.clearEventHandlers();
    _resetConfig();
    _addApiEventHandlers();
  }

  /// Connects to the Realtime WebSocket API.
  /// Updates session config and conversation config.
  Future<bool> connect() async {
    if (isConnected()) {
      throw Exception('Already connected, use .disconnect() first');
    }
    final connected = await realtime.connect();
    if (connected) {
      updateSession();
    }
    return connected;
  }

  /// Waits for a `session.created` event to be executed before proceeding.
  Future<bool> waitForSessionCreated() async {
    if (!isConnected()) {
      throw Exception('Not connected, use .connect() first');
    }
    while (!sessionCreated) {
      await Future<void>.delayed(const Duration(milliseconds: 50));
    }
    return true;
  }

  /// Disconnects from the Realtime API and clears the conversation history.
  Future<void> disconnect() async {
    sessionCreated = false;
    conversation.clear();
    if (realtime.isConnected()) {
      await realtime.disconnect();
    }
  }

  /// Gets the active turn detection mode.
  String? getTurnDetectionType() {
    final turnDetection =
        sessionConfig['turn_detection'] as Map<String, dynamic>?;
    return turnDetection?['type'];
  }

  /// Add a tool and handler.
  Map<String, dynamic> addTool(
    Map<String, dynamic> definition,
    FutureOr<Map<String, dynamic>> Function(Map<String, dynamic>) handler,
  ) {
    if (definition['name'] == null) {
      throw Exception('Missing tool name in definition');
    }
    final name = definition['name'];
    if (tools.containsKey(name)) {
      throw Exception(
        'Tool "$name" already added. '
        'Please use .removeTool("$name") before trying to add again.',
      );
    }
    tools[name] = {'definition': definition, 'handler': handler};
    updateSession();
    return tools[name];
  }

  /// Removes a tool.
  bool removeTool(String name) {
    if (!tools.containsKey(name)) {
      throw Exception('Tool "$name" does not exist, can not be removed.');
    }
    tools.remove(name);
    return true;
  }

  /// Deletes an item.
  bool deleteItem(String id) {
    realtime.send('conversation.item.delete', {'item_id': id});
    return true;
  }

  /// Updates session configuration.
  /// If the client is not yet connected, will save details and instantiate
  /// upon connection.
  void updateSession({
    List<String>? modalities,
    String? instructions,
    String? voice,
    String? inputAudioFormat,
    String? outputAudioFormat,
    Map<String, dynamic>? inputAudioTranscription,
    Map<String, dynamic>? turnDetection,
    List<Map<String, dynamic>>? tools,
    dynamic toolChoice,
    double? temperature,
    dynamic maxResponseOutputTokens,
  }) {
    if (modalities != null) sessionConfig['modalities'] = modalities;
    if (instructions != null) sessionConfig['instructions'] = instructions;
    if (voice != null) sessionConfig['voice'] = voice;
    if (inputAudioFormat != null) {
      sessionConfig['input_audio_format'] = inputAudioFormat;
    }
    if (outputAudioFormat != null) {
      sessionConfig['output_audio_format'] = outputAudioFormat;
    }
    if (inputAudioTranscription != null) {
      sessionConfig['input_audio_transcription'] = inputAudioTranscription;
    }
    if (turnDetection != null) sessionConfig['turn_detection'] = turnDetection;
    if (tools != null) sessionConfig['tools'] = tools;
    if (toolChoice != null) sessionConfig['tool_choice'] = toolChoice;
    if (temperature != null) sessionConfig['temperature'] = temperature;
    if (maxResponseOutputTokens != null) {
      sessionConfig['max_response_output_tokens'] = maxResponseOutputTokens;
    }

    // Load tools from tool definitions + already loaded tools
    final useTools = [
      ...(tools ?? const []).map((toolDefinition) {
        final definition = {
          'type': 'function',
          ...toolDefinition,
        };
        if (this.tools.containsKey(definition['name'])) {
          throw Exception(
            'Tool "${definition['name']}" has already been defined',
          );
        }
        return definition;
      }),
      ...this.tools.values.map(
            (tool) => {
              'type': 'function',
              ...(tool as Map<String, dynamic>)['definition'],
            },
          ),
    ];

    final session = Map<String, dynamic>.from(sessionConfig);
    session['tools'] = useTools;

    if (realtime.isConnected()) {
      realtime.send('session.update', {'session': session});
    }
  }

  /// Sends user message content and generates a response.
  bool sendUserMessageContent(List<Map<String, dynamic>> content) {
    if (content.isNotEmpty) {
      for (final c in content) {
        if (c['type'] == 'input_audio') {
          if (c['audio'] is Uint8List) {
            c['audio'] = base64.encode(c['audio'] as Uint8List);
          }
        }
      }
      realtime.send('conversation.item.create', {
        'item': {
          'type': 'message',
          'role': 'user',
          'content': content,
        },
      });
    }
    createResponse();
    return true;
  }

  /// Appends user audio to the existing audio buffer.
  bool appendInputAudio(Uint8List audioData) {
    if (audioData.isNotEmpty) {
      realtime.send('input_audio_buffer.append', {
        'audio': base64.encode(audioData),
      });
      inputAudioBuffer = RealtimeUtils.mergeUint8Lists(
        inputAudioBuffer,
        audioData,
      );
    }
    return true;
  }

  /// Forces a model response generation.
  bool createResponse() {
    if (getTurnDetectionType() == null && inputAudioBuffer.isNotEmpty) {
      realtime.send('input_audio_buffer.commit');
      conversation.queueInputAudio(inputAudioBuffer);
      inputAudioBuffer = Uint8List(0);
    }
    realtime.send('response.create');
    return true;
  }

  /// Cancels the ongoing server generation and truncates ongoing generation,
  /// if applicable.
  /// If no id provided, will simply call `cancel_generation` command.
  Map<String, dynamic> cancelResponse(String? id, [int sampleCount = 0]) {
    if (id == null) {
      realtime.send('response.cancel');
      return {'item': null};
    } else {
      final item = conversation.getItem(id) as Map<String, dynamic>?;
      if (item == null) {
        throw Exception('Could not find item "$id"');
      }
      final type = item['type'] as String;
      final role = item['role'] as String;

      if (type != 'message') {
        throw Exception('Can only cancelResponse messages with type "message"');
      } else if (role != 'assistant') {
        throw Exception(
          'Can only cancelResponse messages with role "assistant"',
        );
      }
      realtime.send('response.cancel');

      final content = item['content'] as List<Map<String, dynamic>>;
      final audioIndex = content.indexWhere((c) => c['type'] == 'audio');
      if (audioIndex == -1) {
        throw Exception('Could not find audio on item to cancel');
      }
      realtime.send('conversation.item.truncate', {
        'item_id': id,
        'content_index': audioIndex,
        'audio_end_ms':
            (sampleCount / conversation.defaultFrequency * 1000).floor(),
      });
      return {'item': item};
    }
  }

  /// Utility for waiting for the next `conversation.item.appended` event to
  /// be triggered by the server.
  Future<Map<String, dynamic>> waitForNextItem({
    Duration? timeout,
  }) async {
    final event = await waitForNext(
      'conversation.item.appended',
      timeout: timeout,
    );
    return {'item': event?['item']};
  }

  /// Utility for waiting for the next `conversation.item.completed` event to
  /// be triggered by the server.
  Future<Map<String, dynamic>> waitForNextCompletedItem({
    Duration? timeout,
  }) async {
    final event = await waitForNext(
      'conversation.item.completed',
      timeout: timeout,
    );
    return {'item': event?['item']};
  }
}
