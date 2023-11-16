// ignore_for_file: public_member_api_docs
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(const HomeScreenState());

  void onClientTypeChanged(final ClientType clientType) {
    emit(state.copyWith(clientType: clientType, response: ''));
  }

  void onOpenAIKeyChanged(final String openAIKey) {
    emit(state.copyWith(openAIKey: openAIKey));
  }

  void onLocalUrlChanged(final String localUrl) {
    emit(state.copyWith(localUrl: localUrl));
  }

  void onQueryChanged(final String query) {
    emit(state.copyWith(query: query));
  }

  Future<void> onSubmitPressed() async {
    final config = _getClientConfig();
    if (config == null) {
      return;
    }
    final (apiKey, baseUrl) = config;

    final query = state.query;
    if (query == null || query.isEmpty) {
      emit(
        state.copyWith(
          status: HomeScreenStatus.idle,
          error: HomeScreenError.queryEmpty,
        ),
      );
      return;
    }

    emit(state.copyWith(status: HomeScreenStatus.generating, response: ''));

    final llm = ChatOpenAI(
      apiKey: apiKey,
      baseUrl: baseUrl,
    );

    final result = await llm([ChatMessage.humanText(query)]);
    emit(
      state.copyWith(
        status: HomeScreenStatus.idle,
        response: result.content.trim(),
      ),
    );
  }

  (String? apiKey, String? baseUrl)? _getClientConfig() {
    final clientType = state.clientType;

    if (clientType == ClientType.openAI) {
      final openAIKey = state.openAIKey;
      if (openAIKey == null || openAIKey.isEmpty) {
        emit(
          state.copyWith(
            status: HomeScreenStatus.idle,
            error: HomeScreenError.openAIKeyEmpty,
          ),
        );
        return null;
      }

      return (openAIKey, null);
    } else {
      final localUrl = state.localUrl;
      if (localUrl == null || localUrl.isEmpty) {
        emit(
          state.copyWith(
            status: HomeScreenStatus.idle,
            error: HomeScreenError.localUrlEmpty,
          ),
        );
        return null;
      }

      return (null, localUrl);
    }
  }
}
