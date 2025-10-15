// ignore_for_file: public_member_api_docs
part of 'pop_up_screen_cubit.dart';

@immutable
class PopUpScreenState extends Equatable {
  const PopUpScreenState({
    this.status = PopUpScreenStatus.loading,
    this.openAiKey,
    this.summary,
  });

  final PopUpScreenStatus status;
  final String? openAiKey;
  final String? summary;

  PopUpScreenState copyWith({
    final PopUpScreenStatus? status,
    final String? openAiKey,
    final String? summary,
  }) {
    return PopUpScreenState(
      status: status ?? this.status,
      openAiKey: openAiKey ?? this.openAiKey,
      summary: summary ?? this.summary,
    );
  }

  @override
  List<Object?> get props => [
    status,
    openAiKey,
    summary,
  ];
}

enum PopUpScreenStatus {
  loading,
  setUp,
  idle,
  summarizing,
}
