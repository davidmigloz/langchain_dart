// ignore_for_file: public_member_api_docs
part of 'home_screen_cubit.dart';

@immutable
class HomeScreenState extends Equatable {
  const HomeScreenState({
    this.status = HomeScreenStatus.idle,
    this.error,
    this.clientType = ClientType.openAI,
    this.openAIKey,
    this.localUrl,
    this.query,
    this.response,
  });

  final HomeScreenStatus status;
  final HomeScreenError? error;
  final ClientType clientType;
  final String? openAIKey;
  final String? localUrl;
  final String? query;
  final String? response;

  HomeScreenState copyWith({
    final HomeScreenStatus? status,
    final HomeScreenError? error,
    final ClientType? clientType,
    final String? openAIKey,
    final String? localUrl,
    final String? query,
    final String? response,
  }) {
    return HomeScreenState(
      status: status ?? this.status,
      error: error,
      clientType: clientType ?? this.clientType,
      openAIKey: openAIKey ?? this.openAIKey,
      localUrl: localUrl ?? this.localUrl,
      query: query ?? this.query,
      response: response ?? this.response,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        clientType,
        openAIKey,
        localUrl,
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
  localUrlEmpty,
  queryEmpty,
}

enum ClientType {
  openAI,
  local,
}
