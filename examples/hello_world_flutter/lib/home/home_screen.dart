// ignore_for_file: public_member_api_docs
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'bloc/home_screen_cubit.dart';
import 'bloc/providers.dart';

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
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(final BuildContext context) {
    final cubit = context.read<HomeScreenCubit>();
    return BlocListener<HomeScreenCubit, HomeScreenState>(
      listenWhen: (final previous, final current) =>
          previous.error != current.error,
      listener: (final context, final state) {
        if (state.error == HomeScreenError.generationError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'An error occurred while generating the response',
              ),
            ),
          );
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _ProviderSelector(),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _ApiKeyTextField(cubit)),
                  const SizedBox(width: 16),
                  Expanded(child: _BaseUrlTextField(cubit)),
                ],
              ),
              const SizedBox(height: 16),
              _ModelTextField(cubit),
              const SizedBox(height: 16),
              _QueryTextField(cubit),
              const SizedBox(height: 16),
              const _SubmitButton(),
              const SizedBox(height: 12),
              const Divider(),
              const SizedBox(height: 16),
              const _Response(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProviderSelector extends StatelessWidget {
  const _ProviderSelector();

  @override
  Widget build(final BuildContext context) {
    final cubit = context.read<HomeScreenCubit>();
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      buildWhen: (final previous, final current) =>
          previous.provider != current.provider,
      builder: (final context, final state) {
        return Center(
          child: SegmentedButton<Provider>(
            segments: Provider.values
                .map(
                  (final provider) => ButtonSegment<Provider>(
                    value: provider,
                    label: Text(provider.name),
                    icon: Icon(
                      provider.isRemote
                          ? Icons.cloud_outlined
                          : Icons.install_desktop_outlined,
                    ),
                  ),
                )
                .toList(),
            selected: {state.provider},
            onSelectionChanged: (final Set<Provider> newSelection) {
              cubit.onProviderChanged(newSelection.first);
            },
          ),
        );
      },
    );
  }
}

class _ModelTextField extends _BaseTextField {
  const _ModelTextField(this.cubit);

  final HomeScreenCubit cubit;

  @override
  String get labelText => 'Model name';

  @override
  bool get obscureText => false;

  @override
  IconData get prefixIcon => Icons.link;

  @override
  HomeScreenError get errorType => HomeScreenError.modelEmpty;

  @override
  String get errorText => 'Model name cannot be empty';

  @override
  String onProviderChanged(final HomeScreenState state) =>
      state.model[state.provider] ?? state.provider.defaultModel;

  @override
  void onTextChanged(final String value) => cubit.onModelChanged(value);
}

class _ApiKeyTextField extends _BaseTextField {
  const _ApiKeyTextField(this.cubit);

  final HomeScreenCubit cubit;

  @override
  String get labelText => 'API key';

  @override
  bool get obscureText => true;

  @override
  IconData get prefixIcon => Icons.password;

  @override
  HomeScreenError get errorType => HomeScreenError.apiKeyEmpty;

  @override
  String get errorText => 'Api API key cannot be empty';

  @override
  String onProviderChanged(final HomeScreenState state) =>
      state.apiKey[state.provider] ?? '';

  @override
  void onTextChanged(final String value) => cubit.onApiKeyChanged(value);
}

class _BaseUrlTextField extends _BaseTextField {
  const _BaseUrlTextField(this.cubit);

  final HomeScreenCubit cubit;

  @override
  String get labelText => 'Base URL';

  @override
  bool get obscureText => false;

  @override
  IconData get prefixIcon => Icons.language;

  @override
  HomeScreenError get errorType => HomeScreenError.baseUrlEmpty;

  @override
  String get errorText => 'Base URL cannot be empty';

  @override
  String onProviderChanged(final HomeScreenState state) =>
      state.baseUrl[state.provider] ?? state.provider.defaultBaseUrl;

  @override
  void onTextChanged(final String value) => cubit.onBaseUrlChanged(value);
}

class _QueryTextField extends _BaseTextField {
  const _QueryTextField(this.cubit);

  final HomeScreenCubit cubit;

  @override
  String get labelText => 'Enter question';

  @override
  bool get obscureText => false;

  @override
  IconData get prefixIcon => Icons.question_answer;

  @override
  HomeScreenError get errorType => HomeScreenError.queryEmpty;

  @override
  String get errorText => 'Question cannot be empty';

  @override
  String onProviderChanged(final HomeScreenState state) => '';

  @override
  void onTextChanged(final String value) => cubit.onQueryChanged(value);
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
        if (response.isEmpty) {
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
            Markdown(
              data: state.response,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
            ),
          ],
        );
      },
    );
  }
}

abstract class _BaseTextField extends StatefulWidget {
  const _BaseTextField();

  String get labelText;

  bool get obscureText;

  IconData get prefixIcon;

  HomeScreenError get errorType;

  String get errorText;

  String onProviderChanged(final HomeScreenState state);

  void onTextChanged(final String value);

  @override
  _BaseTextFieldState createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<_BaseTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      buildWhen: (previous, current) =>
          previous.provider != current.provider ||
          previous.error != current.error,
      builder: (context, state) {
        _controller.text = widget.onProviderChanged(state);
        return TextField(
          controller: _controller,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            prefixIcon: Icon(widget.prefixIcon),
            labelText: widget.labelText,
            filled: true,
            errorText: state.error == widget.errorType
                ? widget.errorText
                : null,
          ),
          onChanged: widget.onTextChanged,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
