import 'dart:async';

/// EventHandler callback.
typedef EventHandlerCallback = FutureOr<void> Function(
  Map<String, dynamic>? event,
);

/// Inherited class for RealtimeAPI and RealtimeClient.
///  Adds basic event handling.
class RealtimeEventHandler {
  final Map<String, List<EventHandlerCallback>> _eventHandlers = {};
  final Map<String, List<EventHandlerCallback>> _nextEventHandlers = {};

  /// Listen to specific events.
  /// - [eventName] The name of the event to listen to.
  /// - [callback] The callback function to call when the event is received.
  void on(String eventName, EventHandlerCallback callback) {
    _eventHandlers.putIfAbsent(eventName, () => []).add(callback);
  }

  /// Listen for the next event of a specified type.
  /// - [eventName] The name of the event to listen to.
  /// - [callback] The callback function to call when the event is received.
  void onNext(String eventName, EventHandlerCallback callback) {
    _nextEventHandlers.putIfAbsent(eventName, () => []).add(callback);
  }

  /// Turns off event listening for specific events.
  /// Calling without a callback will remove all listeners for the event.
  /// - [eventName] The name of the event to stop listening to.
  /// - [callback] The callback function to remove.
  void off(String eventName, [EventHandlerCallback? callback]) {
    if (callback == null) {
      _eventHandlers.remove(eventName);
    } else {
      _eventHandlers[eventName]?.remove(callback);
    }
  }

  /// Turns off event listening for the next event of a specific type.
  /// Calling without a callback will remove all listeners for the next event.
  /// - [eventName] The name of the event to stop listening to.
  /// - [callback] The callback function to remove.
  void offNext(String eventName, [EventHandlerCallback? callback]) {
    if (callback == null) {
      _nextEventHandlers.remove(eventName);
    } else {
      _nextEventHandlers[eventName]?.remove(callback);
    }
  }

  /// Waits for next event of a specific type and returns the payload.
  /// - [eventName] The name of the event to wait for.
  /// - [timeout] The maximum time to wait for the event.
  Future<Map<String, dynamic>?> waitForNext(
    String eventName, {
    Duration? timeout,
  }) async {
    final completer = Completer<Map<String, dynamic>?>();

    onNext(eventName, completer.complete);

    if (timeout != null) {
      return completer.future.timeout(timeout, onTimeout: () => null);
    }

    return completer.future;
  }

  /// Executes all events in the order they were added, with [on] event
  /// handlers executing before[onNext] handlers.
  /// - [eventName] The name of the event to dispatch.
  /// - [event] The event payload to pass to the handlers.
  void dispatch(String eventName, Map<String, dynamic>? event) {
    _eventHandlers[eventName]?.forEach((handler) async => handler(event));
    _nextEventHandlers[eventName]?.forEach((handler) async => handler(event));
    _nextEventHandlers.remove(eventName);
  }

  /// Clears all event handlers.
  void clearEventHandlers() {
    _eventHandlers.clear();
    _nextEventHandlers.clear();
  }
}
