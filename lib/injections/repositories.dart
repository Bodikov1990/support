import 'package:get_it/get_it.dart';
import 'package:support/router/auto_routes.dart';
import 'package:support/src/general_page/data/datasource/general_remote_datasource.dart';
import 'package:support/src/general_page/data/repositories/general_repository_impl.dart';
import 'package:support/src/general_page/repository/general_repository.dart';
import 'package:support/src/movie_details_page.dart/data/datasource/push_remote_datasource.dart';
import 'package:support/src/movie_details_page.dart/data/repositories/push_repository_impl.dart';
import 'package:support/src/movie_details_page.dart/repository/push_repository.dart';
import 'package:support/src/push_page/data/datasources/all_movies_remote_datasource.dart';
import 'package:support/src/push_page/data/repositories/all_movies_repository_impl.dart';
import 'package:support/src/push_page/repository/all_movies_repository.dart';
import 'package:support/src/user/data/ropsitories/user_repository_impl.dart';
import 'package:support/src/user/repository/user_repository.dart';

final getIt = GetIt.instance;

void init() {
  getIt.registerLazySingleton<AppRouter>(
    () => AppRouter(),
  );

  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());

  getIt.registerLazySingleton<GeneralRepository>(() => GeneralRepositoryImpl());
  getIt.registerLazySingleton<GeneralRemoteDataSource>(
      () => GeneralRemoteDataSourceImpl());

  getIt.registerLazySingleton<AllMoviesRepository>(
      () => AllMoviesRepositoryImpl());
  getIt.registerLazySingleton<AllMoviesRemoteDataSource>(
      () => AllMoviesRemoteDataSourceImpl());
  getIt.registerLazySingleton<PushRepository>(() => PushRepositoryImpl());
  getIt.registerLazySingleton<PushRemoteDataSource>(
      () => PushRemoteDataSourceImpl());
}
