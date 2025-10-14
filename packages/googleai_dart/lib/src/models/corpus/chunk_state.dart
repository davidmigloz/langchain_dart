/// Current state of the Chunk.
enum ChunkState {
  /// Unspecified state.
  unspecified,

  /// Chunk is pending processing (embedding generation).
  pendingProcessing,

  /// Chunk is active and ready for use.
  active,

  /// Chunk processing failed.
  failed,
}

/// Converts a string to a [ChunkState].
ChunkState chunkStateFromString(String? value) {
  return switch (value?.toUpperCase()) {
    'STATE_PENDING_PROCESSING' => ChunkState.pendingProcessing,
    'STATE_ACTIVE' => ChunkState.active,
    'STATE_FAILED' => ChunkState.failed,
    _ => ChunkState.unspecified,
  };
}

/// Converts a [ChunkState] to its string representation.
String chunkStateToString(ChunkState state) {
  return switch (state) {
    ChunkState.unspecified => 'STATE_UNSPECIFIED',
    ChunkState.pendingProcessing => 'STATE_PENDING_PROCESSING',
    ChunkState.active => 'STATE_ACTIVE',
    ChunkState.failed => 'STATE_FAILED',
  };
}
