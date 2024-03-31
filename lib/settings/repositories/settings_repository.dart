// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:support/main.dart';
import 'package:support/settings/models/settings_model.dart';

class SettingsRepository {
  static const String SETTINGS_KEY = "SETTINGS_KEY";

  Future<bool> setEnv(Environment env) async {
    await clear();
    SettingsModel settings = SettingsModel();
    settings.env = env;
    await _saveSettings(settings);
    return true;
  }

  Future<Environment?> getEnv() async {
    SettingsModel settings = await _getSettings();
    return settings.env;
  }

  Future<SettingsModel> _saveSettings(SettingsModel settings) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    try {
      String jsonString = settings.toJsonString();
      await sharedPreferences.setString(SETTINGS_KEY, jsonString);
    } catch (ignored) {
      debugPrint('ignored');
    }
    return settings;
  }

  Future<SettingsModel> _getSettings() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    SettingsModel settingsModel;
    try {
      String? jsonString = sharedPreferences.getString(SETTINGS_KEY);
      if (jsonString != null) {
        settingsModel = SettingsModel.fromJsonString(jsonString);
      } else {
        settingsModel = SettingsModel();
        settingsModel.env = DEFAULT_ENV;
      }
    } catch (ignored) {
      settingsModel = SettingsModel();
    }
    return settingsModel;
  }

  Future<bool> clear() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.clear();
  }
}
