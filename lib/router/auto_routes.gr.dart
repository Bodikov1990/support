// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'auto_routes.dart';

/// generated route for
/// [AllMoviesPage]
class AllMoviesRoute extends PageRouteInfo<AllMoviesRouteArgs> {
  AllMoviesRoute({
    Key? key,
    required bool isMobile,
    required CityModel? city,
    required List<MovieModel> movies,
    required MovieType movieType,
    List<PageRouteInfo>? children,
  }) : super(
          AllMoviesRoute.name,
          args: AllMoviesRouteArgs(
            key: key,
            isMobile: isMobile,
            city: city,
            movies: movies,
            movieType: movieType,
          ),
          initialChildren: children,
        );

  static const String name = 'AllMoviesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AllMoviesRouteArgs>();
      return AllMoviesPage(
        key: args.key,
        isMobile: args.isMobile,
        city: args.city,
        movies: args.movies,
        movieType: args.movieType,
      );
    },
  );
}

class AllMoviesRouteArgs {
  const AllMoviesRouteArgs({
    this.key,
    required this.isMobile,
    required this.city,
    required this.movies,
    required this.movieType,
  });

  final Key? key;

  final bool isMobile;

  final CityModel? city;

  final List<MovieModel> movies;

  final MovieType movieType;

  @override
  String toString() {
    return 'AllMoviesRouteArgs{key: $key, isMobile: $isMobile, city: $city, movies: $movies, movieType: $movieType}';
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const GeneralPage();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const IdSearchPage();
    },
  );
}

/// generated route for
/// [MovieDetailsPage]
class MovieDetailsRoute extends PageRouteInfo<MovieDetailsRouteArgs> {
  MovieDetailsRoute({
    Key? key,
    required bool isMobile,
    required CityModel? city,
    required MovieModel movie,
    required MovieType movieType,
    List<PageRouteInfo>? children,
  }) : super(
          MovieDetailsRoute.name,
          args: MovieDetailsRouteArgs(
            key: key,
            isMobile: isMobile,
            city: city,
            movie: movie,
            movieType: movieType,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MovieDetailsRouteArgs>();
      return MovieDetailsPage(
        key: args.key,
        isMobile: args.isMobile,
        city: args.city,
        movie: args.movie,
        movieType: args.movieType,
      );
    },
  );
}

class MovieDetailsRouteArgs {
  const MovieDetailsRouteArgs({
    this.key,
    required this.isMobile,
    required this.city,
    required this.movie,
    required this.movieType,
  });

  final Key? key;

  final bool isMobile;

  final CityModel? city;

  final MovieModel movie;

  final MovieType movieType;

  @override
  String toString() {
    return 'MovieDetailsRouteArgs{key: $key, isMobile: $isMobile, city: $city, movie: $movie, movieType: $movieType}';
  }
}

/// generated route for
/// [NumberSearchPage]
class NumberSearchRoute extends PageRouteInfo<NumberSearchRouteArgs> {
  NumberSearchRoute({
    Key? key,
    required bool isMobile,
    List<PageRouteInfo>? children,
  }) : super(
          NumberSearchRoute.name,
          args: NumberSearchRouteArgs(
            key: key,
            isMobile: isMobile,
          ),
          initialChildren: children,
        );

  static const String name = 'NumberSearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NumberSearchRouteArgs>();
      return NumberSearchPage(
        key: args.key,
        isMobile: args.isMobile,
      );
    },
  );
}

class NumberSearchRouteArgs {
  const NumberSearchRouteArgs({
    this.key,
    required this.isMobile,
  });

  final Key? key;

  final bool isMobile;

  @override
  String toString() {
    return 'NumberSearchRouteArgs{key: $key, isMobile: $isMobile}';
  }
}

/// generated route for
/// [PushPage]
class PushRoute extends PageRouteInfo<PushRouteArgs> {
  PushRoute({
    Key? key,
    required bool isMobile,
    required List<CityModel> cities,
    List<PageRouteInfo>? children,
  }) : super(
          PushRoute.name,
          args: PushRouteArgs(
            key: key,
            isMobile: isMobile,
            cities: cities,
          ),
          initialChildren: children,
        );

  static const String name = 'PushRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PushRouteArgs>();
      return PushPage(
        key: args.key,
        isMobile: args.isMobile,
        cities: args.cities,
      );
    },
  );
}

class PushRouteArgs {
  const PushRouteArgs({
    this.key,
    required this.isMobile,
    required this.cities,
  });

  final Key? key;

  final bool isMobile;

  final List<CityModel> cities;

  @override
  String toString() {
    return 'PushRouteArgs{key: $key, isMobile: $isMobile, cities: $cities}';
  }
}
