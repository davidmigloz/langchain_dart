// ignore_for_file: unnecessary_async

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:logging/logging.dart';

import 'api.dart';
import 'conversation.dart';
import 'event_handler.dart';
import 'schema/generated/schema/schema.dart';
import 'schema/schema.dart';
import 'utils.dart';

final _log = Logger('openai_realtime_dart.api');

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
  late SessionConfig sessionConfig;

  /// The tools added to the client.
  final Map<String, (ToolDefinition, ToolHandler)> tools = {};

  /// Whether the session has been created.
  bool sessionCreated = false;

  /// The input audio buffer.
  Uint8List inputAudioBuffer = Uint8List(0);

  void _resetConfig() {
    sessionCreated = false;
    tools.clear();
    sessionConfig = const SessionConfig(
      modalities: [Modality.text, Modality.audio],
      instructions: '',
      voice: Voice.alloy,
      inputAudioFormat: AudioFormat.pcm16,
      outputAudioFormat: AudioFormat.pcm16,
      inputAudioTranscription: null,
      turnDetection: null,
      tools: [],
      toolChoice: SessionConfigToolChoice.mode(
        SessionConfigToolChoiceMode.auto,
      ),
      temperature: 0.8,
      maxResponseOutputTokens: SessionConfigMaxResponseOutputTokens.int(4096),
    );
    inputAudioBuffer = Uint8List(0);
  }

  void _addApiEventHandlers() {
    realtime
      ..on(RealtimeEventType.sessionCreated, (_) => sessionCreated = true)
      ..on(
        RealtimeEventType.all,
        ((e) async => dispatch(RealtimeEventType.all, e)),
      );

    Future<EventHandlerResult> handler(
      RealtimeEvent event, [
      dynamic args,
    ]) async {
      return conversation.processEvent(event, args);
    }

    Future<EventHandlerResult> handlerWithDispatch(
      RealtimeEvent event, [
      dynamic args,
    ]) async {
      final result = await handler(event, args);
      if (result.item != null) {
        await dispatch(
          RealtimeEventType.conversationUpdated,
          RealtimeEvent.conversationUpdated(
            eventId: RealtimeUtils.generateId(),
            result: result,
          ),
        );
      }
      return result;
    }

    realtime
      ..on(RealtimeEventType.responseCreated, handler)
      ..on(RealtimeEventType.responseOutputItemAdded, handler)
      ..on(RealtimeEventType.responseContentPartAdded, handler)
      ..on(RealtimeEventType.inputAudioBufferSpeechStarted, (event) async {
        await handler(event);
        await dispatch(
          RealtimeEventType.conversationInterrupted,
          RealtimeEvent.conversationInterrupted(
            eventId: RealtimeUtils.generateId(),
          ),
        );
      })
      ..on(
        RealtimeEventType.inputAudioBufferSpeechStopped,
        (event) async => handler(event, inputAudioBuffer),
      )
      ..on(RealtimeEventType.conversationItemCreated, (event) async {
        final result = await handlerWithDispatch(event);
        await dispatch(
          RealtimeEventType.conversationItemAppended,
          RealtimeEvent.conversationItemAppended(
            eventId: RealtimeUtils.generateId(),
            item: result.item!,
          ),
        );
        if (result.item?.item.status == ItemStatus.completed) {
          await dispatch(
            RealtimeEventType.conversationItemCompleted,
            RealtimeEvent.conversationItemCompleted(
              eventId: RealtimeUtils.generateId(),
              item: result.item!,
            ),
          );
        }
      })
      ..on(RealtimeEventType.conversationItemTruncated, handlerWithDispatch)
      ..on(RealtimeEventType.conversationItemDeleted, handlerWithDispatch)
      ..on(
        RealtimeEventType.conversationItemInputAudioTranscriptionCompleted,
        handlerWithDispatch,
      )
      ..on(
        RealtimeEventType.responseAudioTranscriptDelta,
        handlerWithDispatch,
      )
      ..on(RealtimeEventType.responseAudioDelta, handlerWithDispatch)
      ..on(RealtimeEventType.responseTextDelta, handlerWithDispatch)
      ..on(
        RealtimeEventType.responseFunctionCallArgumentsDelta,
        handlerWithDispatch,
      )
      ..on(RealtimeEventType.responseOutputItemDone, (event) async {
        final result = await handlerWithDispatch(event);
        if (result.item?.item.status == ItemStatus.completed) {
          await dispatch(
            RealtimeEventType.conversationItemCompleted,
            RealtimeEvent.conversationItemCompleted(
              eventId: RealtimeUtils.generateId(),
              item: result.item!,
            ),
          );
        }

        final tool = result.item?.formatted?.tool;
        if (tool != null) {
          unawaited(_callTool(tool));
        }
      });
  }

  Future<void> _callTool(FormattedTool tool) async {
    try {
      final name = tool.name;
      final arguments = tool.arguments;
      final jsonArguments =
          jsonDecode(arguments) as Map<String, dynamic>? ?? const {};

      final toolConfig = tools[name];
      if (toolConfig == null) {
        throw Exception('Tool "$name" has not been added');
      }

      _log.info('Calling tool "$name" with arguments:\n$arguments');

      final (spec, handler) = toolConfig;
      final result = await handler(jsonArguments);

      _log.fine('Result of calling "$name" tool:\n$result');

      await realtime.send(
        RealtimeEvent.conversationItemCreate(
          eventId: RealtimeUtils.generateId(),
          item: Item.functionCallOutput(
            id: tool.callId,
            callId: tool.callId,
            output: jsonEncode(result),
          ),
        ),
      );
    } catch (e) {
      _log.severe('Error calling tool "${tool.name}":\n$e');
      await realtime.send(
        RealtimeEvent.conversationItemCreate(
          eventId: RealtimeUtils.generateId(),
          item: Item.functionCallOutput(
            id: tool.callId,
            callId: tool.callId,
            output: jsonEncode({'error': e.toString()}),
          ),
        ),
      );
    }
    await createResponse();
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
  ///
  /// [model] specifies which model to use. You can find the list of available
  /// models [here](https://platform.openai.com/docs/models).
  Future<bool> connect({
    final String model = RealtimeUtils.defaultModel,
  }) async {
    if (isConnected()) {
      throw Exception('Already connected, use .disconnect() first');
    }
    final connected = await realtime.connect(model: model);
    if (connected) {
      await updateSession();
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
    if (realtime.isConnected()) {
      await realtime.disconnect();
    }
    conversation.clear();
  }

  /// Gets the active turn detection mode.
  TurnDetectionType? getTurnDetectionType() {
    return sessionConfig.turnDetection?.type;
  }

  /// Add a tool and handler.
  Future<(ToolDefinition, ToolHandler)> addTool(
    ToolDefinition definition,
    ToolHandler handler,
  ) async {
    final name = definition.name;
    if (tools.containsKey(name)) {
      throw Exception(
        'Tool "$name" already added. '
        'Please use .removeTool("$name") before trying to add again.',
      );
    }
    final tool = (definition, handler);
    tools[name] = (definition, handler);
    await updateSession();
    return tool;
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
  Future<bool> deleteItem(String id) async {
    await realtime.send(
      RealtimeEvent.conversationItemDelete(
        eventId: RealtimeUtils.generateId(),
        itemId: id,
      ),
    );
    return true;
  }

  /// Updates session configuration.
  /// If the client is not yet connected, will save details and instantiate
  /// upon connection.
  Future<void> updateSession({
    List<Modality>? modalities,
    String? instructions,
    Voice? voice,
    AudioFormat? inputAudioFormat,
    AudioFormat? outputAudioFormat,
    InputAudioTranscriptionConfig? inputAudioTranscription,
    TurnDetection? turnDetection,
    List<ToolDefinition>? tools,
    SessionConfigToolChoice? toolChoice,
    double? temperature,
    SessionConfigMaxResponseOutputTokens? maxResponseOutputTokens,
  }) async {
    // Load tools from tool definitions + already loaded tools
    final useTools = [
      ...?tools,
      ...this.tools.values.map((tool) => tool.$1),
    ];

    sessionConfig = sessionConfig.copyWith(
      modalities: modalities ?? sessionConfig.modalities,
      instructions: instructions ?? sessionConfig.instructions,
      voice: voice ?? sessionConfig.voice,
      inputAudioFormat: inputAudioFormat ?? sessionConfig.inputAudioFormat,
      outputAudioFormat: outputAudioFormat ?? sessionConfig.outputAudioFormat,
      inputAudioTranscription:
          inputAudioTranscription ?? sessionConfig.inputAudioTranscription,
      turnDetection: turnDetection ?? sessionConfig.turnDetection,
      tools: useTools,
      toolChoice: toolChoice ?? sessionConfig.toolChoice,
      temperature: temperature ?? sessionConfig.temperature,
      maxResponseOutputTokens:
          maxResponseOutputTokens ?? sessionConfig.maxResponseOutputTokens,
    );

    if (realtime.isConnected()) {
      await realtime.send(
        RealtimeEvent.sessionUpdate(
          eventId: RealtimeUtils.generateId(),
          session: sessionConfig,
        ),
      );
    }
  }

  /// Sends user message content and generates a response.
  Future<bool> sendUserMessageContent(List<ContentPart> content) async {
    await realtime.send(
      RealtimeEvent.conversationItemCreate(
        eventId: RealtimeUtils.generateId(),
        item: Item.message(
          id: RealtimeUtils.generateId(),
          status: ItemStatus.completed,
          role: ItemRole.user,
          content: content,
        ),
      ),
    );
    return createResponse();
  }

  /// Appends user audio to the existing audio buffer.
  Future<bool> appendInputAudio(Uint8List audioData) async {
    if (audioData.isNotEmpty) {
      await realtime.send(
        RealtimeEvent.inputAudioBufferAppend(
          eventId: RealtimeUtils.generateId(),
          audio: base64.encode(audioData),
        ),
      );
      inputAudioBuffer = RealtimeUtils.mergeUint8Lists(
        inputAudioBuffer,
        audioData,
      );
    }
    return true;
  }

  /// Forces a model response generation.
  Future<bool> createResponse() async {
    if (getTurnDetectionType() == null && inputAudioBuffer.isNotEmpty) {
      await realtime.send(
        RealtimeEvent.inputAudioBufferCommit(
          eventId: RealtimeUtils.generateId(),
        ),
      );
      conversation.queueInputAudio(inputAudioBuffer);
      inputAudioBuffer = Uint8List(0);
    }
    await realtime.send(
      RealtimeEvent.responseCreate(
        eventId: RealtimeUtils.generateId(),
      ),
    );
    return true;
  }

  /// Cancels the ongoing server generation and truncates ongoing generation,
  /// if applicable.
  /// If no id provided, will simply call `cancel_generation` command.
  Future<ItemMessage?> cancelResponse(String? id, [int sampleCount = 0]) async {
    if (id == null) {
      await realtime.send(
        RealtimeEvent.responseCancel(
          eventId: RealtimeUtils.generateId(),
        ),
      );
      return null;
    } else {
      final formattedItem = conversation.getItem(id);
      if (formattedItem == null) {
        throw Exception('Could not find item "$id"');
      }

      final item = formattedItem.item;

      if (item is! ItemMessage) {
        throw Exception('Can only cancelResponse messages with type "message"');
      } else if (item.role != ItemRole.assistant) {
        throw Exception(
          'Can only cancelResponse messages with role "assistant"',
        );
      }
      await realtime.send(
        RealtimeEvent.responseCancel(
          eventId: RealtimeUtils.generateId(),
        ),
      );

      final audioIndex = item.content.indexWhere((c) => c is ContentPartAudio);
      if (audioIndex == -1) {
        throw Exception('Could not find audio on item to cancel');
      }
      await realtime.send(
        RealtimeEvent.conversationItemTruncate(
          eventId: RealtimeUtils.generateId(),
          itemId: id,
          contentIndex: audioIndex,
          audioEndMs:
              (sampleCount / conversation.defaultFrequency * 1000).floor(),
        ),
      );
      return item;
    }
  }

  /// Utility for waiting for the next `conversation.item.appended` event to
  /// be triggered by the server.
  Future<FormattedItem?> waitForNextItem({
    Duration? timeout,
  }) async {
    final res = await waitForNext(
      RealtimeEventType.conversationItemAppended,
      timeout: timeout,
    ) as RealtimeEventConversationItemAppended?;
    return res?.item;
  }

  /// Utility for waiting for the next `conversation.item.completed` event to
  /// be triggered by the server.
  Future<FormattedItem?> waitForNextCompletedItem({
    Duration? timeout,
  }) async {
    final res = await waitForNext(
      RealtimeEventType.conversationItemCompleted,
      timeout: timeout,
    ) as RealtimeEventConversationItemCompleted?;
    return res?.item;
  }
}

/// The handler for a tool.
typedef ToolHandler = FutureOr<Map<String, dynamic>> Function(
  Map<String, dynamic>,
);
