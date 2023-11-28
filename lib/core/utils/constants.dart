// ignore_for_file: constant_identifier_names

enum MovieType {
  TODAY,
  SOON,
  PRE_SALE,
}

extension MovieTypeExtension on MovieType {
  String get apiValue {
    switch (this) {
      case MovieType.TODAY:
        return '';
      case MovieType.SOON:
        return '';
      case MovieType.PRE_SALE:
        return 'PRESALE';
      default:
        return '';
    }
  }
}

const String PARAM_CITY = "city";
const String PARAM_MOVIE = "movie";
const String PARAM_CINEMA = "object";
const String PARAM_END = "end";
const String PARAM_START = "start";
const String PARAM_RELEASE_DATE = "release_date";
const String PARAM_FORMAT = "format";
const String newMovies = "new_movies";
