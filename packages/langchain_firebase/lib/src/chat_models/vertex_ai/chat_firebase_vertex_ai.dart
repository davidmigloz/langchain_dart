import 'package:collection/collection.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/prompts.dart';
import 'package:uuid/uuid.dart';

import 'mappers.dart';
import 'types.dart';

/// Wrapper around [Vertex AI for Firebase](https://firebase.google.com/docs/vertex-ai)
/// API (aka Gemini API).
///
/// Example:
/// ```dart
/// final chatModel = ChatFirebaseVertexAI();
/// final messages = [
///   ChatMessage.humanText('Tell me a joke.'),
/// ];
/// final prompt = PromptValue.chat(messages);
/// final res = await chatModel.invoke(prompt);
/// ```
///
/// - [Vertex AI for Firebase](https://firebase.google.com/docs/vertex-ai)
///
/// ### Setup
///
/// To use `ChatFirebaseVertexAI` you need to have:
/// - A Firebase project with Blaze pay-as-you-go pricing plan
/// - `aiplatform.googleapis.com` and `firebaseml.googleapis.com` APIs enabled
/// - Firebase SDK initialized in your app
/// - Recommended: Firebase App Check enabled
///
/// ### Available models
///
/// The following models are available:
/// - `gemini-1.5-flash`:
///   * text / image / audio -> text model
///   * Max input token: 1048576
///   * Max output tokens: 8192
/// - `gemini-1.5-pro`:
///   * text / image / audio -> text model
///   * Max input token: 1048576
///   * Max output tokens: 8192
/// - `gemini-1.0-pro-vision`:
///   * text / image -> text model
///   * Max input token: 12288
///   * Max output tokens: 4096
/// - `gemini-1.0-pro`
///   * text -> text model
///   * Max input token: 30720
///   * Max output tokens: 2048
///
/// Mind that this list may not be up-to-date.
/// Refer to the [documentation](https://firebase.google.com/docs/vertex-ai/gemini-models)
/// for the updated list.
///
/// ### Call options
///
/// You can configure the parameters that will be used when calling the
/// chat completions API in several ways:
///
/// **Default options:**
///
/// Use the [defaultOptions] parameter to set the default options. These
/// options will be used unless you override them when generating completions.
///
/// ```dart
/// final chatModel = ChatFirebaseVertexAI(
///   defaultOptions: ChatFirebaseVertexAIOptions(
///     model: 'gemini-1.5-pro-preview',
///     temperature: 0,
///   ),
/// );
/// ```
///
/// **Call options:**
///
/// You can override the default options when invoking the model:
///
/// ```dart
/// final res = await chatModel.invoke(
///   prompt,
///   options: const ChatFirebaseVertexAIOptions(temperature: 1),
/// );
/// ```
///
/// **Bind:**
///
/// You can also change the options in a [Runnable] pipeline using the bind
/// method.
///
/// In this example, we are using two totally different models for each
/// question:
///
/// ```dart
/// final chatModel = ChatFirebaseVertexAI();
/// const outputParser = StringOutputParser();
/// final prompt1 = PromptTemplate.fromTemplate('How are you {name}?');
/// final prompt2 = PromptTemplate.fromTemplate('How old are you {name}?');
/// final chain = Runnable.fromMap({
///   'q1': prompt1 | chatModel.bind(const ChatFirebaseVertexAIOptions(model: 'gemini-1.0-pro')) | outputParser,
///   'q2': prompt2 | chatModel.bind(const ChatFirebaseVertexAIOptions(model: 'gemini-1.0-pro-vision')) | outputParser,
/// });
/// final res = await chain.invoke({'name': 'David'});
/// ```
///
/// ### Tool calling
///
/// [ChatFirebaseVertexAI] supports tool calling.
///
/// Check the [docs](https://langchaindart.dev/#/modules/model_io/models/chat_models/how_to/tools)
/// for more information on how to use tools.
///
/// Example:
/// ```dart
/// const tool = ToolSpec(
///   name: 'get_current_weather',
///   description: 'Get the current weather in a given location',
///   inputJsonSchema: {
///     'type': 'object',
///     'properties': {
///       'location': {
///         'type': 'string',
///         'description': 'The city and state, e.g. San Francisco, CA',
///       },
///     },
///     'required': ['location'],
///   },
/// );
/// final chatModel = ChatFirebaseVertexAI(
///   defaultOptions: ChatFirebaseVertexAIOptions(
///     model: 'gemini-1.5-pro',
///     temperature: 0,
///     tools: [tool],
///   ),
/// );
/// final res = await model.invoke(
///   PromptValue.string('What’s the weather like in Boston and Madrid right now in celsius?'),
/// );
/// ```
class ChatFirebaseVertexAI extends BaseChatModel<ChatFirebaseVertexAIOptions> {
  /// Create a new [ChatFirebaseVertexAI] instance.
  ///
  /// Main configuration options:
  /// - [ChatFirebaseVertexAI.defaultOptions]
  ///
  /// Firebase configuration options:
  /// - [ChatFirebaseVertexAI.app]
  /// - [ChatFirebaseVertexAI.appCheck]
  /// - [ChatFirebaseVertexAI.options]
  /// - [ChatFirebaseVertexAI.location]
  ChatFirebaseVertexAI({
    super.defaultOptions = const ChatFirebaseVertexAIOptions(
      model: 'gemini-1.0-pro',
    ),
    this.app,
    this.appCheck,
    this.auth,
    this.options,
    this.location,
  }) : _currentModel = defaultOptions.model ?? '' {
    _firebaseClient = _createFirebaseClient(
      _currentModel,
    );
  }

