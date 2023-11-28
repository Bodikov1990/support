import 'package:get_it/get_it.dart';
import 'package:support/core/usecase/usecase.dart';
import 'package:support/core/utils/typedef.dart';
import 'package:support/src/user/data/models/user_model.dart';
import 'package:support/src/user/repository/user_repository.dart';

class GetUserUseCase extends UsecaseWithoutParams {
  final UserRepository _repository = GetIt.instance<UserRepository>();

  @override
  ResultFuture<UserModel> call() async => _repository.getUser();
}
