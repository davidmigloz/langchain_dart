import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'schema/schema.dart';
import 'utils.dart';

/// Stores a client-side cache of the current conversation and performs event
/// validation to make sure it can cache them properly.
class RealtimeConversation {
  /// Create a new [RealtimeConversation] instance.
  RealtimeConversation() {
    _initializeEventProcessors();
  }

  /// Map of item ids to items.
  final Map<String, FormattedItem> items = {};

  /// Map of response ids to responses.
  final Map<String, Response> responses = {};

  /// Map of queued speech items.
  final Map<String, ItemSpeech> queuedSpeechItems = {};

  /// Map of queued transcript items.
  final Map<String, ItemTranscript> queuedTranscriptItems = {};

  /// Queued input audio.
  Uint8List? queuedInputAudio;

  /// Event processors for conversation events.
  final Map<
      RealtimeEventType,
      FutureOr<EventHandlerResult> Function(
        RealtimeEvent event, [
        dynamic args,
      ])> _eventProcessors = {};

  /// Default frequency for audio.
  final defaultFrequency = 24000; // 24,000 Hz

  void _initializeEventProcessors() {
    _eventProcessors[RealtimeEventType.conversationItemCreated] = (
      RealtimeEvent e, [
      dynamic args,
    ]) {
      final event = e as RealtimeEventConversationItemCreated;
      final item = event.item;
      var newItem = FormattedItem(
        item: item,
        formatted: FormattedProperty(
          audio: Uint8List(0),
          text: '',
          transcript: '',
        ),
      );

      if (!items.containsKey(item.id)) {
        items[item.id] = newItem;
      } else {
        newItem = items[item.id]!;
      }

      // If we have a speech item, can populate audio
      if (queuedSpeechItems.containsKey(item.id)) {
        newItem = newItem.copyWith(
          formatted: newItem.formatted!.copyWith(
            audio: queuedSpeechItems[item.id]!.audio!,
          ),
        );
        queuedSpeechItems.remove(item.id);
      }

      // Populate formatted text if it comes out on creation
      if (item is ItemMessage && item.content.isNotEmpty) {
        final textContent = item.content
            .where(
              (c) => c is ContentPartText || c is ContentPartInputText,
            )
            .toList(growable: false);
        newItem = newItem.copyWith(
          formatted: newItem.formatted!.copyWith(
            text: textContent
                .map((c) {
                  switch (c) {
                    case ContentPartInputText(): return c.text;
                    case ContentPartText(): return c.text;
                    default: return null;
                  }
                })
                .join(),
          ),
        );
      }

      // If we have a transcript item, can pre-populate transcript
      if (queuedTranscriptItems.containsKey(item.id)) {
        newItem = newItem.copyWith(
          formatted: newItem.formatted!.copyWith(
            transcript: queuedTranscriptItems[item.id]!.transcript,
          ),
        );
        queuedTranscriptItems.remove(item.id);
      }

      if (item is ItemMessage) {
        if (item.role == ItemRole.user) {
          if (queuedInputAudio != null) {
            newItem = newItem.copyWith(
              formatted: newItem.formatted!.copyWith(audio: queuedInputAudio!),
            );
            queuedInputAudio = null;
          }
          newItem = newItem.copyWith(
            item: item.copyWith(status: ItemStatus.completed),
          );
        } else {
          newItem = newItem.copyWith(
            item: item.copyWith(status: ItemStatus.inProgress),
          );
        }
      } else if (item is ItemFunctionCall) {
        newItem = newItem.copyWith(
          item: item.copyWith(status: ItemStatus.inProgress),
          formatted: newItem.formatted!.copyWith(
            tool: FormattedTool(
              type: ToolType.function,
              name: item.name,
              callId: item.callId,
              arguments: item.arguments,
            ),
          ),
        );
      } else if (item is ItemFunctionCallOutput) {
        newItem = newItem.copyWith(
          item: item.copyWith(status: ItemStatus.completed),
          formatted: newItem.formatted!.copyWith(output: item.output),
        );
      }

      items[item.id] = newItem;
      return EventHandlerResult(item: newItem);
    };

    _eventProcessors[RealtimeEventType.conversationItemTruncated] = (
      RealtimeEvent e, [
      dynamic args,
    ]) {
      final event = e as RealtimeEventConversationItemTruncated;
      var foundItem = items[event.itemId];
      if (foundItem == null) {
        throw Exception('item.truncated: Item "${event.itemId}" not found');
      }
      final endIndex = event.audioEndMs * defaultFrequency ~/ 1000;
      foundItem = foundItem.copyWith(
        formatted: foundItem.formatted!.copyWith(
          transcript: '',
          audio: foundItem.formatted!.audio.sublist(0, endIndex),
        ),
      );

      items[event.itemId] = foundItem;
      return EventHandlerResult(item: foundItem);
    };

    _eventProcessors[RealtimeEventType.conversationItemDeleted] = (
      RealtimeEvent e, [
      dynamic args,
    ]) {
      final event = e as RealtimeEventConversationItemDeleted;
      final foundItem = items[event.itemId];
      if (foundItem == null) {
        throw Exception('item.deleted: Item "${event.itemId}" not found');
      }
      items.remove(event.itemId);
      return EventHandlerResult(item: foundItem);
    };

    _eventProcessors[
        RealtimeEventType.conversationItemInputAudioTranscriptionCompleted] = (
      RealtimeEvent e, [
      dynamic args,
    ]) {
      final event =
          e as RealtimeEventConversationItemInputAudioTranscriptionCompleted;
      var foundItem = items[event.itemId];
      // We use a single space to represent an empty transcript for .formatted values
      // Otherwise it looks like no transcript provided
      final formattedTranscript =
          event.transcript.isEmpty ? ' ' : event.transcript;

      if (foundItem == null) {
        // We can receive transcripts in VAD mode before item.created
        // This happens specifically when audio is empty
        queuedTranscriptItems[event.itemId] = ItemTranscript(
          transcript: formattedTranscript,
        );
        return const EventHandlerResult();
      }

      final item = foundItem.item;
      if (item is ItemMessage) {
        final content = [...item.content];
        final contentPart = event.contentIndex < content.length
            ? content[event.contentIndex]
            : null;
        if (contentPart is ContentPartInputAudio) {
          content[event.contentIndex] = contentPart.copyWith(
            transcript: event.transcript,
          );
        } else if (contentPart is ContentPartAudio) {
          content[event.contentIndex] = contentPart.copyWith(
            transcript: event.transcript,
          );
        }
        foundItem = foundItem.copyWith(
          item: item.copyWith(content: content),
        );
      }

      foundItem = foundItem.copyWith(
        formatted:
            foundItem.formatted!.copyWith(transcript: formattedTranscript),
      );

      items[event.itemId] = foundItem;
      return EventHandlerResult(
        item: foundItem,
        delta: Delta(transcript: event.transcript),
      );
    };

    _eventProcessors[RealtimeEventType.inputAudioBufferSpeechStarted] = (
      RealtimeEvent e, [
      dynamic args,
    ]) {
      final event = e as RealtimeEventInputAudioBufferSpeechStarted;
      queuedSpeechItems[event.itemId] = ItemSpeech(
        audioStartMs: event.audioStartMs,
      );
      return const EventHandlerResult();
    };

    _eventProcessors[RealtimeEventType.inputAudioBufferSpeechStopped] = (
      RealtimeEvent e, [
      dynamic args,
    ]) {
      final event = e as RealtimeEventInputAudioBufferSpeechStopped;

      if (!queuedSpeechItems.containsKey(event.itemId)) {
        queuedSpeechItems[event.itemId] = ItemSpeech(
          audioStartMs: event.audioEndMs,
        );
      }

      final speech = queuedSpeechItems[event.itemId];
      if (speech == null) return const EventHandlerResult();

      queuedSpeechItems[event.itemId] = speech.copyWith(
        audioEndMs: event.audioEndMs,
      );

      if (args != null) {
        final inputAudioBuffer = args as Uint8List;
        final startIndex = speech.audioStartMs * defaultFrequency ~/ 1000;
        final endIndex = event.audioEndMs * defaultFrequency ~/ 1000;
        queuedSpeechItems[event.itemId] = speech.copyWith(
          audio: inputAudioBuffer.sublist(startIndex, endIndex),
        );
      }
      return const EventHandlerResult();
    };

    _eventProcessors[RealtimeEventType.responseCreated] = (
      RealtimeEvent e, [
      dynamic args,
    ]) {
      final event = e as RealtimeEventResponseCreated;
      final response = event.response;
      if (!responses.containsKey(response.id)) {
        responses[response.id] = response;
      }
      return const EventHandlerResult();
    };

    _eventProcessors[RealtimeEventType.responseOutputItemAdded] = (
      RealtimeEvent e, [
      dynamic args,
    ]) {
      final event = e as RealtimeEventResponseOutputItemAdded;
      var foundResponse = responses[event.responseId];
      if (foundResponse == null) {
        throw Exception(
          'response.output_item.added: Response "${event.responseId}" not found',
        );
      }
      final output = [...foundResponse.output, event.item];
      foundResponse = foundResponse.copyWith(output: output);
      responses[event.responseId] = foundResponse;
      return const EventHandlerResult();
    };

    _eventProcessors[RealtimeEventType.responseOutputItemDone] = (
      RealtimeEvent e, [
      dynamic args,
    ]) {
      final event = e as RealtimeEventResponseOutputItemDone;
      var foundItem = items[event.item.id];
      if (foundItem == null) {
        throw Exception(
          'response.output_item.done: Item "${event.item.id}" not found',
        );
      }
      foundItem = foundItem.copyWith(
        item: foundItem.item.copyWith(
          status: e.item.status,
        ),
      );

      items[event.item.id] = foundItem;
      return EventHandlerResult(item: foundItem);
    };

    _eventProcessors[RealtimeEventType.responseContentPartAdded] = (
      RealtimeEvent e, [
      dynamic args,
    ]) {
      final event = e as RealtimeEventResponseContentPartAdded;
      var foundItem = items[event.itemId];
      if (foundItem == null) {
        throw Exception(
          'response.content_part.added: Item "${event.itemId}" not found',
        );
      }
      final item = foundItem.item;
      if (item is ItemMessage) {
        final content = [...item.content, event.part];
        foundItem = foundItem.copyWith(
          item: item.copyWith(content: content),
        );
      }

      items[event.itemId] = foundItem;
      return EventHandlerResult(item: foundItem);
    };

    _eventProcessors[RealtimeEventType.responseAudioTranscriptDelta] = (
      RealtimeEvent e, [
      dynamic args,
    ]) {
      final event = e as RealtimeEventResponseAudioTranscriptDelta;
      var foundItem = items[event.itemId];
      if (foundItem == null) {
        throw Exception(
          'response.audio_transcript.delta: Item "${event.itemId}" not found',
        );
      }

      final item = foundItem.item;
      if (item is ItemMessage) {
        final content = [...item.content];
        final contentPart = event.contentIndex < content.length
            ? content[event.contentIndex]
            : null;
        if (contentPart is ContentPartInputAudio) {
          content[event.contentIndex] = contentPart.copyWith(
            transcript: (contentPart.transcript ?? '') + event.delta,
          );
        } else if (contentPart is ContentPartAudio) {
          content[event.contentIndex] = contentPart.copyWith(
            transcript: (contentPart.transcript ?? '') + event.delta,
          );
        }
        foundItem = foundItem.copyWith(
          item: item.copyWith(content: content),
        );
      }

      foundItem = foundItem.copyWith(
        formatted: foundItem.formatted!.copyWith(
          transcript: foundItem.formatted!.transcript + event.delta,
        ),
      );

      items[event.itemId] = foundItem;
      return EventHandlerResult(
        item: foundItem,
        delta: Delta(transcript: event.delta),
      );
    };

    _eventProcessors[RealtimeEventType.responseAudioDelta] = (
      RealtimeEvent e, [
      dynamic args,
    ]) {
      final event = e as RealtimeEventResponseAudioDelta;
      var foundItem = items[event.itemId];
      if (foundItem == null) {
        throw Exception(
          'response.audio.delta: Item "${event.itemId}" not found',
        );
      }
      final arrayBuffer = base64.decode(event.delta);
      foundItem = foundItem.copyWith(
        formatted: foundItem.formatted!.copyWith(
          audio: RealtimeUtils.mergeUint8Lists(
            foundItem.formatted!.audio,
            arrayBuffer,
          ),
        ),
      );

      items[event.itemId] = foundItem;
      return EventHandlerResult(
        item: foundItem,
        delta: Delta(audio: arrayBuffer),
      );
    };

    _eventProcessors[RealtimeEventType.responseTextDelta] = (
      RealtimeEvent e, [
      dynamic args,
    ]) {
      final event = e as RealtimeEventResponseTextDelta;
      var foundItem = items[event.itemId];
      if (foundItem == null) {
        throw Exception(
          'response.text.delta: Item "${event.itemId}" not found',
        );
      }

      if (foundItem.item is ItemMessage) {
        final messageItem = foundItem.item as ItemMessage;
        final content = [...messageItem.content];
        final contentPart = event.contentIndex < content.length
            ? content[event.contentIndex]
            : null;
        if (contentPart is ContentPartInputText) {
          content[event.contentIndex] = contentPart.copyWith(
            text: contentPart.text + event.delta,
          );
        } else if (contentPart is ContentPartText) {
          content[event.contentIndex] = contentPart.copyWith(
            text: contentPart.text + event.delta,
          );
        }
        foundItem = foundItem.copyWith(
          item: messageItem.copyWith(content: content),
        );
      }

      foundItem = foundItem.copyWith(
        formatted: foundItem.formatted!.copyWith(
          text: foundItem.formatted!.text + event.delta,
        ),
      );

      items[event.itemId] = foundItem;
      return EventHandlerResult(
        item: foundItem,
        delta: Delta(text: event.delta),
      );
    };

    _eventProcessors[RealtimeEventType.responseFunctionCallArgumentsDelta] = (
      RealtimeEvent e, [
      dynamic args,
    ]) {
      final event = e as RealtimeEventResponseFunctionCallArgumentsDelta;
      var foundItem = items[event.itemId];
      if (foundItem == null) {
        throw Exception(
          'response.function_call_arguments.delta: Item "${event.itemId}" not found',
        );
      }

      final item = foundItem.item;
      if (item is ItemFunctionCall) {
        foundItem = foundItem.copyWith(
          item: item.copyWith(
            arguments: item.arguments + event.delta,
          ),
        );
      }

      if (foundItem.formatted?.tool != null) {
        foundItem = foundItem.copyWith(
          formatted: foundItem.formatted!.copyWith(
            tool: foundItem.formatted!.tool!.copyWith(
              arguments: foundItem.formatted!.tool!.arguments + event.delta,
            ),
          ),
        );
      }

      items[event.itemId] = foundItem;
      return EventHandlerResult(
        item: foundItem,
        delta: Delta(arguments: event.delta),
      );
    };
  }

  /// Clears the conversation history and resets to default.
  void clear() {
    items.clear();
    responses.clear();
    queuedSpeechItems.clear();
    queuedTranscriptItems.clear();
    queuedInputAudio = null;
  }

  /// Queue input audio for manual speech event.
  Uint8List queueInputAudio(Uint8List inputAudio) {
    queuedInputAudio = inputAudio;
    return inputAudio;
  }

  /// Process an event from the WebSocket server and compose items.
  FutureOr<EventHandlerResult> processEvent(
    RealtimeEvent event, [
    dynamic args,
  ]) {
    final eventProcessor = _eventProcessors[event.type];
    if (eventProcessor == null) {
      throw Exception(
        'Missing conversation event processor for "${event.type}"',
      );
    }

    return eventProcessor(event, args);
  }

  /// Retrieves a item by id.
  FormattedItem? getItem(String id) {
    return items[id];
  }

  /// Retrieves all items in the conversation.
  List<FormattedItem> getItems() {
    return List.from(items.values);
  }
}
