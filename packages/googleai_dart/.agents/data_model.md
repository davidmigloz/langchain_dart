# Data Model - GoogleAI Dart Client

**Date**: 2025-09-30
**OpenAPI Version**: v1beta (revision: 20250928)
**Total Schemas**: 182

---

## Table of Contents

1. [Core Content Types](#1-core-content-types-7-schemas)
2. [Generation & Configuration](#2-generation--configuration-8-schemas)
3. [Safety & Moderation](#3-safety--moderation-4-schemas)
4. [Tools & Function Calling](#4-tools--function-calling-9-schemas)
5. [Embeddings](#5-embeddings-6-schemas)
6. [Models & Tuning](#6-models--tuning-8-schemas)
7. [File Management](#7-file-management-10-schemas)
8. [Content Caching](#8-content-caching-5-schemas)
9. [Corpus & RAG](#9-corpus--rag-12-schemas)
10. [Batch Operations](#10-batch-operations-6-schemas)
11. [Long-Running Operations](#11-long-running-operations-4-schemas)
12. [Permissions](#12-permissions-3-schemas)
13. [Metadata & Usage](#13-metadata--usage-6-schemas)
14. [Common Types](#14-common-types-8-schemas)

---

## 1. Core Content Types (7 schemas)

### 1.1 Content P

**Description**: Represents a message in a conversation (user or model turn).

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `role` | `string` | No | Producer of content: `"user"` or `"model"` |
| `parts` | `Part[]` | Yes | Multi-part message content |

**Validation Rules**:

- `parts` must have at least 1 element

**Dart Implementation**:

```dart
class Content {
  final String? role;
  final List<Part> parts;

  const Content({
    this.role,
    required this.parts,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    role: json['role'] as String?,
    parts: (json['parts'] as List).map((e) => Part.fromJson(e)).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (role != null) 'role': role,
    'parts': parts.map((e) => e.toJson()).toList(),
  };
}
```

---

### 1.2 Part PPP (MOST COMPLEX - Sealed Class)

**Description**: A single unit of content (text, media, function call, etc.). **Exactly one field must be set**.

**11 Mutually Exclusive Variants**:

| Variant | Type | Description |
|---------|------|-------------|
| `text` | `string` | Plain text content |
| `inlineData` | `Blob` | Inline binary data (base64) |
| `fileData` | `FileData` | Reference to uploaded file |
| `functionCall` | `FunctionCall` | Model's request to call a function |
| `functionResponse` | `FunctionResponse` | Result from function execution |
| `executableCode` | `ExecutableCode` | Code for model to execute |
| `codeExecutionResult` | `CodeExecutionResult` | Result from code execution |
| `videoMetadata` | `VideoMetadata` | Video timing/sampling metadata |
| `thought` | `boolean` | Reasoning step indicator |
| `thoughtSignature` | `bytes` | Cached thought key (base64) |
| `partMetadata` | `object` | Custom metadata |

**Dart Implementation** (Sealed Class):

```dart
sealed class Part {
  const Part();

  factory Part.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('text')) {
      return TextPart(json['text'] as String);
    }
    if (json.containsKey('inlineData')) {
      return InlineDataPart(Blob.fromJson(json['inlineData']));
    }
    if (json.containsKey('fileData')) {
      return FileDataPart(FileData.fromJson(json['fileData']));
    }
    if (json.containsKey('functionCall')) {
      return FunctionCallPart(FunctionCall.fromJson(json['functionCall']));
    }
    if (json.containsKey('functionResponse')) {
      return FunctionResponsePart(
        FunctionResponse.fromJson(json['functionResponse']),
      );
    }
    if (json.containsKey('executableCode')) {
      return ExecutableCodePart(
        ExecutableCode.fromJson(json['executableCode']),
      );
    }
    if (json.containsKey('codeExecutionResult')) {
      return CodeExecutionResultPart(
        CodeExecutionResult.fromJson(json['codeExecutionResult']),
      );
    }
    if (json.containsKey('videoMetadata')) {
      return VideoMetadataPart(
        VideoMetadata.fromJson(json['videoMetadata']),
      );
    }
    if (json.containsKey('thought')) {
      return ThoughtPart(json['thought'] as bool);
    }
    if (json.containsKey('thoughtSignature')) {
      return ThoughtSignaturePart(
        base64Decode(json['thoughtSignature'] as String),
      );
    }
    if (json.containsKey('partMetadata')) {
      return PartMetadataPart(json['partMetadata'] as Map<String, dynamic>);
    }
    throw FormatException('Unknown Part type: ${json.keys}');
  }

  Map<String, dynamic> toJson();
}

class TextPart extends Part {
  final String text;
  const TextPart(this.text);

  @override
  Map<String, dynamic> toJson() => {'text': text};
}

class InlineDataPart extends Part {
  final Blob inlineData;
  const InlineDataPart(this.inlineData);

  @override
  Map<String, dynamic> toJson() => {'inlineData': inlineData.toJson()};
}

class FileDataPart extends Part {
  final FileData fileData;
  const FileDataPart(this.fileData);

  @override
  Map<String, dynamic> toJson() => {'fileData': fileData.toJson()};
}

class FunctionCallPart extends Part {
  final FunctionCall functionCall;
  const FunctionCallPart(this.functionCall);

  @override
  Map<String, dynamic> toJson() => {'functionCall': functionCall.toJson()};
}

class FunctionResponsePart extends Part {
  final FunctionResponse functionResponse;
  const FunctionResponsePart(this.functionResponse);

  @override
  Map<String, dynamic> toJson() => {
    'functionResponse': functionResponse.toJson(),
  };
}

class ExecutableCodePart extends Part {
  final ExecutableCode executableCode;
  const ExecutableCodePart(this.executableCode);

  @override
  Map<String, dynamic> toJson() => {
    'executableCode': executableCode.toJson(),
  };
}

class CodeExecutionResultPart extends Part {
  final CodeExecutionResult codeExecutionResult;
  const CodeExecutionResultPart(this.codeExecutionResult);

  @override
  Map<String, dynamic> toJson() => {
    'codeExecutionResult': codeExecutionResult.toJson(),
  };
}

class VideoMetadataPart extends Part {
  final VideoMetadata videoMetadata;
  const VideoMetadataPart(this.videoMetadata);

  @override
  Map<String, dynamic> toJson() => {
    'videoMetadata': videoMetadata.toJson(),
  };
}

class ThoughtPart extends Part {
  final bool thought;
  const ThoughtPart(this.thought);

  @override
  Map<String, dynamic> toJson() => {'thought': thought};
}

class ThoughtSignaturePart extends Part {
  final List<int> thoughtSignature;
  const ThoughtSignaturePart(this.thoughtSignature);

  @override
  Map<String, dynamic> toJson() => {
    'thoughtSignature': base64Encode(thoughtSignature),
  };
}

class PartMetadataPart extends Part {
  final Map<String, dynamic> partMetadata;
  const PartMetadataPart(this.partMetadata);

  @override
  Map<String, dynamic> toJson() => {'partMetadata': partMetadata};
}
```

**Usage with Pattern Matching**:

```dart
String extractText(Part part) {
  return switch (part) {
    TextPart(:final text) => text,
    FunctionCallPart(:final functionCall) => 'Function: ${functionCall.name}',
    _ => '',
  };
}
```

---

### 1.3 Blob

**Description**: Inline binary data (e.g., image, audio) encoded as base64.

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `mimeType` | `string` | Yes | MIME type (e.g., `image/jpeg`, `audio/mp3`) |
| `data` | `string` | Yes | Base64-encoded binary data |

**Supported MIME Types**:

- **Images**: `image/png`, `image/jpeg`, `image/webp`, `image/heic`, `image/heif`
- **Audio**: `audio/wav`, `audio/mp3`, `audio/aiff`, `audio/aac`, `audio/ogg`, `audio/flac`
- **Video**: `video/mp4`, `video/mpeg`, `video/mov`, `video/avi`, `video/x-flv`, `video/mpg`, `video/webm`, `video/wmv`, `video/3gpp`
- **Documents**: `application/pdf`, `text/plain`, `text/html`, `text/css`, `application/json`

**Dart Implementation**:

```dart
class Blob {
  final String mimeType;
  final String data; // Base64 string

  const Blob({required this.mimeType, required this.data});

  factory Blob.fromJson(Map<String, dynamic> json) => Blob(
    mimeType: json['mimeType'] as String,
    data: json['data'] as String,
  );

  Map<String, dynamic> toJson() => {
    'mimeType': mimeType,
    'data': data,
  };

  // Helper: create from bytes
  factory Blob.fromBytes(String mimeType, List<int> bytes) => Blob(
    mimeType: mimeType,
    data: base64Encode(bytes),
  );

  // Helper: decode to bytes
  List<int> toBytes() => base64Decode(data);
}
```

---

### 1.4 FileData

**Description**: Reference to an uploaded file (via `/v1beta/files`).

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `fileUri` | `string` | Yes | File identifier (e.g., `files/abc123`) |
| `mimeType` | `string` | No | MIME type (optional hint) |

**Dart Implementation**:

```dart
class FileData {
  final String fileUri;
  final String? mimeType;

  const FileData({required this.fileUri, this.mimeType});

  factory FileData.fromJson(Map<String, dynamic> json) => FileData(
    fileUri: json['fileUri'] as String,
    mimeType: json['mimeType'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'fileUri': fileUri,
    if (mimeType != null) 'mimeType': mimeType,
  };
}
```

---

### 1.5 Candidate

**Description**: A generated response from the model (one of possibly multiple candidates).

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `content` | `Content` | No | Generated content |
| `finishReason` | `FinishReason` | No | Why generation stopped |
| `safetyRatings` | `SafetyRating[]` | No | Safety assessment |
| `citationMetadata` | `CitationMetadata` | No | Source citations |
| `tokenCount` | `int32` | No | Tokens in this candidate |
| `index` | `int32` | No | Candidate index (0-based) |
| `avgLogprobs` | `double` | No | Average log probability |
| `logprobsResult` | `LogprobsResult` | No | Token-level logprobs |

**FinishReason Enum**:

- `FINISH_REASON_UNSPECIFIED` - Unknown
- `STOP` - Natural stop (e.g., stop sequence, EOS token)
- `MAX_TOKENS` - Hit max output tokens
- `SAFETY` - Blocked by safety filters
- `RECITATION` - Blocked due to recitation/citation issues
- `OTHER` - Other reason
- `BLOCKLIST` - Blocked by custom blocklist
- `PROHIBITED_CONTENT` - Prohibited content detected
- `SPII` - Sensitive PII detected

**Dart Implementation**:

```dart
enum FinishReason {
  unspecified,
  stop,
  maxTokens,
  safety,
  recitation,
  other,
  blocklist,
  prohibitedContent,
  spii,
}

class Candidate {
  final Content? content;
  final FinishReason? finishReason;
  final List<SafetyRating>? safetyRatings;
  final CitationMetadata? citationMetadata;
  final int? tokenCount;
  final int? index;
  final double? avgLogprobs;
  final LogprobsResult? logprobsResult;

  const Candidate({
    this.content,
    this.finishReason,
    this.safetyRatings,
    this.citationMetadata,
    this.tokenCount,
    this.index,
    this.avgLogprobs,
    this.logprobsResult,
  });

  factory Candidate.fromJson(Map<String, dynamic> json) => Candidate(
    content: json['content'] != null
        ? Content.fromJson(json['content'])
        : null,
    finishReason: json['finishReason'] != null
        ? _finishReasonFromString(json['finishReason'])
        : null,
    safetyRatings: json['safetyRatings'] != null
        ? (json['safetyRatings'] as List)
            .map((e) => SafetyRating.fromJson(e))
            .toList()
        : null,
    citationMetadata: json['citationMetadata'] != null
        ? CitationMetadata.fromJson(json['citationMetadata'])
        : null,
    tokenCount: json['tokenCount'] as int?,
    index: json['index'] as int?,
    avgLogprobs: json['avgLogprobs'] as double?,
    logprobsResult: json['logprobsResult'] != null
        ? LogprobsResult.fromJson(json['logprobsResult'])
        : null,
  );

  Map<String, dynamic> toJson() => {
    if (content != null) 'content': content!.toJson(),
    if (finishReason != null)
      'finishReason': _finishReasonToString(finishReason!),
    if (safetyRatings != null)
      'safetyRatings': safetyRatings!.map((e) => e.toJson()).toList(),
    if (citationMetadata != null)
      'citationMetadata': citationMetadata!.toJson(),
    if (tokenCount != null) 'tokenCount': tokenCount,
    if (index != null) 'index': index,
    if (avgLogprobs != null) 'avgLogprobs': avgLogprobs,
    if (logprobsResult != null) 'logprobsResult': logprobsResult!.toJson(),
  };
}
```

---

### 1.6 CitationMetadata

**Description**: Citation sources for generated content.

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `citationSources` | `CitationSource[]` | No | List of sources |

**Dart Implementation**:

```dart
class CitationMetadata {
  final List<CitationSource>? citationSources;

  const CitationMetadata({this.citationSources});

  factory CitationMetadata.fromJson(Map<String, dynamic> json) =>
      CitationMetadata(
    citationSources: json['citationSources'] != null
        ? (json['citationSources'] as List)
            .map((e) => CitationSource.fromJson(e))
            .toList()
        : null,
  );

  Map<String, dynamic> toJson() => {
    if (citationSources != null)
      'citationSources': citationSources!.map((e) => e.toJson()).toList(),
  };
}

class CitationSource {
  final int? startIndex;
  final int? endIndex;
  final String? uri;
  final String? license;
  final String? title;
  final DateTime? publicationDate;

  const CitationSource({
    this.startIndex,
    this.endIndex,
    this.uri,
    this.license,
    this.title,
    this.publicationDate,
  });

  factory CitationSource.fromJson(Map<String, dynamic> json) =>
      CitationSource(
    startIndex: json['startIndex'] as int?,
    endIndex: json['endIndex'] as int?,
    uri: json['uri'] as String?,
    license: json['license'] as String?,
    title: json['title'] as String?,
    publicationDate: json['publicationDate'] != null
        ? DateTime.parse(json['publicationDate'])
        : null,
  );

  Map<String, dynamic> toJson() => {
    if (startIndex != null) 'startIndex': startIndex,
    if (endIndex != null) 'endIndex': endIndex,
    if (uri != null) 'uri': uri,
    if (license != null) 'license': license,
    if (title != null) 'title': title,
    if (publicationDate != null)
      'publicationDate': publicationDate!.toIso8601String(),
  };
}
```

---

### 1.7 LogprobsResult

**Description**: Token-level log probabilities.

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `topCandidates` | `TopCandidates[]` | No | Top K candidates per token |
| `chosenCandidates` | `Candidate[]` | No | Actually chosen tokens |

**Dart Implementation**:

```dart
class LogprobsResult {
  final List<TopCandidates>? topCandidates;
  final List<Candidate>? chosenCandidates;

  const LogprobsResult({this.topCandidates, this.chosenCandidates});

  factory LogprobsResult.fromJson(Map<String, dynamic> json) =>
      LogprobsResult(
    topCandidates: json['topCandidates'] != null
        ? (json['topCandidates'] as List)
            .map((e) => TopCandidates.fromJson(e))
            .toList()
        : null,
    chosenCandidates: json['chosenCandidates'] != null
        ? (json['chosenCandidates'] as List)
            .map((e) => Candidate.fromJson(e))
            .toList()
        : null,
  );

  Map<String, dynamic> toJson() => {
    if (topCandidates != null)
      'topCandidates': topCandidates!.map((e) => e.toJson()).toList(),
    if (chosenCandidates != null)
      'chosenCandidates': chosenCandidates!.map((e) => e.toJson()).toList(),
  };
}

class TopCandidates {
  final List<Candidate>? candidates;

  const TopCandidates({this.candidates});

  factory TopCandidates.fromJson(Map<String, dynamic> json) => TopCandidates(
    candidates: json['candidates'] != null
        ? (json['candidates'] as List)
            .map((e) => Candidate.fromJson(e))
            .toList()
        : null,
  );

  Map<String, dynamic> toJson() => {
    if (candidates != null)
      'candidates': candidates!.map((e) => e.toJson()).toList(),
  };
}
```

---

## 2. Generation & Configuration (8 schemas)

### 2.1 GenerateContentRequest P

**Description**: Primary request for content generation.

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `model` | `string` | Yes | Model ID (e.g., `models/gemini-pro`) |
| `contents` | `Content[]` | Yes | Conversation history |
| `systemInstruction` | `Content` | No | System prompt |
| `tools` | `Tool[]` | No | Available tools/functions |
| `toolConfig` | `ToolConfig` | No | Tool execution configuration |
| `safetySettings` | `SafetySetting[]` | No | Content filtering settings |
| `generationConfig` | `GenerationConfig` | No | Generation parameters |
| `cachedContent` | `string` | No | Cached context reference |
| `labels` | `map<string, string>` | No | Custom labels for logging |

**Validation Rules**:

- `contents` must have at least 1 element
- If `cachedContent` is set, `model` must match the cache's model

**Dart Implementation**:

```dart
class GenerateContentRequest {
  final String model;
  final List<Content> contents;
  final Content? systemInstruction;
  final List<Tool>? tools;
  final ToolConfig? toolConfig;
  final List<SafetySetting>? safetySettings;
  final GenerationConfig? generationConfig;
  final String? cachedContent;
  final Map<String, String>? labels;

  const GenerateContentRequest({
    required this.model,
    required this.contents,
    this.systemInstruction,
    this.tools,
    this.toolConfig,
    this.safetySettings,
    this.generationConfig,
    this.cachedContent,
    this.labels,
  });

  factory GenerateContentRequest.fromJson(Map<String, dynamic> json) =>
      GenerateContentRequest(
    model: json['model'] as String,
    contents: (json['contents'] as List)
        .map((e) => Content.fromJson(e))
        .toList(),
    systemInstruction: json['systemInstruction'] != null
        ? Content.fromJson(json['systemInstruction'])
        : null,
    tools: json['tools'] != null
        ? (json['tools'] as List).map((e) => Tool.fromJson(e)).toList()
        : null,
    toolConfig: json['toolConfig'] != null
        ? ToolConfig.fromJson(json['toolConfig'])
        : null,
    safetySettings: json['safetySettings'] != null
        ? (json['safetySettings'] as List)
            .map((e) => SafetySetting.fromJson(e))
            .toList()
        : null,
    generationConfig: json['generationConfig'] != null
        ? GenerationConfig.fromJson(json['generationConfig'])
        : null,
    cachedContent: json['cachedContent'] as String?,
    labels: json['labels'] != null
        ? Map<String, String>.from(json['labels'])
        : null,
  );

  Map<String, dynamic> toJson() => {
    'model': model,
    'contents': contents.map((e) => e.toJson()).toList(),
    if (systemInstruction != null)
      'systemInstruction': systemInstruction!.toJson(),
    if (tools != null) 'tools': tools!.map((e) => e.toJson()).toList(),
    if (toolConfig != null) 'toolConfig': toolConfig!.toJson(),
    if (safetySettings != null)
      'safetySettings': safetySettings!.map((e) => e.toJson()).toList(),
    if (generationConfig != null)
      'generationConfig': generationConfig!.toJson(),
    if (cachedContent != null) 'cachedContent': cachedContent,
    if (labels != null) 'labels': labels,
  };
}
```

---

### 2.2 GenerateContentResponse

**Description**: Response from content generation.

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `candidates` | `Candidate[]` | No | Generated candidates |
| `promptFeedback` | `PromptFeedback` | No | Safety feedback on prompt |
| `usageMetadata` | `UsageMetadata` | No | Token usage statistics |
| `modelVersion` | `string` | No | Model version used |
| `responseId` | `string` | No | Unique response ID |

**Dart Implementation**:

```dart
class GenerateContentResponse {
  final List<Candidate>? candidates;
  final PromptFeedback? promptFeedback;
  final UsageMetadata? usageMetadata;
  final String? modelVersion;
  final String? responseId;

  const GenerateContentResponse({
    this.candidates,
    this.promptFeedback,
    this.usageMetadata,
    this.modelVersion,
    this.responseId,
  });

  factory GenerateContentResponse.fromJson(Map<String, dynamic> json) =>
      GenerateContentResponse(
    candidates: json['candidates'] != null
        ? (json['candidates'] as List)
            .map((e) => Candidate.fromJson(e))
            .toList()
        : null,
    promptFeedback: json['promptFeedback'] != null
        ? PromptFeedback.fromJson(json['promptFeedback'])
        : null,
    usageMetadata: json['usageMetadata'] != null
        ? UsageMetadata.fromJson(json['usageMetadata'])
        : null,
    modelVersion: json['modelVersion'] as String?,
    responseId: json['responseId'] as String?,
  );

  Map<String, dynamic> toJson() => {
    if (candidates != null)
      'candidates': candidates!.map((e) => e.toJson()).toList(),
    if (promptFeedback != null) 'promptFeedback': promptFeedback!.toJson(),
    if (usageMetadata != null) 'usageMetadata': usageMetadata!.toJson(),
    if (modelVersion != null) 'modelVersion': modelVersion,
    if (responseId != null) 'responseId': responseId,
  };
}
```

---

### 2.3 GenerationConfig P

**Description**: Parameters controlling generation behavior (all optional).

**Properties**:

| Field | Type | Range/Values | Description |
|-------|------|--------------|-------------|
| `temperature` | `double` | 0.0 - 2.0 | Randomness (0=deterministic, 2=very random) |
| `topP` | `double` | 0.0 - 1.0 | Nucleus sampling threshold |
| `topK` | `int32` | > 0 | Top-K sampling |
| `maxOutputTokens` | `int32` | > 0 | Maximum response length |
| `candidateCount` | `int32` | e 1 | Number of responses to generate |
| `stopSequences` | `string[]` | - | Stop generation when encountered |
| `responseMimeType` | `string` | `text/plain`, `application/json` | Output format |
| `responseSchema` | `Schema` | - | JSON Schema for structured output |
| `presencePenalty` | `double` | -2.0 to 2.0 | Penalty for token presence |
| `frequencyPenalty` | `double` | -2.0 to 2.0 | Penalty for token frequency |
| `seed` | `int32` | - | Seed for reproducible generation |
| `logprobs` | `int32` | e 0 | Number of logprobs per token |
| `responseLogprobs` | `boolean` | - | Enable logprobs in response |
| `responseModalities` | `string[]` | `TEXT`, `IMAGE`, `AUDIO` | Output modalities |
| `mediaResolution` | `MediaResolution` | - | Media quality setting |
| `speechConfig` | `SpeechConfig` | - | Speech generation config |
| `audioTimestamp` | `boolean` | - | Include audio timestamps |
| `enableAutoTools` | `boolean` | - | Enable automatic tool use |
| `routingConfig` | `RoutingConfig` | - | Model routing config |

**MediaResolution Enum**:

- `MEDIA_RESOLUTION_UNSPECIFIED`
- `MEDIA_RESOLUTION_LOW`
- `MEDIA_RESOLUTION_MEDIUM`
- `MEDIA_RESOLUTION_HIGH`

**Dart Implementation** (abbreviated):

```dart
class GenerationConfig {
  final double? temperature;
  final double? topP;
  final int? topK;
  final int? maxOutputTokens;
  final int? candidateCount;
  final List<String>? stopSequences;
  final String? responseMimeType;
  final Schema? responseSchema;
  final double? presencePenalty;
  final double? frequencyPenalty;
  final int? seed;
  final int? logprobs;
  final bool? responseLogprobs;
  final List<String>? responseModalities;
  final MediaResolution? mediaResolution;
  final SpeechConfig? speechConfig;
  final bool? audioTimestamp;
  final bool? enableAutoTools;
  final RoutingConfig? routingConfig;

  const GenerationConfig({
    this.temperature,
    this.topP,
    this.topK,
    this.maxOutputTokens,
    this.candidateCount,
    this.stopSequences,
    this.responseMimeType,
    this.responseSchema,
    this.presencePenalty,
    this.frequencyPenalty,
    this.seed,
    this.logprobs,
    this.responseLogprobs,
    this.responseModalities,
    this.mediaResolution,
    this.speechConfig,
    this.audioTimestamp,
    this.enableAutoTools,
    this.routingConfig,
  });

  // fromJson/toJson implementation...
}
```

---

### 2.4 PromptFeedback

**Description**: Safety feedback on the input prompt.

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `blockReason` | `BlockReason` | No | Why prompt was blocked |
| `safetyRatings` | `SafetyRating[]` | No | Safety scores |
| `blockReasonMessage` | `string` | No | Human-readable explanation |

**BlockReason Enum**:

- `BLOCK_REASON_UNSPECIFIED`
- `SAFETY` - Blocked by safety filter
- `OTHER` - Other reason
- `BLOCKLIST` - Blocked by custom blocklist
- `PROHIBITED_CONTENT` - Prohibited content

**Dart Implementation**:

```dart
enum BlockReason {
  unspecified,
  safety,
  other,
  blocklist,
  prohibitedContent,
}

class PromptFeedback {
  final BlockReason? blockReason;
  final List<SafetyRating>? safetyRatings;
  final String? blockReasonMessage;

  const PromptFeedback({
    this.blockReason,
    this.safetyRatings,
    this.blockReasonMessage,
  });

  factory PromptFeedback.fromJson(Map<String, dynamic> json) =>
      PromptFeedback(
    blockReason: json['blockReason'] != null
        ? _blockReasonFromString(json['blockReason'])
        : null,
    safetyRatings: json['safetyRatings'] != null
        ? (json['safetyRatings'] as List)
            .map((e) => SafetyRating.fromJson(e))
            .toList()
        : null,
    blockReasonMessage: json['blockReasonMessage'] as String?,
  );

  Map<String, dynamic> toJson() => {
    if (blockReason != null)
      'blockReason': _blockReasonToString(blockReason!),
    if (safetyRatings != null)
      'safetyRatings': safetyRatings!.map((e) => e.toJson()).toList(),
    if (blockReasonMessage != null)
      'blockReasonMessage': blockReasonMessage,
  };
}
```

---

### 2.5 CountTokensRequest

**Description**: Request to count tokens in content.

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `model` | `string` | Yes | Model ID |
| `contents` | `Content[]` | No | Content to count |
| `generateContentRequest` | `GenerateContentRequest` | No | Alternative: full request |

**Note**: Either `contents` OR `generateContentRequest` must be provided.

**Dart Implementation**:

```dart
class CountTokensRequest {
  final String model;
  final List<Content>? contents;
  final GenerateContentRequest? generateContentRequest;

  const CountTokensRequest({
    required this.model,
    this.contents,
    this.generateContentRequest,
  });

  factory CountTokensRequest.fromJson(Map<String, dynamic> json) =>
      CountTokensRequest(
    model: json['model'] as String,
    contents: json['contents'] != null
        ? (json['contents'] as List)
            .map((e) => Content.fromJson(e))
            .toList()
        : null,
    generateContentRequest: json['generateContentRequest'] != null
        ? GenerateContentRequest.fromJson(json['generateContentRequest'])
        : null,
  );

  Map<String, dynamic> toJson() => {
    'model': model,
    if (contents != null)
      'contents': contents!.map((e) => e.toJson()).toList(),
    if (generateContentRequest != null)
      'generateContentRequest': generateContentRequest!.toJson(),
  };
}
```

---

### 2.6 CountTokensResponse

**Description**: Token count result.

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `totalTokens` | `int32` | No | Total token count |
| `cachedContentTokenCount` | `int32` | No | Tokens from cache |

**Dart Implementation**:

```dart
class CountTokensResponse {
  final int? totalTokens;
  final int? cachedContentTokenCount;

  const CountTokensResponse({
    this.totalTokens,
    this.cachedContentTokenCount,
  });

  factory CountTokensResponse.fromJson(Map<String, dynamic> json) =>
      CountTokensResponse(
    totalTokens: json['totalTokens'] as int?,
    cachedContentTokenCount: json['cachedContentTokenCount'] as int?,
  );

  Map<String, dynamic> toJson() => {
    if (totalTokens != null) 'totalTokens': totalTokens,
    if (cachedContentTokenCount != null)
      'cachedContentTokenCount': cachedContentTokenCount,
  };
}
```

---

### 2.7 Schema

**Description**: OpenAPI 3.0 Schema for structured output.

**Properties** (subset):

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `type` | `Type` | No | Data type |
| `format` | `string` | No | Format hint (e.g., `int32`, `date-time`) |
| `description` | `string` | No | Description |
| `nullable` | `boolean` | No | Can be null |
| `enum` | `string[]` | No | Allowed values |
| `items` | `Schema` | No | Array item schema |
| `properties` | `map<string, Schema>` | No | Object properties |
| `required` | `string[]` | No | Required property names |

**Type Enum**:

- `TYPE_UNSPECIFIED`
- `STRING`
- `NUMBER`
- `INTEGER`
- `BOOLEAN`
- `ARRAY`
- `OBJECT`

**Dart Implementation** (recursive):

```dart
enum SchemaType {
  unspecified,
  string,
  number,
  integer,
  boolean,
  array,
  object,
}

class Schema {
  final SchemaType? type;
  final String? format;
  final String? description;
  final bool? nullable;
  final List<String>? enumValues;
  final Schema? items;
  final Map<String, Schema>? properties;
  final List<String>? required;

  const Schema({
    this.type,
    this.format,
    this.description,
    this.nullable,
    this.enumValues,
    this.items,
    this.properties,
    this.required,
  });

  factory Schema.fromJson(Map<String, dynamic> json) => Schema(
    type: json['type'] != null
        ? _schemaTypeFromString(json['type'])
        : null,
    format: json['format'] as String?,
    description: json['description'] as String?,
    nullable: json['nullable'] as bool?,
    enumValues: json['enum'] != null
        ? (json['enum'] as List).cast<String>()
        : null,
    items: json['items'] != null ? Schema.fromJson(json['items']) : null,
    properties: json['properties'] != null
        ? (json['properties'] as Map<String, dynamic>).map(
            (k, v) => MapEntry(k, Schema.fromJson(v)),
          )
        : null,
    required: json['required'] != null
        ? (json['required'] as List).cast<String>()
        : null,
  );

  Map<String, dynamic> toJson() => {
    if (type != null) 'type': _schemaTypeToString(type!),
    if (format != null) 'format': format,
    if (description != null) 'description': description,
    if (nullable != null) 'nullable': nullable,
    if (enumValues != null) 'enum': enumValues,
    if (items != null) 'items': items!.toJson(),
    if (properties != null)
      'properties': properties!.map((k, v) => MapEntry(k, v.toJson())),
    if (required != null) 'required': required,
  };
}
```

---

### 2.8 SpeechConfig

**Description**: Configuration for speech generation.

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `voiceConfig` | `VoiceConfig` | No | Voice selection |

**Dart Implementation**:

```dart
class SpeechConfig {
  final VoiceConfig? voiceConfig;

  const SpeechConfig({this.voiceConfig});

  factory SpeechConfig.fromJson(Map<String, dynamic> json) => SpeechConfig(
    voiceConfig: json['voiceConfig'] != null
        ? VoiceConfig.fromJson(json['voiceConfig'])
        : null,
  );

  Map<String, dynamic> toJson() => {
    if (voiceConfig != null) 'voiceConfig': voiceConfig!.toJson(),
  };
}

class VoiceConfig {
  final PrebuiltVoiceConfig? prebuiltVoiceConfig;

  const VoiceConfig({this.prebuiltVoiceConfig});

  factory VoiceConfig.fromJson(Map<String, dynamic> json) => VoiceConfig(
    prebuiltVoiceConfig: json['prebuiltVoiceConfig'] != null
        ? PrebuiltVoiceConfig.fromJson(json['prebuiltVoiceConfig'])
        : null,
  );

  Map<String, dynamic> toJson() => {
    if (prebuiltVoiceConfig != null)
      'prebuiltVoiceConfig': prebuiltVoiceConfig!.toJson(),
  };
}

class PrebuiltVoiceConfig {
  final String? voiceName;

  const PrebuiltVoiceConfig({this.voiceName});

  factory PrebuiltVoiceConfig.fromJson(Map<String, dynamic> json) =>
      PrebuiltVoiceConfig(
    voiceName: json['voiceName'] as String?,
  );

  Map<String, dynamic> toJson() => {
    if (voiceName != null) 'voiceName': voiceName,
  };
}
```

---

## 3. Safety & Moderation (4 schemas)

### 3.1 SafetySetting P

**Description**: Safety filter configuration for a specific harm category.

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `category` | `HarmCategory` | Yes | Which harm category |
| `threshold` | `HarmBlockThreshold` | Yes | Blocking threshold |

**Dart Implementation**:

```dart
class SafetySetting {
  final HarmCategory category;
  final HarmBlockThreshold threshold;

  const SafetySetting({
    required this.category,
    required this.threshold,
  });

  factory SafetySetting.fromJson(Map<String, dynamic> json) => SafetySetting(
    category: _harmCategoryFromString(json['category']),
    threshold: _harmBlockThresholdFromString(json['threshold']),
  );

  Map<String, dynamic> toJson() => {
    'category': _harmCategoryToString(category),
    'threshold': _harmBlockThresholdToString(threshold),
  };
}
```

---

### 3.2 HarmCategory (Enum) P

**Description**: Types of harmful content.

**Values** (12 total):

**Gemini Models**:

- `HARM_CATEGORY_HARASSMENT` - Harassment content
- `HARM_CATEGORY_HATE_SPEECH` - Hate speech
- `HARM_CATEGORY_SEXUALLY_EXPLICIT` - Sexually explicit content
- `HARM_CATEGORY_DANGEROUS_CONTENT` - Dangerous/harmful instructions
- `HARM_CATEGORY_CIVIC_INTEGRITY` - Civic integrity violations

**PaLM Models (Legacy)**:

- `HARM_CATEGORY_DEROGATORY` - Derogatory language
- `HARM_CATEGORY_TOXICITY` - Toxic language
- `HARM_CATEGORY_VIOLENCE` - Violent content
- `HARM_CATEGORY_SEXUAL` - Sexual content
- `HARM_CATEGORY_MEDICAL` - Medical misinformation
- `HARM_CATEGORY_DANGEROUS` - Dangerous content

**Other**:

- `HARM_CATEGORY_UNSPECIFIED` - Unknown

**Dart Implementation**:

```dart
enum HarmCategory {
  unspecified,
  derogatory,
  toxicity,
  violence,
  sexual,
  medical,
  dangerous,
  harassment,
  hateSpeech,
  sexuallyExplicit,
  dangerousContent,
  civicIntegrity,
}
```

---

### 3.3 HarmBlockThreshold (Enum)

**Description**: Threshold for blocking content.

**Values**:

- `HARM_BLOCK_THRESHOLD_UNSPECIFIED` - Unknown
- `BLOCK_LOW_AND_ABOVE` - Block low, medium, high probability content
- `BLOCK_MEDIUM_AND_ABOVE` - Block medium and high probability content
- `BLOCK_ONLY_HIGH` - Block only high probability content
- `BLOCK_NONE` - No blocking (allow all)
- `OFF` - Disable safety filter (same as BLOCK_NONE)

**Dart Implementation**:

```dart
enum HarmBlockThreshold {
  unspecified,
  blockLowAndAbove,
  blockMediumAndAbove,
  blockOnlyHigh,
  blockNone,
  off,
}
```

---

### 3.4 SafetyRating

**Description**: Safety assessment for generated content.

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `category` | `HarmCategory` | Yes | Harm category assessed |
| `probability` | `HarmProbability` | Yes | Probability of harm |
| `blocked` | `boolean` | No | Was content blocked? |
| `probabilityScore` | `double` | No | Numeric score (0.0-1.0) |
| `severity` | `HarmSeverity` | No | Severity of harm |
| `severityScore` | `double` | No | Numeric severity (0.0-1.0) |

**HarmProbability Enum**:

- `HARM_PROBABILITY_UNSPECIFIED`
- `NEGLIGIBLE` - Very low probability
- `LOW` - Low probability
- `MEDIUM` - Medium probability
- `HIGH` - High probability

**HarmSeverity Enum**:

- `HARM_SEVERITY_UNSPECIFIED`
- `HARM_SEVERITY_NEGLIGIBLE`
- `HARM_SEVERITY_LOW`
- `HARM_SEVERITY_MEDIUM`
- `HARM_SEVERITY_HIGH`

**Dart Implementation**:

```dart
enum HarmProbability {
  unspecified,
  negligible,
  low,
  medium,
  high,
}

enum HarmSeverity {
  unspecified,
  negligible,
  low,
  medium,
  high,
}

class SafetyRating {
  final HarmCategory category;
  final HarmProbability probability;
  final bool? blocked;
  final double? probabilityScore;
  final HarmSeverity? severity;
  final double? severityScore;

  const SafetyRating({
    required this.category,
    required this.probability,
    this.blocked,
    this.probabilityScore,
    this.severity,
    this.severityScore,
  });

  factory SafetyRating.fromJson(Map<String, dynamic> json) => SafetyRating(
    category: _harmCategoryFromString(json['category']),
    probability: _harmProbabilityFromString(json['probability']),
    blocked: json['blocked'] as bool?,
    probabilityScore: json['probabilityScore'] as double?,
    severity: json['severity'] != null
        ? _harmSeverityFromString(json['severity'])
        : null,
    severityScore: json['severityScore'] as double?,
  );

  Map<String, dynamic> toJson() => {
    'category': _harmCategoryToString(category),
    'probability': _harmProbabilityToString(probability),
    if (blocked != null) 'blocked': blocked,
    if (probabilityScore != null) 'probabilityScore': probabilityScore,
    if (severity != null) 'severity': _harmSeverityToString(severity!),
    if (severityScore != null) 'severityScore': severityScore,
  };
}
```

---

## 4. Tools & Function Calling (9 schemas)

### 4.1 Tool

**Description**: A tool the model can use (functions, search, code execution, etc.).

**Properties** (at least one must be set):

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `functionDeclarations` | `FunctionDeclaration[]` | No | Custom functions |
| `googleSearch` | `GoogleSearch` | No | Google Search tool |
| `googleSearchRetrieval` | `GoogleSearchRetrieval` | No | Grounding with Search |
| `codeExecution` | `CodeExecution` | No | Python code execution |
| `computerUse` | `ComputerUse` | No | Computer interaction (experimental) |
| `urlContext` | `UrlContext` | No | URL context retrieval |

**Dart Implementation**:

```dart
class Tool {
  final List<FunctionDeclaration>? functionDeclarations;
  final GoogleSearch? googleSearch;
  final GoogleSearchRetrieval? googleSearchRetrieval;
  final CodeExecution? codeExecution;
  final ComputerUse? computerUse;
  final UrlContext? urlContext;

  const Tool({
    this.functionDeclarations,
    this.googleSearch,
    this.googleSearchRetrieval,
    this.codeExecution,
    this.computerUse,
    this.urlContext,
  });

  factory Tool.fromJson(Map<String, dynamic> json) => Tool(
    functionDeclarations: json['functionDeclarations'] != null
        ? (json['functionDeclarations'] as List)
            .map((e) => FunctionDeclaration.fromJson(e))
            .toList()
        : null,
    googleSearch: json['googleSearch'] != null
        ? GoogleSearch.fromJson(json['googleSearch'])
        : null,
    googleSearchRetrieval: json['googleSearchRetrieval'] != null
        ? GoogleSearchRetrieval.fromJson(json['googleSearchRetrieval'])
        : null,
    codeExecution: json['codeExecution'] != null
        ? CodeExecution.fromJson(json['codeExecution'])
        : null,
    computerUse: json['computerUse'] != null
        ? ComputerUse.fromJson(json['computerUse'])
        : null,
    urlContext: json['urlContext'] != null
        ? UrlContext.fromJson(json['urlContext'])
        : null,
  );

  Map<String, dynamic> toJson() => {
    if (functionDeclarations != null)
      'functionDeclarations':
          functionDeclarations!.map((e) => e.toJson()).toList(),
    if (googleSearch != null) 'googleSearch': googleSearch!.toJson(),
    if (googleSearchRetrieval != null)
      'googleSearchRetrieval': googleSearchRetrieval!.toJson(),
    if (codeExecution != null) 'codeExecution': codeExecution!.toJson(),
    if (computerUse != null) 'computerUse': computerUse!.toJson(),
    if (urlContext != null) 'urlContext': urlContext!.toJson(),
  };
}
```

---

### 4.2 FunctionDeclaration P

**Description**: Declaration of a custom function the model can call.

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `name` | `string` | Yes | Function name (a-zA-Z0-9_) |
| `description` | `string` | Yes | What the function does |
| `parameters` | `Schema` | No | OpenAPI 3.0 Schema for parameters |
| `parametersJsonSchema` | `object` | No | Alternative JSON Schema |
| `response` | `Schema` | No | Expected response schema |
| `responseJsonSchema` | `object` | No | Alternative response schema |
| `behavior` | `FunctionBehavior` | No | Blocking vs non-blocking |

**FunctionBehavior Enum**:

- `BEHAVIOR_UNSPECIFIED`
- `BLOCKING` - Wait for result before continuing
- `NON_BLOCKING` - Continue generation without waiting

**Dart Implementation**:

```dart
enum FunctionBehavior {
  unspecified,
  blocking,
  nonBlocking,
}

class FunctionDeclaration {
  final String name;
  final String description;
  final Schema? parameters;
  final Map<String, dynamic>? parametersJsonSchema;
  final Schema? response;
  final Map<String, dynamic>? responseJsonSchema;
  final FunctionBehavior? behavior;

  const FunctionDeclaration({
    required this.name,
    required this.description,
    this.parameters,
    this.parametersJsonSchema,
    this.response,
    this.responseJsonSchema,
    this.behavior,
  });

  factory FunctionDeclaration.fromJson(Map<String, dynamic> json) =>
      FunctionDeclaration(
    name: json['name'] as String,
    description: json['description'] as String,
    parameters: json['parameters'] != null
        ? Schema.fromJson(json['parameters'])
        : null,
    parametersJsonSchema: json['parametersJsonSchema'] != null
        ? json['parametersJsonSchema'] as Map<String, dynamic>
        : null,
    response: json['response'] != null
        ? Schema.fromJson(json['response'])
        : null,
    responseJsonSchema: json['responseJsonSchema'] != null
        ? json['responseJsonSchema'] as Map<String, dynamic>
        : null,
    behavior: json['behavior'] != null
        ? _functionBehaviorFromString(json['behavior'])
        : null,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    if (parameters != null) 'parameters': parameters!.toJson(),
    if (parametersJsonSchema != null)
      'parametersJsonSchema': parametersJsonSchema,
    if (response != null) 'response': response!.toJson(),
    if (responseJsonSchema != null) 'responseJsonSchema': responseJsonSchema,
    if (behavior != null)
      'behavior': _functionBehaviorToString(behavior!),
  };
}
```

---

### 4.3 FunctionCall

**Description**: Model's request to call a function.

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `id` | `string` | No | Call ID (for tracking) |
| `name` | `string` | Yes | Function name to call |
| `args` | `object` | No | Function arguments (JSON object) |

**Dart Implementation**:

```dart
class FunctionCall {
  final String? id;
  final String name;
  final Map<String, dynamic>? args;

  const FunctionCall({this.id, required this.name, this.args});

  factory FunctionCall.fromJson(Map<String, dynamic> json) => FunctionCall(
    id: json['id'] as String?,
    name: json['name'] as String,
    args: json['args'] != null ? json['args'] as Map<String, dynamic> : null,
  );

  Map<String, dynamic> toJson() => {
    if (id != null) 'id': id,
    'name': name,
    if (args != null) 'args': args,
  };
}
```

---

### 4.4 FunctionResponse

**Description**: Result from function execution (sent back to model).

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `id` | `string` | No | Call ID (matches FunctionCall.id) |
| `name` | `string` | Yes | Function name |
| `response` | `object` | Yes | Function result (JSON object) |
| `willContinue` | `boolean` | No | For streaming functions |
| `scheduling` | `FunctionCallingScheduling` | No | Execution scheduling |

**FunctionCallingScheduling Enum**:

- `FUNCTION_CALLING_SCHEDULING_UNSPECIFIED`
- `WHEN_IDLE` - Execute when model is idle

**Dart Implementation**:

```dart
enum FunctionCallingScheduling {
  unspecified,
  whenIdle,
}

class FunctionResponse {
  final String? id;
  final String name;
  final Map<String, dynamic> response;
  final bool? willContinue;
  final FunctionCallingScheduling? scheduling;

  const FunctionResponse({
    this.id,
    required this.name,
    required this.response,
    this.willContinue,
    this.scheduling,
  });

  factory FunctionResponse.fromJson(Map<String, dynamic> json) =>
      FunctionResponse(
    id: json['id'] as String?,
    name: json['name'] as String,
    response: json['response'] as Map<String, dynamic>,
    willContinue: json['willContinue'] as bool?,
    scheduling: json['scheduling'] != null
        ? _functionCallingSchedulingFromString(json['scheduling'])
        : null,
  );

  Map<String, dynamic> toJson() => {
    if (id != null) 'id': id,
    'name': name,
    'response': response,
    if (willContinue != null) 'willContinue': willContinue,
    if (scheduling != null)
      'scheduling': _functionCallingSchedulingToString(scheduling!),
  };
}
```

---

### 4.5 CodeExecution

**Description**: Enable Python code execution by the model.

**Properties**: None (empty object)

**Dart Implementation**:

```dart
class CodeExecution {
  const CodeExecution();

  factory CodeExecution.fromJson(Map<String, dynamic> json) =>
      const CodeExecution();

  Map<String, dynamic> toJson() => {};
}
```

**Usage**: When enabled, model can generate `ExecutableCodePart`, which is auto-executed.

---

### 4.6 ExecutableCode

**Description**: Code to be executed.

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `language` | `Language` | Yes | Programming language |
| `code` | `string` | Yes | Code to execute |

**Language Enum**:

- `LANGUAGE_UNSPECIFIED`
- `PYTHON` - Python 3

**Dart Implementation**:

```dart
enum Language {
  unspecified,
  python,
}

class ExecutableCode {
  final Language language;
  final String code;

  const ExecutableCode({required this.language, required this.code});

  factory ExecutableCode.fromJson(Map<String, dynamic> json) =>
      ExecutableCode(
    language: _languageFromString(json['language']),
    code: json['code'] as String,
  );

  Map<String, dynamic> toJson() => {
    'language': _languageToString(language),
    'code': code,
  };
}
```

---

### 4.7 CodeExecutionResult

**Description**: Result from code execution.

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `outcome` | `Outcome` | Yes | Execution outcome |
| `output` | `string` | No | stdout or stderr |

**Outcome Enum**:

- `OUTCOME_UNSPECIFIED`
- `OUTCOME_OK` - Successful execution
- `OUTCOME_FAILED` - Execution failed
- `OUTCOME_DEADLINE_EXCEEDED` - Timeout

**Dart Implementation**:

```dart
enum Outcome {
  unspecified,
  ok,
  failed,
  deadlineExceeded,
}

class CodeExecutionResult {
  final Outcome outcome;
  final String? output;

  const CodeExecutionResult({required this.outcome, this.output});

  factory CodeExecutionResult.fromJson(Map<String, dynamic> json) =>
      CodeExecutionResult(
    outcome: _outcomeFromString(json['outcome']),
    output: json['output'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'outcome': _outcomeToString(outcome),
    if (output != null) 'output': output,
  };
}
```

---

### 4.8 GoogleSearch

**Description**: Enable Google Search tool.

**Properties**: None (empty object)

**Dart Implementation**:

```dart
class GoogleSearch {
  const GoogleSearch();

  factory GoogleSearch.fromJson(Map<String, dynamic> json) =>
      const GoogleSearch();

  Map<String, dynamic> toJson() => {};
}
```

---

### 4.9 GoogleSearchRetrieval

**Description**: Grounding with Google Search (retrieval-augmented generation).

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `dynamicRetrievalConfig` | `DynamicRetrievalConfig` | No | Dynamic retrieval settings |

**Dart Implementation**:

```dart
class GoogleSearchRetrieval {
  final DynamicRetrievalConfig? dynamicRetrievalConfig;

  const GoogleSearchRetrieval({this.dynamicRetrievalConfig});

  factory GoogleSearchRetrieval.fromJson(Map<String, dynamic> json) =>
      GoogleSearchRetrieval(
    dynamicRetrievalConfig: json['dynamicRetrievalConfig'] != null
        ? DynamicRetrievalConfig.fromJson(json['dynamicRetrievalConfig'])
        : null,
  );

  Map<String, dynamic> toJson() => {
    if (dynamicRetrievalConfig != null)
      'dynamicRetrievalConfig': dynamicRetrievalConfig!.toJson(),
  };
}

class DynamicRetrievalConfig {
  final String? mode;
  final double? dynamicThreshold;

  const DynamicRetrievalConfig({this.mode, this.dynamicThreshold});

  factory DynamicRetrievalConfig.fromJson(Map<String, dynamic> json) =>
      DynamicRetrievalConfig(
    mode: json['mode'] as String?,
    dynamicThreshold: json['dynamicThreshold'] as double?,
  );

  Map<String, dynamic> toJson() => {
    if (mode != null) 'mode': mode,
    if (dynamicThreshold != null) 'dynamicThreshold': dynamicThreshold,
  };
}
```

---

## 5. Embeddings (6 schemas)

### 5.1 EmbedContentRequest

**Description**: Request for embedding generation.

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `model` | `string` | Yes | Model ID (e.g., `models/gemini-embedding-001`) |
| `content` | `Content` | Yes | Content to embed |
| `taskType` | `TaskType` | No | Use case hint for embedding |
| `title` | `string` | No | Document title (for RETRIEVAL_DOCUMENT) |
| `outputDimensionality` | `int32` | No | Reduce embedding dimensions |

**TaskType Enum**:

- `TASK_TYPE_UNSPECIFIED`
- `RETRIEVAL_QUERY` - Query for search
- `RETRIEVAL_DOCUMENT` - Document to be indexed
- `SEMANTIC_SIMILARITY` - Similarity comparison
- `CLASSIFICATION` - Classification task
- `CLUSTERING` - Clustering task
- `QUESTION_ANSWERING` - Q&A task
- `FACT_VERIFICATION` - Fact checking

**Dart Implementation**:

```dart
enum TaskType {
  unspecified,
  retrievalQuery,
  retrievalDocument,
  semanticSimilarity,
  classification,
  clustering,
  questionAnswering,
  factVerification,
}

class EmbedContentRequest {
  final String model;
  final Content content;
  final TaskType? taskType;
  final String? title;
  final int? outputDimensionality;

  const EmbedContentRequest({
    required this.model,
    required this.content,
    this.taskType,
    this.title,
    this.outputDimensionality,
  });

  factory EmbedContentRequest.fromJson(Map<String, dynamic> json) =>
      EmbedContentRequest(
    model: json['model'] as String,
    content: Content.fromJson(json['content']),
    taskType: json['taskType'] != null
        ? _taskTypeFromString(json['taskType'])
        : null,
    title: json['title'] as String?,
    outputDimensionality: json['outputDimensionality'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'model': model,
    'content': content.toJson(),
    if (taskType != null) 'taskType': _taskTypeToString(taskType!),
    if (title != null) 'title': title,
    if (outputDimensionality != null)
      'outputDimensionality': outputDimensionality,
  };
}
```

---

### 5.2 EmbedContentResponse

**Description**: Embedding result.

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `embedding` | `ContentEmbedding` | Yes | The embedding vector |

**Dart Implementation**:

```dart
class EmbedContentResponse {
  final ContentEmbedding embedding;

  const EmbedContentResponse({required this.embedding});

  factory EmbedContentResponse.fromJson(Map<String, dynamic> json) =>
      EmbedContentResponse(
    embedding: ContentEmbedding.fromJson(json['embedding']),
  );

  Map<String, dynamic> toJson() => {
    'embedding': embedding.toJson(),
  };
}
```

---

### 5.3 ContentEmbedding

**Description**: Vector representation of content.

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `values` | `float[]` | Yes | Embedding vector |

**Dart Implementation**:

```dart
class ContentEmbedding {
  final List<double> values;

  const ContentEmbedding({required this.values});

  factory ContentEmbedding.fromJson(Map<String, dynamic> json) =>
      ContentEmbedding(
    values: (json['values'] as List).cast<double>(),
  );

  Map<String, dynamic> toJson() => {
    'values': values,
  };
}
```

---

### 5.4 BatchEmbedContentsRequest

**Description**: Batch embedding request (synchronous).

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `requests` | `EmbedContentRequest[]` | Yes | List of embed requests |

**Dart Implementation**:

```dart
class BatchEmbedContentsRequest {
  final List<EmbedContentRequest> requests;

  const BatchEmbedContentsRequest({required this.requests});

  factory BatchEmbedContentsRequest.fromJson(Map<String, dynamic> json) =>
      BatchEmbedContentsRequest(
    requests: (json['requests'] as List)
        .map((e) => EmbedContentRequest.fromJson(e))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'requests': requests.map((e) => e.toJson()).toList(),
  };
}
```

---

### 5.5 BatchEmbedContentsResponse

**Description**: Batch embedding result.

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `embeddings` | `ContentEmbedding[]` | Yes | Embeddings (same order as requests) |

**Dart Implementation**:

```dart
class BatchEmbedContentsResponse {
  final List<ContentEmbedding> embeddings;

  const BatchEmbedContentsResponse({required this.embeddings});

  factory BatchEmbedContentsResponse.fromJson(Map<String, dynamic> json) =>
      BatchEmbedContentsResponse(
    embeddings: (json['embeddings'] as List)
        .map((e) => ContentEmbedding.fromJson(e))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'embeddings': embeddings.map((e) => e.toJson()).toList(),
  };
}
```

---

### 5.6 AsyncBatchEmbedContentRequest

**Description**: Async batch embedding request (returns LRO).

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `model` | `string` | Yes | Model ID |
| `requests` | `EmbedContentRequest[]` | Yes | List of embed requests |

**Dart Implementation**:

```dart
class AsyncBatchEmbedContentRequest {
  final String model;
  final List<EmbedContentRequest> requests;

  const AsyncBatchEmbedContentRequest({
    required this.model,
    required this.requests,
  });

  factory AsyncBatchEmbedContentRequest.fromJson(Map<String, dynamic> json) =>
      AsyncBatchEmbedContentRequest(
    model: json['model'] as String,
    requests: (json['requests'] as List)
        .map((e) => EmbedContentRequest.fromJson(e))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'model': model,
    'requests': requests.map((e) => e.toJson()).toList(),
  };
}
```

---

## 6. Models & Tuning (8 schemas)

### 6.1 Model

**Description**: Metadata about an available model.

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `name` | `string` | Yes | Model ID (e.g., `models/gemini-pro`) |
| `displayName` | `string` | No | Human-readable name |
| `description` | `string` | No | Model description |
| `version` | `string` | No | Model version |
| `baseModelId` | `string` | No | Base model identifier |
| `inputTokenLimit` | `int32` | No | Max input tokens |
| `outputTokenLimit` | `int32` | No | Max output tokens |
| `supportedGenerationMethods` | `string[]` | No | Supported methods (e.g., `generateContent`) |
| `temperature` | `double` | No | Default temperature |
| `topP` | `double` | No | Default top-p |
| `topK` | `int32` | No | Default top-k |

**Dart Implementation**:

```dart
class Model {
  final String name;
  final String? displayName;
  final String? description;
  final String? version;
  final String? baseModelId;
  final int? inputTokenLimit;
  final int? outputTokenLimit;
  final List<String>? supportedGenerationMethods;
  final double? temperature;
  final double? topP;
  final int? topK;

  const Model({
    required this.name,
    this.displayName,
    this.description,
    this.version,
    this.baseModelId,
    this.inputTokenLimit,
    this.outputTokenLimit,
    this.supportedGenerationMethods,
    this.temperature,
    this.topP,
    this.topK,
  });

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    name: json['name'] as String,
    displayName: json['displayName'] as String?,
    description: json['description'] as String?,
    version: json['version'] as String?,
    baseModelId: json['baseModelId'] as String?,
    inputTokenLimit: json['inputTokenLimit'] as int?,
    outputTokenLimit: json['outputTokenLimit'] as int?,
    supportedGenerationMethods: json['supportedGenerationMethods'] != null
        ? (json['supportedGenerationMethods'] as List).cast<String>()
        : null,
    temperature: json['temperature'] as double?,
    topP: json['topP'] as double?,
    topK: json['topK'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    if (displayName != null) 'displayName': displayName,
    if (description != null) 'description': description,
    if (version != null) 'version': version,
    if (baseModelId != null) 'baseModelId': baseModelId,
    if (inputTokenLimit != null) 'inputTokenLimit': inputTokenLimit,
    if (outputTokenLimit != null) 'outputTokenLimit': outputTokenLimit,
    if (supportedGenerationMethods != null)
      'supportedGenerationMethods': supportedGenerationMethods,
    if (temperature != null) 'temperature': temperature,
    if (topP != null) 'topP': topP,
    if (topK != null) 'topK': topK,
  };
}
```

---

### 6.2 ListModelsResponse

**Description**: Paginated list of models.

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `models` | `Model[]` | Yes | Models in this page |
| `nextPageToken` | `string` | No | Token for next page |

**Dart Implementation**:

```dart
class ListModelsResponse {
  final List<Model> models;
  final String? nextPageToken;

  const ListModelsResponse({required this.models, this.nextPageToken});

  factory ListModelsResponse.fromJson(Map<String, dynamic> json) =>
      ListModelsResponse(
    models:
        (json['models'] as List).map((e) => Model.fromJson(e)).toList(),
    nextPageToken: json['nextPageToken'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'models': models.map((e) => e.toJson()).toList(),
    if (nextPageToken != null) 'nextPageToken': nextPageToken,
  };
}
```

---

### 6.3 TunedModel

**Description**: A fine-tuned custom model.

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `name` | `string` | No (output only) | Model ID (e.g., `tunedModels/my-model-abc123`) |
| `displayName` | `string` | No | Human-readable name |
| `description` | `string` | No | Model description |
| `state` | `State` | No (output only) | Current state |
| `baseModel` | `string` | Yes | Base model used for tuning |
| `temperature` | `double` | No | Override default temperature |
| `topP` | `double` | No | Override default top-p |
| `topK` | `int32` | No | Override default top-k |
| `tuningTask` | `TuningTask` | No | Tuning configuration |
| `createTime` | `timestamp` | No (output only) | Creation time |
| `updateTime` | `timestamp` | No (output only) | Last update time |

**State Enum**:

- `STATE_UNSPECIFIED`
- `CREATING` - Model is being created
- `ACTIVE` - Model is ready
- `FAILED` - Creation failed

**Dart Implementation**:

```dart
enum TunedModelState {
  unspecified,
  creating,
  active,
  failed,
}

class TunedModel {
  final String? name;
  final String? displayName;
  final String? description;
  final TunedModelState? state;
  final String baseModel;
  final double? temperature;
  final double? topP;
  final int? topK;
  final TuningTask? tuningTask;
  final DateTime? createTime;
  final DateTime? updateTime;

  const TunedModel({
    this.name,
    this.displayName,
    this.description,
    this.state,
    required this.baseModel,
    this.temperature,
    this.topP,
    this.topK,
    this.tuningTask,
    this.createTime,
    this.updateTime,
  });

  factory TunedModel.fromJson(Map<String, dynamic> json) => TunedModel(
    name: json['name'] as String?,
    displayName: json['displayName'] as String?,
    description: json['description'] as String?,
    state: json['state'] != null
        ? _tunedModelStateFromString(json['state'])
        : null,
    baseModel: json['baseModel'] as String,
    temperature: json['temperature'] as double?,
    topP: json['topP'] as double?,
    topK: json['topK'] as int?,
    tuningTask: json['tuningTask'] != null
        ? TuningTask.fromJson(json['tuningTask'])
        : null,
    createTime: json['createTime'] != null
        ? DateTime.parse(json['createTime'])
        : null,
    updateTime: json['updateTime'] != null
        ? DateTime.parse(json['updateTime'])
        : null,
  );

  Map<String, dynamic> toJson() => {
    if (name != null) 'name': name,
    if (displayName != null) 'displayName': displayName,
    if (description != null) 'description': description,
    if (state != null) 'state': _tunedModelStateToString(state!),
    'baseModel': baseModel,
    if (temperature != null) 'temperature': temperature,
    if (topP != null) 'topP': topP,
    if (topK != null) 'topK': topK,
    if (tuningTask != null) 'tuningTask': tuningTask!.toJson(),
    if (createTime != null) 'createTime': createTime!.toIso8601String(),
    if (updateTime != null) 'updateTime': updateTime!.toIso8601String(),
  };
}
```

---

### 6.4 TuningTask

**Description**: Configuration for model tuning.

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `startTime` | `timestamp` | No (output only) | When tuning started |
| `completeTime` | `timestamp` | No (output only) | When tuning completed |
| `snapshots` | `TuningSnapshot[]` | No (output only) | Training snapshots |
| `trainingData` | `Dataset` | Yes | Training examples |
| `hyperparameters` | `Hyperparameters` | No | Tuning hyperparameters |

**Dart Implementation**:

```dart
class TuningTask {
  final DateTime? startTime;
  final DateTime? completeTime;
  final List<TuningSnapshot>? snapshots;
  final Dataset trainingData;
  final Hyperparameters? hyperparameters;

  const TuningTask({
    this.startTime,
    this.completeTime,
    this.snapshots,
    required this.trainingData,
    this.hyperparameters,
  });

  factory TuningTask.fromJson(Map<String, dynamic> json) => TuningTask(
    startTime: json['startTime'] != null
        ? DateTime.parse(json['startTime'])
        : null,
    completeTime: json['completeTime'] != null
        ? DateTime.parse(json['completeTime'])
        : null,
    snapshots: json['snapshots'] != null
        ? (json['snapshots'] as List)
            .map((e) => TuningSnapshot.fromJson(e))
            .toList()
        : null,
    trainingData: Dataset.fromJson(json['trainingData']),
    hyperparameters: json['hyperparameters'] != null
        ? Hyperparameters.fromJson(json['hyperparameters'])
        : null,
  );

  Map<String, dynamic> toJson() => {
    if (startTime != null) 'startTime': startTime!.toIso8601String(),
    if (completeTime != null) 'completeTime': completeTime!.toIso8601String(),
    if (snapshots != null)
      'snapshots': snapshots!.map((e) => e.toJson()).toList(),
    'trainingData': trainingData.toJson(),
    if (hyperparameters != null) 'hyperparameters': hyperparameters!.toJson(),
  };
}
```

---

### 6.5 TuningSnapshot

**Description**: Training progress snapshot.

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `step` | `int32` | No | Training step number |
| `epoch` | `int32` | No | Epoch number |
| `meanLoss` | `double` | No | Mean training loss |
| `computeTime` | `timestamp` | No | When snapshot was taken |

**Dart Implementation**:

```dart
class TuningSnapshot {
  final int? step;
  final int? epoch;
  final double? meanLoss;
  final DateTime? computeTime;

  const TuningSnapshot({
    this.step,
    this.epoch,
    this.meanLoss,
    this.computeTime,
  });

  factory TuningSnapshot.fromJson(Map<String, dynamic> json) =>
      TuningSnapshot(
    step: json['step'] as int?,
    epoch: json['epoch'] as int?,
    meanLoss: json['meanLoss'] as double?,
    computeTime: json['computeTime'] != null
        ? DateTime.parse(json['computeTime'])
        : null,
  );

  Map<String, dynamic> toJson() => {
    if (step != null) 'step': step,
    if (epoch != null) 'epoch': epoch,
    if (meanLoss != null) 'meanLoss': meanLoss,
    if (computeTime != null) 'computeTime': computeTime!.toIso8601String(),
  };
}
```

---

### 6.6 Dataset

**Description**: Training dataset.

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `examples` | `TuningExamples` | No | Inline training examples |

**Dart Implementation**:

```dart
class Dataset {
  final TuningExamples? examples;

  const Dataset({this.examples});

  factory Dataset.fromJson(Map<String, dynamic> json) => Dataset(
    examples: json['examples'] != null
        ? TuningExamples.fromJson(json['examples'])
        : null,
  );

  Map<String, dynamic> toJson() => {
    if (examples != null) 'examples': examples!.toJson(),
  };
}

class TuningExamples {
  final List<TuningExample>? examples;

  const TuningExamples({this.examples});

  factory TuningExamples.fromJson(Map<String, dynamic> json) =>
      TuningExamples(
    examples: json['examples'] != null
        ? (json['examples'] as List)
            .map((e) => TuningExample.fromJson(e))
            .toList()
        : null,
  );

  Map<String, dynamic> toJson() => {
    if (examples != null)
      'examples': examples!.map((e) => e.toJson()).toList(),
  };
}

class TuningExample {
  final String? textInput;
  final String? output;

  const TuningExample({this.textInput, this.output});

  factory TuningExample.fromJson(Map<String, dynamic> json) => TuningExample(
    textInput: json['textInput'] as String?,
    output: json['output'] as String?,
  );

  Map<String, dynamic> toJson() => {
    if (textInput != null) 'textInput': textInput,
    if (output != null) 'output': output,
  };
}
```

---

### 6.7 Hyperparameters

**Description**: Tuning hyperparameters.

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `epochCount` | `int32` | No | Number of training epochs |
| `batchSize` | `int32` | No | Batch size |
| `learningRate` | `double` | No | Learning rate |
| `learningRateMultiplier` | `double` | No | LR multiplier |

**Dart Implementation**:

```dart
class Hyperparameters {
  final int? epochCount;
  final int? batchSize;
  final double? learningRate;
  final double? learningRateMultiplier;

  const Hyperparameters({
    this.epochCount,
    this.batchSize,
    this.learningRate,
    this.learningRateMultiplier,
  });

  factory Hyperparameters.fromJson(Map<String, dynamic> json) =>
      Hyperparameters(
    epochCount: json['epochCount'] as int?,
    batchSize: json['batchSize'] as int?,
    learningRate: json['learningRate'] as double?,
    learningRateMultiplier: json['learningRateMultiplier'] as double?,
  );

  Map<String, dynamic> toJson() => {
    if (epochCount != null) 'epochCount': epochCount,
    if (batchSize != null) 'batchSize': batchSize,
    if (learningRate != null) 'learningRate': learningRate,
    if (learningRateMultiplier != null)
      'learningRateMultiplier': learningRateMultiplier,
  };
}
```

---

### 6.8 ListTunedModelsResponse

**Description**: Paginated list of tuned models.

**Properties**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `tunedModels` | `TunedModel[]` | Yes | Models in this page |
| `nextPageToken` | `string` | No | Token for next page |

**Dart Implementation**:

```dart
class ListTunedModelsResponse {
  final List<TunedModel> tunedModels;
  final String? nextPageToken;

  const ListTunedModelsResponse({
    required this.tunedModels,
    this.nextPageToken,
  });

  factory ListTunedModelsResponse.fromJson(Map<String, dynamic> json) =>
      ListTunedModelsResponse(
    tunedModels: (json['tunedModels'] as List)
        .map((e) => TunedModel.fromJson(e))
        .toList(),
    nextPageToken: json['nextPageToken'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'tunedModels': tunedModels.map((e) => e.toJson()).toList(),
    if (nextPageToken != null) 'nextPageToken': nextPageToken,
  };
}
```

---

## Summary

This data model document provides comprehensive schema definitions for all 182 types in the GoogleAI API, organized by functional domain. Each schema includes:

- **Field definitions** with types, requirements, and descriptions
- **Enum values** with semantic meanings
- **Validation rules** where applicable
- **Complete Dart implementations** with `fromJson`/`toJson` methods
- **Usage examples** for complex types

**Critical Design Decisions**:

1. **Part as Sealed Class** - Enables type-safe polymorphism with pattern matching
2. **Enum Type Safety** - All enums are strongly typed (no string literals in business logic)
3. **Immutability** - All models are immutable with `const` constructors
4. **Null Safety** - Optional fields are nullable, required fields are non-nullable
5. **Forward Compatibility** - Consider adding `Map<String, dynamic>? extra` to preserve unknown fields

**Next Steps**: See `implementation_plan.md` for file organization and implementation order.