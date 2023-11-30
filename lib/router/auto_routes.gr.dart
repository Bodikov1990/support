// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'auto_routes.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AllMoviesRoute.name: (routeData) {
      final args = routeData.argsAs<AllMoviesRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AllMoviesPage(
          key: args.key,
          city: args.city,
          movies: args.movies,
          movieType: args.movieType,
        ),
      );
    },
    GeneralRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GeneralPage(),
      );
    },
    IdSearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const IdSearchPage(),
      );
    },
    MovieDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MovieDetailsPage(
          key: args.key,
          city: args.city,
          movie: args.movie,
          movieType: args.movieType,
        ),
      );
    },
    NumberSearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NumberSearchPage(),
      );
    },
    PushRoute.name: (routeData) {
      final args = routeData.argsAs<PushRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PushPage(
          key: args.key,
          cities: args.cities,
        ),
      );
    },
  };
}

/// generated route for
/// [AllMoviesPage]
class AllMoviesRoute extends PageRouteInfo<AllMoviesRouteArgs> {
  AllMoviesRoute({
    Key? key,
    required CityModel? city,
    required List<MovieModel> movies,
    required MovieType movieType,
    List<PageRouteInfo>? children,
  }) : super(
          AllMoviesRoute.name,
          args: AllMoviesRouteArgs(
            key: key,
            city: city,
            movies: movies,
            movieType: movieType,
          ),
          initialChildren: children,
        );

  static const String name = 'AllMoviesRoute';

  static const PageInfo<AllMoviesRouteArgs> page =
      PageInfo<AllMoviesRouteArgs>(name);
}

class AllMoviesRouteArgs {
  const AllMoviesRouteArgs({
    this.key,
    required this.city,
    required this.movies,
    required this.movieType,
  });

  final Key? key;

  final CityModel? city;

  final List<MovieModel> movies;

  final MovieType movieType;

  @override
  String toString() {
    return 'AllMoviesRouteArgs{key: $key, city: $city, movies: $movies, movieType: $movieType}';
  }
}

/// generated route for
/// [GeneralPage]
class GeneralRoute extends PageRouteInfo<void> {
  const GeneralRoute({List<PageRouteInfo>? children})
      : super(
          GeneralRoute.name,
          initialChildren: children,
        );

  static const String name = 'GeneralRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [IdSearchPage]
class IdSearchRoute extends PageRouteInfo<void> {
  const IdSearchRoute({List<PageRouteInfo>? children})
      : super(
          IdSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'IdSearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MovieDetailsPage]
class MovieDetailsRoute extends PageRouteInfo<MovieDetailsRouteArgs> {
  MovieDetailsRoute({
    Key? key,
    required CityModel? city,
    required MovieModel movie,
    required MovieType movieType,
    List<PageRouteInfo>? children,
  }) : super(
          MovieDetailsRoute.name,
          args: MovieDetailsRouteArgs(
            key: key,
            city: city,
            movie: movie,
            movieType: movieType,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieDetailsRoute';

  static const PageInfo<MovieDetailsRouteArgs> page =
      PageInfo<MovieDetailsRouteArgs>(name);
}

class MovieDetailsRouteArgs {
  const MovieDetailsRouteArgs({
    this.key,
    required this.city,
    required this.movie,
    required this.movieType,
  });

  final Key? key;

  final CityModel? city;

  final MovieModel movie;

  final MovieType movieType;

  @override
  String toString() {
    return 'MovieDetailsRouteArgs{key: $key, city: $city, movie: $movie, movieType: $movieType}';
  }
}

/// generated route for
/// [NumberSearchPage]
class NumberSearchRoute extends PageRouteInfo<void> {
  const NumberSearchRoute({List<PageRouteInfo>? children})
      : super(
          NumberSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'NumberSearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PushPage]
class PushRoute extends PageRouteInfo<PushRouteArgs> {
  PushRoute({
    Key? key,
    required List<CityModel> cities,
    List<PageRouteInfo>? children,
  }) : super(
          PushRoute.name,
          args: PushRouteArgs(
            key: key,
            cities: cities,
          ),
          initialChildren: children,
        );

  static const String name = 'PushRoute';

  static const PageInfo<PushRouteArgs> page = PageInfo<PushRouteArgs>(name);
}

class PushRouteArgs {
  const PushRouteArgs({
    this.key,
    required this.cities,
  });

  final Key? key;

  final List<CityModel> cities;

  @override
  String toString() {
    return 'PushRouteArgs{key: $key, cities: $cities}';
  }
}
