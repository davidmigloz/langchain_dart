# Live API Schema Reference

Complete reference for Gemini Live API WebSocket message types and schemas.

## Contents

- [WebSocket Endpoints](#websocket-endpoints)
- [Client Messages](#client-messages)
- [Server Messages](#server-messages)
- [Configuration Types](#configuration-types)
- [Enums](#enums)
- [Audio Format](#audio-format)
- [Session Lifecycle](#session-lifecycle)

---

## WebSocket Endpoints

### Google AI

```
wss://generativelanguage.googleapis.com/ws/google.ai.generativelanguage.v1beta.GenerativeService.BidiGenerateContent?key={API_KEY}
```

The model is specified in the initial `BidiGenerateContentSetup` message, not in the URL path.

### Vertex AI

```
wss://{location}-aiplatform.googleapis.com/ws/google.cloud.aiplatform.v1beta1.PredictionService.BidiGenerateContent
Authorization: Bearer {ACCESS_TOKEN}
```

The model is specified as a fully-qualified resource name in the setup message:
`projects/{project}/locations/{location}/publishers/google/models/{model}`

### Available Models

| Model | Capabilities |
|-------|--------------|
| `gemini-2.0-flash-live-001` | Text + Audio |
| `gemini-2.5-flash-preview-native-audio` | Native audio processing |
| `gemini-live-2.5-flash-native-audio` | Native audio (GA) |

---

## Client Messages

Messages sent from client to server.

### BidiGenerateContentSetup

Initial session configuration. Must be the first message sent.

```json
{
  "setup": {
    "model": "models/gemini-2.0-flash-live-001",
    "generationConfig": { ... },
    "systemInstruction": { ... },
    "tools": [ ... ],
    "realtimeInputConfig": { ... },
    "sessionResumption": { ... },
    "contextWindowCompression": { ... },
    "inputAudioTranscription": { ... },
    "outputAudioTranscription": { ... },
    "proactivity": { ... }
  }
}
```

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| model | string | Yes | Model resource name |
| generationConfig | LiveGenerationConfig | No | Generation settings |
| systemInstruction | Content | No | System prompt |
| tools | Tool[] | No | Available tools |
| realtimeInputConfig | RealtimeInputConfig | No | VAD and input settings |
| sessionResumption | SessionResumptionConfig | No | Resume previous session |
| contextWindowCompression | ContextWindowCompressionConfig | No | Context compression |
| inputAudioTranscription | AudioTranscriptionConfig | No | Transcribe user speech |
| outputAudioTranscription | AudioTranscriptionConfig | No | Transcribe model speech |
| proactivity | ProactivityConfig | No | Proactive audio |

### BidiGenerateContentClientContent

Send conversation context or previous turns.

```json
{
  "clientContent": {
    "turns": [
      { "role": "user", "parts": [{ "text": "Hello" }] }
    ],
    "turnComplete": true
  }
}
```

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| turns | Content[] | Yes | Conversation turns |
| turnComplete | boolean | No | Whether turn is complete |

### BidiGenerateContentRealtimeInput

Real-time streaming input (audio, video, text).

```json
{
  "realtimeInput": {
    "audio": {
      "mimeType": "audio/pcm;rate=16000",
      "data": "<base64-encoded-pcm>"
    }
  }
}
```

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| audio | Blob | No | Audio data (16kHz PCM) |
| video | Blob | No | Video frame |
| text | string | No | Text input |
| activityStart | boolean | No | Manual VAD: activity started |
| activityEnd | boolean | No | Manual VAD: activity ended |
| audioStreamEnd | boolean | No | Audio stream ended |

### BidiGenerateContentToolResponse

Response to tool call request.

```json
{
  "toolResponse": {
    "functionResponses": [
      {
        "id": "call_123",
        "name": "get_weather",
        "response": { "result": "Sunny, 72F" }
      }
    ]
  }
}
```

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| functionResponses | FunctionResponse[] | Yes | Tool execution results |

---

## Server Messages

Messages sent from server to client.

### BidiGenerateContentSetupComplete

Sent after successful session setup.

```json
{
  "setupComplete": {
    "sessionId": "session_abc123"
  }
}
```

| Field | Type | Description |
|-------|------|-------------|
| sessionId | string | Unique session identifier |

### BidiGenerateContentServerContent

Model-generated content.

```json
{
  "serverContent": {
    "modelTurn": {
      "parts": [
        { "text": "Hello!" },
        { "inlineData": { "mimeType": "audio/pcm;rate=24000", "data": "..." } }
      ]
    },
    "turnComplete": true,
    "generationComplete": false,
    "interrupted": false,
    "inputTranscription": { "text": "User said hello" },
    "outputTranscription": { "text": "Model said hello" },
    "groundingMetadata": { ... },
    "usageMetadata": { ... }
  }
}
```

| Field | Type | Description |
|-------|------|-------------|
| modelTurn | Content | Model's response content |
| turnComplete | boolean | Whether model's turn is complete |
| generationComplete | boolean | Whether generation is fully complete |
| interrupted | boolean | Whether model was interrupted |
| inputTranscription | Transcription | Transcribed user input |
| outputTranscription | Transcription | Transcribed model output |
| groundingMetadata | GroundingMetadata | Grounding sources |
| usageMetadata | UsageMetadata | Token counts |

### BidiGenerateContentToolCall

Model requesting tool execution.

```json
{
  "toolCall": {
    "functionCalls": [
      {
        "id": "call_123",
        "name": "get_weather",
        "args": { "location": "Tokyo" }
      }
    ]
  }
}
```

| Field | Type | Description |
|-------|------|-------------|
| functionCalls | FunctionCall[] | Tools to execute |

### BidiGenerateContentToolCallCancellation

Cancel pending tool calls.

```json
{
  "toolCallCancellation": {
    "ids": ["call_123", "call_456"]
  }
}
```

| Field | Type | Description |
|-------|------|-------------|
| ids | string[] | Tool call IDs to cancel |

### GoAway

Session ending notification.

```json
{
  "goAway": {
    "timeLeft": "PT30S"
  }
}
```

| Field | Type | Description |
|-------|------|-------------|
| timeLeft | string (Duration) | Time until session ends |

### SessionResumptionUpdate

Token for resuming session later.

```json
{
  "sessionResumptionUpdate": {
    "newHandle": "resume_token_xyz",
    "resumable": true
  }
}
```

| Field | Type | Description |
|-------|------|-------------|
| newHandle | string | Token for resumption |
| resumable | boolean | Whether session can be resumed |

---

## Configuration Types

### LiveGenerationConfig

```json
{
  "responseModalities": ["AUDIO", "TEXT"],
  "speechConfig": { ... },
  "temperature": 0.7,
  "maxOutputTokens": 8192,
  "topP": 0.95,
  "topK": 40
}
```

### SpeechConfig

```json
{
  "voiceConfig": {
    "prebuiltVoiceConfig": {
      "voiceName": "Puck"
    }
  },
  "languageCode": "en-US"
}
```

### RealtimeInputConfig

```json
{
  "automaticActivityDetection": {
    "disabled": false,
    "startOfSpeechSensitivity": "HIGH",
    "endOfSpeechSensitivity": "HIGH",
    "prefixPaddingMs": 200,
    "silenceDurationMs": 500
  },
  "activityHandling": "START_OF_ACTIVITY_INTERRUPTS",
  "turnCoverage": "TURN_INCLUDES_ONLY_ACTIVITY"
}
```

### SessionResumptionConfig

```json
{
  "handle": "previous_session_token",
  "transparent": true
}
```

### ContextWindowCompressionConfig

```json
{
  "triggerTokens": 16000,
  "slidingWindow": {
    "targetTokens": 8000
  }
}
```

### AudioTranscriptionConfig

```json
{
  "enabled": true
}
```

### ProactivityConfig

```json
{
  "proactiveAudio": true
}
```

---

## Enums

### ActivityHandling

| Value | Description |
|-------|-------------|
| `START_OF_ACTIVITY_INTERRUPTS` | User activity interrupts model output |
| `NO_INTERRUPTION` | Model continues despite user activity |

### StartSensitivity

| Value | Description |
|-------|-------------|
| `HIGH` | More sensitive to speech start |
| `LOW` | Less sensitive to speech start |

### EndSensitivity

| Value | Description |
|-------|-------------|
| `HIGH` | More sensitive to speech end |
| `LOW` | Less sensitive to speech end |

### TurnCoverage

| Value | Description |
|-------|-------------|
| `TURN_INCLUDES_ONLY_ACTIVITY` | Only detected activity in turn |
| `TURN_INCLUDES_ALL_INPUT` | All input included in turn |

---

## Audio Format

### Input Audio

- **Format**: Linear PCM
- **Sample Rate**: 16,000 Hz
- **Bit Depth**: 16-bit signed little-endian
- **Channels**: Mono
- **MIME Type**: `audio/pcm;rate=16000`

### Output Audio

- **Format**: Linear PCM
- **Sample Rate**: 24,000 Hz
- **Bit Depth**: 16-bit signed little-endian
- **Channels**: Mono
- **MIME Type**: `audio/pcm;rate=24000`

### Base64 Encoding

Audio data in JSON messages uses base64 encoding:

```dart
// Encode for sending
final base64Audio = base64Encode(pcmBytes);

// Decode received audio
final pcmBytes = base64Decode(base64Audio);
```

---

## Session Lifecycle

### Normal Session Flow

1. **Connect** - Establish WebSocket connection
2. **Setup** - Send `BidiGenerateContentSetup`
3. **SetupComplete** - Receive confirmation
4. **Stream Input** - Send `RealtimeInput` messages
5. **Receive Output** - Handle `ServerContent` messages
6. **Tool Calls** - Handle `ToolCall`/`ToolResponse` if tools enabled
7. **Resumption** - Store tokens from `SessionResumptionUpdate`
8. **GoAway** - Handle session ending notification
9. **Close** - Close WebSocket

### Session Resumption Flow

1. **Connect** - New WebSocket connection
2. **Setup with Handle** - Include previous `handle` in `SessionResumptionConfig`
3. **Verify** - Check `resumable` in `SessionResumptionUpdate`
4. **Continue** - Session state restored

### Interruption Flow

1. **User Activity** - VAD detects speech or manual signal
2. **Interrupt** - Model output interrupted
3. **ServerContent** - `interrupted: true` indicates interruption
4. **Continue** - User can speak, model waits

### Error Handling

| Error | Handling |
|-------|----------|
| Connection failed | Retry with backoff |
| Setup failed | Check configuration, retry |
| GoAway received | Save resumption token, reconnect |
| Unexpected close | Check for resumption, reconnect |

---

## Ephemeral Tokens (Client-Side)

For client-side apps, use ephemeral tokens instead of API keys:

### Create Token (Server-Side)

```dart
final token = await client.authTokens.create(
  AuthToken(
    expireTime: DateTime.now().add(Duration(minutes: 30)),
    newSessionExpireTime: DateTime.now().add(Duration(seconds: 60)),
    uses: 1,
    bidiGenerateContentSetup: setup,
  ),
);
```

### Use Token (Client-Side)

Query param: `?access_token={token}`
Or header: `Authorization: Token {token}`

### Token Fields

| Field | Default | Max | Description |
|-------|---------|-----|-------------|
| expireTime | 30 min | 20 hr | When token expires |
| newSessionExpireTime | 60 sec | 20 hr | Window for starting new session |
| uses | 1 | - | Usage count (0 = unlimited) |
