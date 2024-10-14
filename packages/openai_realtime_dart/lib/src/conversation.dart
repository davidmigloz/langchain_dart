import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'utils.dart';

/// Stores a client-side cache of the current conversation and performs event
/// validation to make sure it can cache them properly.
class RealtimeConversation {
  /// Create a new [RealtimeConversation] instance.
  RealtimeConversation() {
    _initializeEventProcessors();
  }

  /// Map of item ids to items.
  final Map<String, dynamic> itemLookup = {};

  /// List of items in the conversation.
  final List<dynamic> items = [];

  /// Map of response ids to responses.
  final Map<String, dynamic> responseLookup = {};

  /// List of responses in the conversation.
  final List<dynamic> responses = [];

  /// Map of queued speech items.
  final Map<String, dynamic> queuedSpeechItems = {};

  /// Map of queued transcript items.
  final Map<String, dynamic> queuedTranscriptItems = {};

  /// Queued input audio.
  Uint8List? queuedInputAudio;

  /// Event processors for conversation events.
  final Map<
      String,
      FutureOr<Map<String, dynamic>> Function(
          Map<String, dynamic>? event, [
          dynamic args,
          ])> _eventProcessors = {};

  /// Default frequency for audio.
  final int defaultFrequency = 24000; // 24,000 Hz

