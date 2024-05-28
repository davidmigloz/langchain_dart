// ignore_for_file: public_member_api_docs
part of 'home_screen_cubit.dart';

@immutable
class HomeScreenState extends Equatable {
  const HomeScreenState({
    this.status = HomeScreenStatus.idle,
    this.error,
    this.provider = Provider.ollama,
    this.model = const {},
    this.apiKey = const {},
    this.baseUrl = const {},
    this.query = '',
    this.response = '',
  });

  final HomeScreenStatus status;
  final HomeScreenError? error;
  final Provider provider;
  final Map<Provider, String> model;
  final Map<Provider, String> apiKey;
  final Map<Provider, String> baseUrl;
  final String query;
  final String response;

  HomeScreenState copyWith({
    final HomeScreenStatus? status,
    final HomeScreenError? error,
    final Provider? provider,
    final Map<Provider, String>? model,
    final Map<Provider, String>? apiKey,
    final Map<Provider, String>? baseUrl,
    final String? query,
    final String? response,
  }) {
    return HomeScreenState(
      status: status ?? this.status,
      error: error,
      provider: provider ?? this.provider,
      model: model ?? this.model,
      apiKey: apiKey ?? this.apiKey,
      baseUrl: baseUrl ?? this.baseUrl,
      query: query ?? this.query,
      response: response ?? this.response,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        provider,
        model,
        apiKey,
        baseUrl,
        query,
        response,
      ];
}

enum HomeScreenStatus {
  idle,
  generating,
}

enum HomeScreenError {
  modelEmpty,
  apiKeyEmpty,
  baseUrlEmpty,
  queryEmpty,
  generationError,
}
