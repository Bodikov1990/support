import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:support/core/utils/constants.dart';
import 'package:support/src/general_page/data/models/city_model.dart';
import 'package:support/src/general_page/domain/usecases/get_cities_usecase.dart';

part 'general_event.dart';
part 'general_state.dart';

class GeneralBloc extends Bloc<GeneralEvent, GeneralState> {
  final GetCitiesUseCase _getCitiesUseCase = GetCitiesUseCase();
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

    const allCity = CityModel(
        id: newMovies, name: 'Все города', code: 'allCity', sortOrder: 0);

    citiesList.insert(0, allCity);

    cities = List.from(citiesList);

    emit(GeneralGetCitiesLoadedState(cities: cities));
  }
}
