import 'package:support/core/utils/typedef.dart';
import 'package:support/src/user/data/models/user_model.dart';

abstract class UserRepository {
  ResultFuture<UserModel> getUser();
  ResultVoid saveUser(UserModel user);
  void clear();
}
