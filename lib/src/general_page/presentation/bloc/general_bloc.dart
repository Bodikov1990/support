import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:support/core/utils/constants.dart';
import 'package:support/main.dart';
import 'package:support/settings/repositories/settings_repository.dart';
import 'package:support/src/general_page/data/models/city_model.dart';
import 'package:support/src/general_page/domain/usecases/get_cities_usecase.dart';

part 'general_event.dart';
part 'general_state.dart';

class GeneralBloc extends Bloc<GeneralEvent, GeneralState> {
  final GetCitiesUseCase _getCitiesUseCase = GetCitiesUseCase();
  final SettingsRepository _settingsRepository = SettingsRepository();
  List<CityModel> cities = [];
  GeneralBloc() : super(GeneralInitial()) {
    on<GeneralGetCitiesLoadingEvent>(_getCities);
  }

  Future<void> _getCities(
      GeneralGetCitiesLoadingEvent event, Emitter<GeneralState> emit) async {
    emit(GeneralGetCitiesLoadingState());

    final result = await _getCitiesUseCase();
    List<CityModel> citiesList = [];

    result.fold((failure) => null, (cities) => citiesList = cities);

    final env = await _settingsRepository.getEnv();
    CityModel? cityModel;

    switch (env) {
      case Environment.TEST:
        cityModel = const CityModel(
            id: testTopic, name: 'Тестовый', code: testCode, sortOrder: 0);
        break;
      case Environment.PRODUCTION:
        cityModel = const CityModel(
            id: mainTopic, name: 'Все города', code: mainCode, sortOrder: 0);
        break;
      case Environment.TEST_UA:
        cityModel = const CityModel(
            id: testTopicUkraine,
            name: 'Тест Украина',
            code: testCode,
            sortOrder: 0);
        break;
      case Environment.PRODUCTION_UA:
        cityModel = const CityModel(
            id: mainTopicUkraine,
            name: 'Украина',
            code: mainCode,
            sortOrder: 0);
        break;
      default:
        cityModel = const CityModel(
            id: testTopic, name: 'Тестовый', code: 'testCity', sortOrder: 0);
    }

    citiesList.insert(0, cityModel);

    cities = List.from(citiesList);

    emit(GeneralGetCitiesLoadedState(cities: cities));
  }
}
