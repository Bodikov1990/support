// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get_it/get_it.dart';
import 'package:support/core/usecase/usecase.dart';
import 'package:support/core/utils/typedef.dart';
import 'package:support/src/user/data/models/user_model.dart';
import 'package:support/src/user/repository/user_repository.dart';

class SaveUserUseCase extends UsecaseWithParams<void, SaveUserUseCaseParams> {
  final UserRepository _repository = GetIt.instance<UserRepository>();

  @override
  ResultFuture<void> call(SaveUserUseCaseParams params) async =>
      _repository.saveUser(params.user);
}

class SaveUserUseCaseParams {
  final UserModel user;
  const SaveUserUseCaseParams({
    required this.user,
  });
}
