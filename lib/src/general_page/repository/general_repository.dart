import 'package:support/core/utils/typedef.dart';
import 'package:support/src/general_page/data/models/city_model.dart';

abstract class GeneralRepository {
  ResultFuture<List<CityModel>> getCities();
}
