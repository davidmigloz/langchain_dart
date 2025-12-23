/// Configuration constants for integration tests.
///
/// Centralizes model IDs and other test configuration to make it easy
/// to update when new models are released.
library;

/// The default generative model to use for content generation tests.
const defaultGenerativeModel = 'gemini-2.5-flash';

/// The default embedding model to use for embedding tests.
const defaultEmbeddingModel = 'gemini-embedding-001';

/// The default model to use for Live API WebSocket streaming tests.
/// Note: This is a preview model - ID may change.
const defaultLiveModel = 'gemini-2.5-flash-native-audio-preview-12-2025';
