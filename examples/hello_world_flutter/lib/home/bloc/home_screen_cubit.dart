import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:langchain_openai/langchain_openai.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(const HomeScreenState());

  void onOpenAIKeyChanged(final String openAIKey) {
    emit(state.copyWith(openAIKey: openAIKey));
  }

  void onQueryChanged(final String query) {
    emit(state.copyWith(query: query));
  }

  Future<void> onSubmitPressed() async {
    final openAIKey = state.openAIKey;
    final query = state.query;

    if (openAIKey == null || openAIKey.isEmpty) {
      emit(
        state.copyWith(
          status: HomeScreenStatus.idle,
          error: HomeScreenError.openAIKeyEmpty,
        ),
      );
      return;
    }

    if (query == null || query.isEmpty) {
      emit(
        state.copyWith(
          status: HomeScreenStatus.idle,
          error: HomeScreenError.queryEmpty,
        ),
      );
      return;
    }

    emit(state.copyWith(status: HomeScreenStatus.generating));

    final llm = OpenAI(apiKey: openAIKey);

    final result = await llm(query);
    emit(
      state.copyWith(
        status: HomeScreenStatus.idle,
        response: result.trim(),
      ),
    );
  }
}