  void _initializeEventProcessors() {
    _eventProcessors['conversation.item.created'] = (Map<String, dynamic>? event, [
      dynamic args,
    ]) {
      final item = event?['item'];
      final newItem = Map<String, dynamic>.from(item);
      if (!itemLookup.containsKey(newItem['id'])) {
        itemLookup[newItem['id']] = newItem;
        items.add(newItem);
      }
      newItem['formatted'] = {
        'audio': Uint8List(0),
        'text': '',
        'transcript': '',
      };
      // If we have a speech item, can populate audio
      final newItemId = newItem['id'] as String;
      final formatted = newItem['formatted'] as Map<String, dynamic>;
      if (queuedSpeechItems.containsKey(newItemId)) {
        final queuedSpeechItem =
        queuedSpeechItems[newItemId] as Map<String, dynamic>;
        formatted['audio'] = queuedSpeechItem['audio'];
        queuedSpeechItems.remove(newItemId);
      }
      // Populate formatted text if it comes out on creation
      final newItemContent =
      (newItem['content'] as List<dynamic>?)?.cast<Map<String, dynamic>>();
      if (newItemContent != null) {
        final textContent = newItemContent
            .where((c) => ['text', 'input_text'].contains(c['type'] as String));
        for (final content in textContent) {
          formatted['text'] = '${formatted['text']}${content['text']}';
        }
      }
      // If we have a transcript item, can pre-populate transcript
      if (queuedTranscriptItems.containsKey(newItem['id'])) {
        final queuedTranscriptItem =
        queuedTranscriptItems[newItemId] as Map<String, dynamic>;
        formatted['transcript'] = queuedTranscriptItem['transcript'];
        queuedTranscriptItems.remove(newItem['id']);
      }
      if (newItem['type'] == 'message') {
        if (newItem['role'] == 'user') {
          newItem['status'] = 'completed';
          if (queuedInputAudio != null) {
            formatted['audio'] = queuedInputAudio;
            queuedInputAudio = null;
          }
        } else {
          newItem['status'] = 'in_progress';
        }
      } else if (newItem['type'] == 'function_call') {
        formatted['tool'] = {
          'type': 'function',
          'name': newItem['name'],
          'call_id': newItem['call_id'],
          'arguments': '',
        };
        newItem['status'] = 'in_progress';
      } else if (newItem['type'] == 'function_call_output') {
        newItem['status'] = 'completed';
        formatted['output'] = newItem['output'];
      }
      return {'item': newItem, 'delta': null};
    };

    _eventProcessors['conversation.item.truncated'] = (Map<String, dynamic>? event, [
      dynamic args,
    ]) {
      final itemId = event?['item_id'];
      final audioEndMs = event?['audio_end_ms'] as int;
      final item = itemLookup[itemId] as Map<String, dynamic>?;
      if (item == null) {
        throw Exception('item.truncated: Item "$itemId" not found');
      }
      final formatted = item['formatted'] as Map<String, dynamic>;
      final endIndex = audioEndMs * defaultFrequency ~/ 1000;
      formatted['transcript'] = '';
      formatted['audio'] =
          (formatted['audio'] as Uint8List).sublist(0, endIndex);
      return {'item': item, 'delta': null};
    };

    _eventProcessors['conversation.item.deleted'] = (Map<String, dynamic>? event, [
      dynamic args,
    ]) {
      final itemId = event?['item_id'];
      final item = itemLookup[itemId];
      if (item == null) {
        throw Exception('item.deleted: Item "$itemId" not found');
      }
      itemLookup.remove(itemId);
      items.remove(item);
      return {'item': item, 'delta': null};
    };

    _eventProcessors['conversation.item.input_audio_transcription.completed'] =
        (Map<String, dynamic>? event, [
      dynamic args,
    ]) {
      final itemId = event?['item_id'];
      final contentIndex = event?['content_index'];
      final transcript = event?['transcript'];
      final item = itemLookup[itemId] as Map<String, dynamic>?;
      // We use a single space to represent an empty transcript for .formatted values
      // Otherwise it looks like no transcript provided
      final formattedTranscript = transcript ?? ' ';
      if (item == null) {
        // We can receive transcripts in VAD mode before item.created
        // This happens specifically when audio is empty
        queuedTranscriptItems[itemId] = {'transcript': formattedTranscript};
        return {'item': null, 'delta': null};
      } else {
        print('Library: ${item}');
        final List<dynamic> dynamicContent = item['content'] as List<dynamic>;
        final List<Map<String, dynamic>> itemContent = dynamicContent.map((e) => Map<String, dynamic>.from(e)).toList();

        final formatted = item['formatted'] as Map<String, dynamic>;
        itemContent[contentIndex]['transcript'] = transcript;
        formatted['transcript'] = formattedTranscript;
        return {
          'item': item,
          'delta': {'transcript': transcript},
        };
      }
    };

    _eventProcessors['input_audio_buffer.speech_started'] = (Map<String, dynamic>? event, [
      dynamic args,
    ]) {
      final itemId = event?['item_id'];
      final audioStartMs = event?['audio_start_ms'];
      queuedSpeechItems[itemId] = {'audio_start_ms': audioStartMs};
      return {'item': null, 'delta': null};
    };

    _eventProcessors['input_audio_buffer.speech_stopped'] = (Map<String, dynamic>? event, [
      dynamic args,
    ]) {
      final itemId = event?['item_id'];
      final audioEndMs = event?['audio_end_ms'];
      final speech = queuedSpeechItems[itemId] as Map<String, dynamic>;
      speech['audio_end_ms'] = audioEndMs;
      if (args != null) {
        final inputAudioBuffer = args as Uint8List;
        final speechAudioStartMs = speech['audio_start_ms'] as int;
        final speechAudioEndMs = speech['audio_end_ms'] as int;
        final startIndex = speechAudioStartMs * defaultFrequency ~/ 1000;
        final endIndex = speechAudioEndMs * defaultFrequency ~/ 1000;
        speech['audio'] = inputAudioBuffer.sublist(startIndex, endIndex);
      }
      return {'item': null, 'delta': null};
    };

    _eventProcessors['response.created'] = (Map<String, dynamic>? event, [
      dynamic args,
    ]) {
      final response = event?['response'] as Map<String, dynamic>?;
      final responseId = response?['id'] as String? ?? '';
      if (!responseLookup.containsKey(responseId)) {
        responseLookup[responseId] = response;
        responses.add(response);
      }
      return {'item': null, 'delta': null};
    };

    _eventProcessors['response.output_item.added'] = (Map<String, dynamic>? event, [
      dynamic args,
    ]) {
      final responseId = event?['response_id'];
      final item = event?['item'] as Map<String, dynamic>?;
      final itemId = item?['id'] as String? ?? '';
      final response = responseLookup[responseId] as Map<String, dynamic>?;
      if (response == null) {
        throw Exception(
          'response.output_item.added: Response "$responseId" not found',
        );
      }
      (response['output'] as List<dynamic>).add(itemId);
      return {'item': null, 'delta': null};
    };

    _eventProcessors['response.output_item.done'] = (Map<String, dynamic>? event, [
      dynamic args,
    ]) {
      final item = event?['item'] as Map<String, dynamic>?;
      if (item == null) {
        throw Exception('response.output_item.done: Missing "item"');
      }
      final itemId = item['id'] as String;
      final foundItem = itemLookup[itemId] as Map<String, dynamic>?;
      if (foundItem == null) {
        throw Exception(
          'response.output_item.done: Item "${item['id']}" not found',
        );
      }
      foundItem['status'] = item['status'];
      return {'item': foundItem, 'delta': null};
    };

    _eventProcessors['response.content_part.added'] = (Map<String, dynamic>? event, [
      dynamic args,
    ]) {
      final itemId = event?['item_id'];
      final part = event?['part'];
      final item = itemLookup[itemId] as Map<String, dynamic>?;
      if (item == null) {
        throw Exception(
          'response.content_part.added: Item "$itemId" not found',
        );
      }
      (item['content'] as List<dynamic>).add(part);
      return {'item': item, 'delta': null};
    };

    _eventProcessors['response.audio_transcript.delta'] = (Map<String, dynamic>? event, [
      dynamic args,
    ]) {
      final itemId = event?['item_id'];
      final contentIndex = event?['content_index'];
      final delta = event?['delta'];
      final item = itemLookup[itemId] as Map<String, dynamic>?;
      if (item == null) {
        throw Exception(
          'response.audio_transcript.delta: Item "$itemId" not found',
        );
      }
      final itemContent =
      (item['content'] as List<dynamic>).cast<Map<String, dynamic>>();
      final itemTranscript = itemContent[contentIndex]['transcript'] as String;
      final formatted = item['formatted'] as Map<String, dynamic>;
      final formattedTranscript = formatted['transcript'] as String;
      itemContent[contentIndex]['transcript'] = itemTranscript + delta;
      formatted['transcript'] = formattedTranscript + delta;
      return {
        'item': item,
        'delta': {'transcript': delta},
      };
    };

    _eventProcessors['response.audio.delta'] = (Map<String, dynamic>? event, [
      dynamic args,
    ]) {
      final itemId = event?['item_id'];
      final delta = event?['delta'];
      final item = itemLookup[itemId] as Map<String, dynamic>?;
      if (item == null) {
        throw Exception('response.audio.delta: Item "$itemId" not found');
      }
      // This never gets rendered, we care about the file data instead
      // item.content[content_index].audio += delta;
      final arrayBuffer = base64.decode(delta);
      final formatted = item['formatted'] as Map<String, dynamic>;
      formatted['audio'] = RealtimeUtils.mergeUint8Lists(
        formatted['audio'],
        arrayBuffer,
      );
      return {
        'item': item,
        'delta': {'audio': arrayBuffer},
      };
    };

    _eventProcessors['response.text.delta'] = (Map<String, dynamic>? event, [
      dynamic args,
    ]) {
      final itemId = event?['item_id'];
      final contentIndex = event?['content_index'];
      final delta = event?['delta'];
      final item = itemLookup[itemId] as Map<String, dynamic>?;
      if (item == null) {
        throw Exception('response.text.delta: Item "$itemId" not found');
      }
      final List<dynamic> dynamicContent = item['content'] as List<dynamic>;
      final List<Map<String, dynamic>> itemContent = dynamicContent.map((e) => Map<String, dynamic>.from(e)).toList();

      // final itemContent = item['content'] as List<Map<String, dynamic>>;
      final itemText = itemContent[contentIndex]['text'] as String;
      final formatted = item['formatted'] as Map<String, dynamic>;
      final formattedText = formatted['text'] as String;
      itemContent[contentIndex]['text'] = itemText + delta;
      formatted['text'] = formattedText + delta;
      return {
        'item': item,
        'delta': {'text': delta},
      };
    };

    _eventProcessors['response.function_call_arguments.delta'] = (Map<String, dynamic>? event, [
      dynamic args,
    ]) {
      final itemId = event?['item_id'];
      final delta = event?['delta'];
      final item = itemLookup[itemId] as Map<String, dynamic>?;
      if (item == null) {
        throw Exception(
          'response.function_call_arguments.delta: Item "$itemId" not found',
        );
      }
      final arguments = item['arguments'] as String;
      final formatted = item['formatted'] as Map<String, dynamic>;
      final formattedTool = formatted['tool'] as Map<String, dynamic>;
      final formattedToolArguments = formattedTool['arguments'] as String;
      item['arguments'] = arguments + delta;
      formattedTool['arguments'] = formattedToolArguments + delta;
      return {
        'item': item,
        'delta': {'arguments': delta},
      };
    };
  }

  /// * Clears the conversation history and resets to default.
  void clear() {
    itemLookup.clear();
    items.clear();
    responseLookup.clear();
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
  FutureOr<Map<String, dynamic>> processEvent(Map<String, dynamic>? event, [
    dynamic args,
  ]) {
    if (event?['event_id'] == null) {
      throw Exception('Missing "event_id" on event');
    }
    if (event?['type'] == null) {
      throw Exception('Missing "type" on event');
    }

    final eventProcessor = _eventProcessors[event?['type']];
    if (eventProcessor == null) {
      throw Exception(
        'Missing conversation event processor for "${event?['type']}"',
      );
    }

    return eventProcessor(event, args);
  }

  /// Retrieves a item by id.
  dynamic getItem(String id) {
    return itemLookup[id];
  }

  /// Retrieves all items in the conversation.
  List<dynamic> getItems() {
    return List.from(items);
  }
}
