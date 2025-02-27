// ignore_for_file: avoid_web_libraries_in_flutter, public_member_api_docs
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_community/langchain_community.dart';
import 'package:langchain_openai/langchain_openai.dart';

import '../../chrome/chrome_api.dart';
import '../../settings/settings_repository.dart';

part 'pop_up_screen_state.dart';

class PopUpScreenCubit extends Cubit<PopUpScreenState> {
  PopUpScreenCubit({
    required this.settingsRepository,
  }) : super(const PopUpScreenState()) {
    _init();
  }

  final SettingsRepository settingsRepository;

  void _init() {
    final openAIKey = settingsRepository.getOpenAiKey();
    emit(
      state.copyWith(
        status: openAIKey == null
            ? PopUpScreenStatus.setUp
            : PopUpScreenStatus.idle,
        openAiKey: openAIKey,
      ),
    );
  }

  void onOpenAiKeyChanged(final String openAIKey) {
    emit(state.copyWith(openAiKey: openAIKey));
  }

  Future<void> onSaveOpenAiKeyPressed() async {
    final openAIKey = state.openAiKey;
    if (openAIKey == null) {
      return;
    }

    await settingsRepository.saveOpenAiKey(openAIKey);
    emit(state.copyWith(status: PopUpScreenStatus.idle));
  }

  Future<void> onSummarizePressed() async {
    emit(state.copyWith(status: PopUpScreenStatus.summarizing, summary: ''));

    final docs = await _getCurrentTabContent();
    final summary = await _generateSummary(docs);

    emit(state.copyWith(status: PopUpScreenStatus.idle, summary: summary));
  }

  Future<List<Document>> _getCurrentTabContent() async {
    final tabs = await query(
      ParameterQueryTabs(active: true, lastFocusedWindow: true),
    );

    final url = tabs.first.url.trim();
    final proxyUrl = 'https://corsproxy.io/?${Uri.encodeComponent(url)}';

    final loader = WebBaseLoader([proxyUrl]);
    return loader.load();
  }

  Future<String> _generateSummary(final List<Document> docs) {
    const textSplitter = RecursiveCharacterTextSplitter(chunkSize: 5000);
    final List<Document> docsChunks = textSplitter.splitDocuments(docs);

    final openAIKey = state.openAiKey;
    final llm = ChatOpenAI(apiKey: openAIKey);

    final summarizeChain = SummarizeChain.mapReduce(
      llm: llm,
      mapPrompt: PromptTemplate.fromTemplate('''
Write a concise summary of the following text. 
Avoid unnecessary info. Write at 5th-grade level.

"{context}"

CONCISE SUMMARY:'''),
      combinePrompt: PromptTemplate.fromTemplate('''
Summarize the following text in bullet points using markdown.
Write a maximum of 5 bullet points.

"{context}"

BULLET POINT SUMMARY:'''),
    );
    return summarizeChain.run(docsChunks);
  }
}
