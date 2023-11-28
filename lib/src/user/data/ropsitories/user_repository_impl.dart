// ignore_for_file: constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:support/core/errors/exeptions.dart';
import 'package:support/core/errors/failure.dart';
import 'package:support/core/utils/typedef.dart';
import 'package:support/src/user/data/models/user_model.dart';
import 'package:support/src/user/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  static const String USER_KEY = "USER_KEY";
  final SharedPreferences _sharedPreferences =
      GetIt.instance<SharedPreferences>();

  @override
  void clear() {
    _sharedPreferences.remove(USER_KEY);
  }

  @override
  ResultFuture<UserModel> getUser() async {
    try {
      String? jsonString = _sharedPreferences.getString(USER_KEY);
      if (jsonString != null) {
        final user = UserModel.fromJsonString(jsonString);
        return Right(user);
      } else {
        return Right(UserModel());
      }
    } on CacheException catch (e) {
      return Left(CacheFailure.fromExeption(e));
    }
  }

  @override
  ResultVoid saveUser(UserModel user) async {
    try {
      String jsonString = user.toJsonString();
      _sharedPreferences.setString(USER_KEY, jsonString);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure.fromExeption(e));
    }
  }
}
