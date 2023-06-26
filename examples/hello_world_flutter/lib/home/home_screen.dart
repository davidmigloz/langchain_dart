import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_screen_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (final _) => HomeScreenCubit(),
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
        title: const Text('🦜️🔗 LangChain.dart'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(final BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _OpenAIKeyTextField(),
        SizedBox(height: 16),
        _QueryTextField(),
        SizedBox(height: 16),
        _SubmitButton(),
        SizedBox(height: 12),
        Divider(),
        SizedBox(height: 16),
        _Response(),
      ],
    );
  }
}

class _OpenAIKeyTextField extends StatelessWidget {
  const _OpenAIKeyTextField();

  @override
  Widget build(final BuildContext context) {
    final cubit = context.read<HomeScreenCubit>();
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      buildWhen: (final previous, final current) =>
          previous.error != current.error,
      builder: (final context, final state) {
        return TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.password),
            labelText: 'OpenAI API key',
            filled: true,
            errorText: state.error == HomeScreenError.openAIKeyEmpty
                ? 'OpenAI API key cannot be empty'
                : null,
          ),
          obscureText: true,
          onChanged: cubit.onOpenAIKeyChanged,
        );
      },
    );
  }
}

class _QueryTextField extends StatelessWidget {
  const _QueryTextField();

  @override
  Widget build(final BuildContext context) {
    final cubit = context.read<HomeScreenCubit>();
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      buildWhen: (final previous, final current) =>
          previous.error != current.error,
      builder: (final context, final state) {
        return TextField(
          decoration: InputDecoration(
            labelText: 'Enter question',
            filled: true,
            errorText: state.error == HomeScreenError.queryEmpty
                ? 'Question cannot be empty'
                : null,
          ),
          onChanged: cubit.onQueryChanged,
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(final BuildContext context) {
    final cubit = context.read<HomeScreenCubit>();
    return Center(
      child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
        builder: (final context, final state) {
          if (state.status == HomeScreenStatus.generating) {
            return const CircularProgressIndicator();
          }

          return FilledButton(
            onPressed: cubit.onSubmitPressed,
            child: const Text('Submit'),
          );
        },
      ),
    );
  }
}

class _Response extends StatelessWidget {
  const _Response();

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (final context, final state) {
        final response = state.response;
        if(response == null || response.isEmpty) {
          return const SizedBox.shrink();
        }

        final theme = Theme.of(context);
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              'Response',
              style: theme.textTheme.headlineSmall,
            ),
            Text(
              state.response ?? '',
            ),
          ],
        );
      },
    );
  }
}
