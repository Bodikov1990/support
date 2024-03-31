import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:support/main.dart';
import 'package:support/settings/repositories/settings_repository.dart';
import 'package:talker_flutter/talker_flutter.dart';

import './network.dart' as network;
import './repositories.dart' as repositories;

final getIt = GetIt.instance;

Future<void> init(Environment env) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<SettingsRepository>(() => SettingsRepository());
  final talker = TalkerFlutter.init();
  getIt.registerLazySingleton<Talker>(() => talker);

  repositories.init();
  network.init(env);
}
