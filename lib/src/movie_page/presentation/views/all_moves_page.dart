// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:support/core/utils/constants.dart';
import 'package:support/src/push_page/data/models/movie_model.dart';

@RoutePage()
class AllMoviesPage extends StatefulWidget {
  final List<MovieModel>? movies;
  final MovieType? movieType;
  const AllMoviesPage({
    Key? key,
    this.movies,
    this.movieType,
  }) : super(key: key);

  @override
  State<AllMoviesPage> createState() => _AllMoviesPageState();
}

class _AllMoviesPageState extends State<AllMoviesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('${widget.movies?.length}'),
      ),
    );
  }
}
