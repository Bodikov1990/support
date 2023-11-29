import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:support/core/utils/constants.dart';
import 'package:support/core/viewmodels/theme_view_model.dart';
import 'package:support/src/all_movies_page/presentation/views/all_moves_page.dart';
import 'package:support/src/general_page/data/models/city_model.dart';
import 'package:support/src/push_page/presentation/bloc/push_bloc.dart';

@RoutePage()
class PushPage extends StatefulWidget {
  final List<CityModel> cities;
  const PushPage({super.key, required this.cities});

  @override
  State<PushPage> createState() => _PushPageState();
}

class _PushPageState extends State<PushPage> {
  final _pushBloc = PushBloc();

  CityModel? selectedCity;
  MovieType? activeMovieType;

  @override
  void initState() {
    super.initState();
    if (widget.cities.isNotEmpty) {
      selectedCity = widget.cities.first;
      activeMovieType = MovieType.TODAY;
      _pushBloc.add(PushGetMoviesEvent(
          cityId: selectedCity?.id ?? '',
          cities: widget.cities,
          movieType: MovieType.TODAY));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(58),
          child: AppBar(
            title: const Text('Push уведомления'),
            centerTitle: false,
            actions: <Widget>[
              DropdownButtonHideUnderline(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Container(
                    height: 42,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFFE3E8F2)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x0C101828),
                          blurRadius: 2,
                          offset: Offset(0, 1),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: DropdownButton<CityModel>(
                      value: selectedCity,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      onChanged: (CityModel? newValue) {
                        setState(() {
                          selectedCity = newValue;
                        });
                        _pushBloc.add(PushGetMoviesEvent(
                            cityId: selectedCity?.id ?? '',
                            cities: widget.cities,
                            movieType: activeMovieType ?? MovieType.TODAY));
                      },
                      items: widget.cities
                          .map<DropdownMenuItem<CityModel>>((CityModel value) {
                        return DropdownMenuItem<CityModel>(
                          value: value,
                          child: Text(value.name ?? ''),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                createStyledButton(
                    label: "Сегодня в кино",
                    onTap: () {
                      setState(() {
                        activeMovieType = MovieType.TODAY;
                      });
                      _pushBloc.add(PushGetMoviesEvent(
                          cityId: selectedCity?.id ?? '',
                          cities: widget.cities,
                          movieType: MovieType.TODAY));
                    },
                    isActive: activeMovieType == MovieType.TODAY),
                createStyledButton(
                    label: 'Скоро',
                    onTap: () {
                      setState(() {
                        activeMovieType = MovieType.SOON;
                      });
                      _pushBloc.add(PushGetMoviesEvent(
                          cityId: selectedCity?.id ?? '',
                          cities: widget.cities,
                          movieType: MovieType.SOON));
                    },
                    isActive: activeMovieType == MovieType.SOON),
                createStyledButton(
                    label: 'Предпродажа',
                    onTap: () {
                      setState(() {
                        activeMovieType = MovieType.PRE_SALE;
                      });
                      _pushBloc.add(PushGetMoviesEvent(
                          cityId: selectedCity?.id ?? '',
                          cities: widget.cities,
                          movieType: MovieType.PRE_SALE));
                    },
                    isActive: activeMovieType == MovieType.PRE_SALE),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            BlocBuilder<PushBloc, PushState>(
              bloc: _pushBloc,
              builder: (context, state) {
                if (state is PushGetMoviesLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is PushGetMoviesSuccesState) {
                  return Expanded(
                    child: AllMoviesPage(
                        movies: state.movies,
                        movieType: activeMovieType ?? MovieType.TODAY),
                  );
                }
                return Container();
              },
            )
          ],
        ));
  }

  Widget createStyledButton({
    required String label,
    required VoidCallback onTap,
    required bool isActive,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 40,
          width: 140,
          decoration: BoxDecoration(
            color: isActive ? ThemeViewModel().mainRed : Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(color: isActive ? Colors.white : Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
