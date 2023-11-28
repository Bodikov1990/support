import 'package:support/src/push_page/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel(
      {required super.id,
      required super.name,
      required super.genres,
      required super.code,
      required super.actors,
      required super.description,
      required super.directors});

  String genre() {
    var genre = "";
    final genres = this.genres;
    if (genres != null) {
      genres.asMap().forEach((index, item) {
        genre += index == genres.length - 1 ? item : "$item  •  ";
      });
    }
    return genre;
  }

  String actor() {
    var actor = "";
    final actors = this.actors;
    if (actors != null) {
      actors.asMap().forEach((index, item) {
        actor += index == actors.length - 1 ? item : "$item  •  ";
      });
    }
    return actor;
  }

  String director() {
    var director = "";
    final directors = this.directors;
    if (directors != null) {
      directors.asMap().forEach((index, item) {
        director += index == directors.length - 1 ? item : "$item  •  ";
      });
    }
    return director;
  }
}
