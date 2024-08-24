import 'dart:async';

import 'event.dart';

abstract interface class EventListener<T> {
  /// Called whenever a new event is emitted.
  FutureOr<void> Function(T event)? onEvent;

  /// The current stream of events.
  Stream<T> get stream;

  /// Whether the emitter is closed.
  ///
  /// A listener is considered closed once [close] is called.
  bool get isClosed;

  /// Emits a new event to the listener.
  Future<void> emit(final T event);

  /// Closes the instance.
  ///
  /// This method should be called when the instance is no longer needed.
  /// Once [close] is called, the instance can no longer be used.
  Future<void> close();
}

class RunnableEventListener implements EventListener<RunnableEvent> {
  RunnableEventListener({
    this.onEvent,
  });

  late final _eventController = StreamController<RunnableEvent>.broadcast();

  @override
  FutureOr<void> Function(RunnableEvent event)? onEvent;

  @override
  Stream<RunnableEvent> get stream => _eventController.stream;

  @override
  bool get isClosed => _eventController.isClosed;

  @override
  Future<void> emit(final RunnableEvent event) async {
    if (isClosed) {
      throw StateError('Cannot emit new events after calling close');
    }

    _eventController.add(event);
    if (onEvent != null) {
      await onEvent!(event);
    }
  }

  @override
  Future<void> close() {
    return _eventController.close();
  }
}
