import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';

import './network.dart' as network;
import './repositories.dart' as repositories;

final getIt = GetIt.instance;

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  repositories.init();
  network.init();
}
