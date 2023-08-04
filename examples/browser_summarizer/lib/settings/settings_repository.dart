import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository {
  const SettingsRepository(final SharedPreferences sp) : _sp = sp;

  final SharedPreferences _sp;

  static const _openAiKey = 'open_ai_key';

  String? getOpenAiKey() {
    return _sp.getString(_openAiKey);
  }

  Future<void> saveOpenAiKey(final String openAiKey) async {
    await _sp.setString(_openAiKey, openAiKey);
  }
}
