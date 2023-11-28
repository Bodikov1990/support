import 'package:get_it/get_it.dart';
import 'package:support/core/usecase/usecase.dart';
import 'package:support/core/utils/typedef.dart';
import 'package:support/src/general_page/data/models/city_model.dart';
import 'package:support/src/general_page/repository/general_repository.dart';

class GetCitiesUseCase extends UsecaseWithoutParams<List<CityModel>> {
  final GeneralRepository _generalRepository =
      GetIt.instance<GeneralRepository>();

  @override
  ResultFuture<List<CityModel>> call() async => _generalRepository.getCities();
}
