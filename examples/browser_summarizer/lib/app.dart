import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'popup/pop_up_screen.dart';
import 'settings/settings_repository.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.settingsRepository,
  });

  final SettingsRepository settingsRepository;

  @override
  Widget build(final BuildContext context) {
    return RepositoryProvider.value(
      value: settingsRepository,
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
          useMaterial3: true,
        ),
        home: const PopUpScreen(),
      ),
    );
  }
}
