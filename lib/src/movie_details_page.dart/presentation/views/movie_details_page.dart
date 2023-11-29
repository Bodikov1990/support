// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:support/core/utils/constants.dart';
import 'package:support/core/viewmodels/theme_view_model.dart';
import 'package:support/src/push_page/data/models/movie_model.dart';

@RoutePage()
class MovieDetailsPage extends StatefulWidget {
  final MovieModel movie;
  final MovieType movieType;
  const MovieDetailsPage({
    super.key,
    required this.movie,
    required this.movieType,
  });

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  String _movieType(MovieType movieType) {
    switch (movieType) {
      case MovieType.TODAY:
        return 'Сегодня в кино';
      case MovieType.SOON:
        return 'Скоро в кино';
      case MovieType.PRE_SALE:
        return 'Предпродажа';
      default:
        return 'Другое';
    }
  }

  @override
  Widget build(BuildContext context) {
    var width =
        MediaQuery.of(context).size.width / 7; // Adjust the width as needed
    return Scaffold(
      appBar: AppBar(
        title: Text("Push уведомления - ${_movieType(widget.movieType)}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left side: Poster
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: widget.movie.image?.vertical ?? '',
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
                  return Image.asset(
                    'assets/images/fallback.png',
                    width: width,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),

            // Middle: Movie details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.movie.name ?? '',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.movie.genre(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Режиссер: \n${widget.movie.director()}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "В главных ролях: \n${widget.movie.actor()}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: 600,
                        child: Text(
                          "Описание: \n${widget.movie.description}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Right side: TextFields and Buttons
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  children: [
                    SizedBox(
                      width: 400,
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Свой заголовок',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: 400,
                      height: 400,
                      child: TextField(
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.top,
                        maxLines: null,
                        decoration: InputDecoration(
                          labelText: 'Свой текст',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 140,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                      child: TextButton(
                          onPressed: () {
                            AutoRouter.of(context).pop();
                          },
                          child: const Text('Отмена',
                              style: TextStyle(color: Colors.black))),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: ThemeViewModel().mainRed,
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
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Отправить уведомление',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
