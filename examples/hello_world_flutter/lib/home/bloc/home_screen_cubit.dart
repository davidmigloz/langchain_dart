// ignore_for_file: public_member_api_docs
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_google/langchain_google.dart';
import 'package:langchain_mistralai/langchain_mistralai.dart';
import 'package:langchain_ollama/langchain_ollama.dart';
import 'package:langchain_openai/langchain_openai.dart';

import 'providers.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(const HomeScreenState()) {
    _updateChain();
  }

  RunnableSequence<String, String>? chain;

  void onProviderChanged(final Provider provider) {
    emit(
      state.copyWith(
        status: HomeScreenStatus.idle,
        provider: provider,
        response: '',
      ),
    );
    _updateChain();
  }

  void onModelChanged(final String model) {
    final newModel = {
      ...state.model,
      state.provider: model,
    };
    emit(state.copyWith(model: newModel));
    _updateChain();
  }

  void onApiKeyChanged(final String apiKey) {
    final newApiKey = {
      ...state.apiKey,
      state.provider: apiKey,
    };
    emit(state.copyWith(apiKey: newApiKey));
    _updateChain();
  }

  void onBaseUrlChanged(final String baseUrl) {
    final newBaseUrl = {
      ...state.baseUrl,
      state.provider: baseUrl,
    };
    emit(state.copyWith(baseUrl: newBaseUrl));
    _updateChain();
  }

  void onQueryChanged(final String query) {
    emit(state.copyWith(query: query));
  }

  Future<void> onSubmitPressed() async {
    if (!_validateInput()) return;
    emit(state.copyWith(status: HomeScreenStatus.generating, response: ''));

    assert(chain != null);
    final stream = chain!.stream(state.query).handleError(_onErrorGenerating);
    await for (final result in stream) {
      emit(
        state.copyWith(
          status: HomeScreenStatus.idle,
          response: (state.response) + result,
        ),
      );
    }
  }

  bool _validateInput() {
    final provider = state.provider;
    if (provider.isRemote && (state.apiKey[provider] ?? '').isEmpty) {
      emit(
        state.copyWith(
          status: HomeScreenStatus.idle,
          error: HomeScreenError.apiKeyEmpty,
        ),
      );
      return false;
    }

    if (state.query.isEmpty) {
      emit(
        state.copyWith(
          status: HomeScreenStatus.idle,
          error: HomeScreenError.queryEmpty,
        ),
      );
      return false;
    }

    return true;
  }

  void _updateChain() {
    try {
      final provider = state.provider;
      final model = state.model;
      final apiKey = state.apiKey;

      final chatModel =
          switch (provider) {
                Provider.googleAI => ChatGoogleGenerativeAI(
                  apiKey: apiKey[provider] ?? '',
                  baseUrl: state.baseUrl[provider] ?? provider.defaultBaseUrl,
                  defaultOptions: ChatGoogleGenerativeAIOptions(
                    model: model[provider] ?? provider.defaultModel,
                  ),
                ),
                Provider.mistral => ChatMistralAI(
                  apiKey: apiKey[provider] ?? '',
                  baseUrl: state.baseUrl[provider] ?? provider.defaultBaseUrl,
                  defaultOptions: ChatMistralAIOptions(
                    model: model[provider] ?? provider.defaultModel,
                  ),
                ),
                Provider.openAI => ChatOpenAI(
                  apiKey: apiKey[provider] ?? '',
                  baseUrl: state.baseUrl[provider] ?? provider.defaultBaseUrl,
                  defaultOptions: ChatOpenAIOptions(
                    model: model[provider] ?? provider.defaultModel,
                  ),
                ),
                Provider.ollama => ChatOllama(
                  baseUrl: state.baseUrl[provider] ?? provider.defaultBaseUrl,
                  defaultOptions: ChatOllamaOptions(
                    model: model[provider] ?? provider.defaultModel,
                  ),
                ),
              }
              as BaseChatModel<ChatModelOptions>;

      chain?.close();
      chain = Runnable.getMapFromInput<String>('query')
          .pipe(
            ChatPromptTemplate.fromTemplates(const [
              (
                ChatMessageType.system,
                'Your are a helpful assistant. Reply to the user using Markdown.',
              ),
              (ChatMessageType.human, '{query}'),
            ]),
          )
          .pipe(chatModel)
          .pipe(const StringOutputParser());
    } catch (_) {
      // Ignore invalid base URL exceptions
    }
  }

  void _onErrorGenerating(final Object error) {
    emit(
      state.copyWith(
        status: HomeScreenStatus.idle,
        error: HomeScreenError.generationError,
      ),
    );
  }
}
