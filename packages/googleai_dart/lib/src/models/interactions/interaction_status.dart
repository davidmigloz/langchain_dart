/// The status of an interaction.
enum InteractionStatus {
  /// The interaction is in progress.
  inProgress,

  /// The interaction requires action from the user.
  requiresAction,

  /// The interaction has completed successfully.
  completed,

  /// The interaction has failed.
  failed,

  /// The interaction was cancelled.
  cancelled,
}

/// Converts a string to [InteractionStatus].
InteractionStatus interactionStatusFromString(String? value) {
  return switch (value) {
    'in_progress' => InteractionStatus.inProgress,
    'requires_action' => InteractionStatus.requiresAction,
    'completed' => InteractionStatus.completed,
    'failed' => InteractionStatus.failed,
    'cancelled' => InteractionStatus.cancelled,
    _ => InteractionStatus.inProgress,
  };
}

/// Converts [InteractionStatus] to a string.
String interactionStatusToString(InteractionStatus status) {
  return switch (status) {
    InteractionStatus.inProgress => 'in_progress',
    InteractionStatus.requiresAction => 'requires_action',
    InteractionStatus.completed => 'completed',
    InteractionStatus.failed => 'failed',
    InteractionStatus.cancelled => 'cancelled',
  };
}
