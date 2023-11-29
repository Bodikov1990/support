// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:support/core/utils/constants.dart';
import 'package:support/src/push_page/data/models/movie_model.dart';

@RoutePage()
class AllMoviesPage extends StatefulWidget {
  final List<MovieModel> movies;
  final MovieType movieType;

  const AllMoviesPage({
    Key? key,
    required this.movies,
    required this.movieType,
  }) : super(key: key);

  @override
  State<AllMoviesPage> createState() => _AllMoviesPageState();
}

class _AllMoviesPageState extends State<AllMoviesPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 5;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5, childAspectRatio: 0.7),
      itemCount: widget.movies.length,
      itemBuilder: (BuildContext context, int index) {
        var movie = widget.movies[index];
        return InkWell(
          onTap: () {
            // Действие при нажатии на постер
            // Например, переход на страницу с деталями фильма
          },
          child: Container(
            width: width,
            padding: const EdgeInsets.all(4.0),
            child: CachedNetworkImage(
              imageUrl: movie.image?.vertical ?? '',
              width: width,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                width: width,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
              ),
              errorWidget: (context, url, error) => Image.asset(
                'assets/images/fallback.png',
                width: width,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