  /// The [FirebaseApp] to use. If not provided, the default app will be used.
  final FirebaseApp? app;

  /// The optional [FirebaseAppCheck] to use to protect the project from abuse.
  final FirebaseAppCheck? appCheck;

  /// The optional [FirebaseAuth] to use for authentication.
  final FirebaseAuth? auth;

  /// Configuration parameters for sending requests to Firebase.
  final RequestOptions? options;

  /// The service location for the [FirebaseVertexAI] instance.
  final String? location;

  /// A client for interacting with Vertex AI for Firebase API.
  late GenerativeModel _firebaseClient;

  /// A UUID generator.
  late final Uuid _uuid = const Uuid();

  @override
  String get modelType => 'chat-firebase-vertex-ai';

  /// The current model set in [_firebaseClient];
  String _currentModel;

  /// The current system instruction set in [_firebaseClient];
  String? _currentSystemInstruction;

  @override
  Future<ChatResult> invoke(
    final PromptValue input, {
    final ChatFirebaseVertexAIOptions? options,
  }) async {
    final id = _uuid.v4();
    final (model, prompt, safetySettings, generationConfig, tools, toolConfig) =
        _generateCompletionRequest(input.toChatMessages(), options: options);
    final completion = await _firebaseClient.generateContent(
      prompt,
      safetySettings: safetySettings,
      generationConfig: generationConfig,
      tools: tools,
      toolConfig: toolConfig,
    );
    return completion.toChatResult(id, model);
  }

  @override
  Stream<ChatResult> stream(
    final PromptValue input, {
    final ChatFirebaseVertexAIOptions? options,
  }) {
    final id = _uuid.v4();
    final (model, prompt, safetySettings, generationConfig, tools, toolConfig) =
        _generateCompletionRequest(input.toChatMessages(), options: options);
    return _firebaseClient
        .generateContentStream(
          prompt,
          safetySettings: safetySettings,
          generationConfig: generationConfig,
          tools: tools,
          toolConfig: toolConfig,
        )
        .map((final completion) => completion.toChatResult(id, model));
  }

  /// Creates a [GenerateContentRequest] from the given input.
  (
    String model,
    Iterable<Content> prompt,
    List<SafetySetting>? safetySettings,
    GenerationConfig? generationConfig,
    List<Tool>? tools,
    ToolConfig? toolConfig,
  ) _generateCompletionRequest(
    final List<ChatMessage> messages, {
    final ChatFirebaseVertexAIOptions? options,
  }) {
    _updateClientIfNeeded(messages, options);

    return (
      _currentModel,
      messages.toContentList(),
      (options?.safetySettings ?? defaultOptions.safetySettings)
          ?.toSafetySettings(),
      GenerationConfig(
        candidateCount:
            options?.candidateCount ?? defaultOptions.candidateCount,
        stopSequences:
            options?.stopSequences ?? defaultOptions.stopSequences ?? const [],
        maxOutputTokens:
            options?.maxOutputTokens ?? defaultOptions.maxOutputTokens,
        temperature: options?.temperature ?? defaultOptions.temperature,
        topP: options?.topP ?? defaultOptions.topP,
        topK: options?.topK ?? defaultOptions.topK,
      ),
      (options?.tools ?? defaultOptions.tools)?.toToolList(),
      (options?.toolChoice ?? defaultOptions.toolChoice)?.toToolConfig(),
    );
  }

  @override
  Future<List<int>> tokenize(
    final PromptValue promptValue, {
    final ChatFirebaseVertexAIOptions? options,
  }) async {
    throw UnsupportedError(
      'Google AI does not expose a tokenizer, only counting tokens is supported.',
    );
  }

  @override
  Future<int> countTokens(
    final PromptValue promptValue, {
    final ChatFirebaseVertexAIOptions? options,
  }) async {
    final messages = promptValue.toChatMessages();
    _updateClientIfNeeded(messages, options);
    final tokens = await _firebaseClient.countTokens(messages.toContentList());
    return tokens.totalTokens;
  }

  /// Create a new [GenerativeModel] instance.
  GenerativeModel _createFirebaseClient(
    final String model, {
    final String? systemInstruction,
  }) {
    return FirebaseVertexAI.instanceFor(
      app: app,
      appCheck: appCheck,
      options: options,
      location: location,
    ).generativeModel(
      model: model,
      systemInstruction:
          systemInstruction != null ? Content.system(systemInstruction) : null,
    );
  }

  /// Recreate the [GenerativeModel] instance.
  void _recreateFirebaseClient(
    final String model,
    final String? systemInstruction,
  ) {
    _firebaseClient = _createFirebaseClient(
      model,
      systemInstruction: systemInstruction,
    );
  }

  /// Updates the model in [_firebaseClient] if needed.
  void _updateClientIfNeeded(
    final List<ChatMessage> messages,
    final ChatFirebaseVertexAIOptions? options,
  ) {
    final model =
        options?.model ?? defaultOptions.model ?? throwNullModelError();

    final systemInstruction = messages.firstOrNull is SystemChatMessage
        ? messages.firstOrNull?.contentAsString
        : null;

    bool recreate = false;
    if (model != _currentModel) {
      _currentModel = model;
      recreate = true;
    }
    if (systemInstruction != _currentSystemInstruction) {
      _currentSystemInstruction = systemInstruction;
      recreate = true;
    }

    if (recreate) {
      _recreateFirebaseClient(model, systemInstruction);
    }
  }
}
