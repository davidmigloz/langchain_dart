import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../settings/settings_repository.dart';
import 'bloc/pop_up_screen_cubit.dart';

class PopUpScreen extends StatelessWidget {
  const PopUpScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (final _) => PopUpScreenCubit(
        settingsRepository: context.read<SettingsRepository>(),
      ),
      child: const _Scaffold(),
    );
  }
}

class _Scaffold extends StatelessWidget {
  const _Scaffold();

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: const Text('Summarizer'),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<PopUpScreenCubit, PopUpScreenState>(
      buildWhen: (final previous, final current) =>
          previous.status != current.status,
      builder: (final context, final state) {
        return switch (state.status) {
          PopUpScreenStatus.loading => const _LoadingBody(),
          PopUpScreenStatus.setUp => const _SetUpBody(),
          PopUpScreenStatus.idle => const _IdleBody(),
          PopUpScreenStatus.summarizing => const _SummarizingBody(),
        };
      },
    );
  }
}

class _LoadingBody extends StatelessWidget {
  const _LoadingBody();

  @override
  Widget build(final BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _SetUpBody extends StatelessWidget {
  const _SetUpBody();

  @override
  Widget build(final BuildContext context) {
    final cubit = context.read<PopUpScreenCubit>();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.password),
              labelText: 'OpenAI API key',
              filled: true,
            ),
            obscureText: true,
            onChanged: cubit.onOpenAiKeyChanged,
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: cubit.onSaveOpenAiKeyPressed,
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

class _IdleBody extends StatelessWidget {
  const _IdleBody();

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<PopUpScreenCubit>();
    return BlocBuilder<PopUpScreenCubit, PopUpScreenState>(
      buildWhen: (final previous, final current) =>
          previous.summary != current.summary,
      builder: (final context, final state) {
        if (state.summary == null || state.summary!.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("You don't want to read this long article, do you?"),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: cubit.onSummarizePressed,
                  child: const Text('Summarize it!'),
                ),
              ],
            ),
          );
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state.summary != null) ...[
                  Text(
                    'Summary:',
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  MarkdownBody(data: cubit.state.summary ?? ''),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),
                ],
                Center(
                  child: FilledButton(
                    onPressed: cubit.onSummarizePressed,
                    child: const Text('Summarize it again!'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SummarizingBody extends StatelessWidget {
  const _SummarizingBody();

  @override
  Widget build(final BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Summarizing...'),
        ],
      ),
    );
  }
}
