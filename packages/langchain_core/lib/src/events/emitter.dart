import 'dart:async';

import 'event.dart';

class RunnableEventEmitter {
  RunnableEventEmitter({
    this.onEvent,
  });

  /// Called whenever a new event is emitted.
  FutureOr<void> Function(RunnableEvent event)? onEvent;

  late final _eventController = StreamController<RunnableEvent>.broadcast();

  /// The current [stream] of events.
  Stream<RunnableEvent> get stream => _eventController.stream;

  /// Whether the emitter is closed.
  ///
  /// A manager is considered closed once [close] is called.
  /// Subsequent state changes cannot occur within a closed bloc.
  bool get isClosed => _eventController.isClosed;

  /// Emits a new [event].
  Future<void> emit(final RunnableEvent event) async {
    if (isClosed) {
      throw StateError('Cannot emit new events after calling close');
    }

    _eventController.add(event);
    if (onEvent != null) {
      await onEvent!(event);
    }
  }

  /// Closes the instance.
  /// This method should be called when the instance is no longer needed.
  /// Once [close] is called, the instance can no longer be used.
  Future<void> close() {
    return _eventController.close();
  }
}
