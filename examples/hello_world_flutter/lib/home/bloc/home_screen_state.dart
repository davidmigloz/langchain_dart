part of 'home_screen_cubit.dart';

@immutable
class HomeScreenState extends Equatable {
  const HomeScreenState({
    this.status = HomeScreenStatus.idle,
    this.error,
    this.openAIKey,
    this.query,
    this.response,
  });

  final HomeScreenStatus status;
  final HomeScreenError? error;
  final String? openAIKey;
  final String? query;
  final String? response;

  HomeScreenState copyWith({
    final HomeScreenStatus? status,
    final HomeScreenError? error,
    final String? openAIKey,
    final String? query,
    final String? response,
  }) {
    return HomeScreenState(
      status: status ?? this.status,
      error: error,
      openAIKey: openAIKey ?? this.openAIKey,
      query: query ?? this.query,
      response: response ?? this.response,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        openAIKey,
        query,
        response,
      ];
}

enum HomeScreenStatus {
  idle,
  generating,
}

enum HomeScreenError {
  openAIKeyEmpty,
  queryEmpty,
}
