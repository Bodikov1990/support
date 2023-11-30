// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:support/core/utils/constants.dart';
import 'package:support/router/auto_routes.dart';
import 'package:support/src/general_page/data/models/city_model.dart';
import 'package:support/src/push_page/data/models/movie_model.dart';

@RoutePage()
class AllMoviesPage extends StatefulWidget {
  final CityModel? city;
  final List<MovieModel> movies;
  final MovieType movieType;

  const AllMoviesPage({
    super.key,
    required this.city,
    required this.movies,
    required this.movieType,
  });

  @override
  State<AllMoviesPage> createState() => _AllMoviesPageState();
}

class _AllMoviesPageState extends State<AllMoviesPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 6;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6, childAspectRatio: 0.7),
        itemCount: widget.movies.length,
        itemBuilder: (BuildContext context, int index) {
          var movie = widget.movies[index];
          return InkWell(
            onTap: () {
              AutoRouter.of(context).push(MovieDetailsRoute(
                  city: widget.city,
                  movie: movie,
                  movieType: widget.movieType));
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: CachedNetworkImage(
                        imageUrl: movie.image?.vertical ?? '',
                        width: width,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          width: width,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            color: Colors.grey,
                          ),
                        ),
                        errorWidget: (context, url, error) {
                          debugPrint(
                              'Ошибка при загрузке изображения: $error  ${movie.image?.vertical ?? 'oops'}');
                          return Image.asset(
                            'assets/images/fallback.png',
                            width: width,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    movie.name ?? 'Название фильма', // Название фильма
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight:
                            FontWeight.bold), // Мелкий шрифт для названия
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
