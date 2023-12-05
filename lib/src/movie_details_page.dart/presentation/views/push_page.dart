// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:support/core/utils/constants.dart';
import 'package:support/core/viewmodels/theme_view_model.dart';
import 'package:support/src/general_page/data/models/city_model.dart';
import 'package:support/src/movie_details_page.dart/presentation/bloc/movie_details_bloc.dart';
import 'package:support/src/push_page/data/models/movie_model.dart';

@RoutePage()
class MovieDetailsPage extends StatefulWidget {
  final CityModel? city;
  final MovieModel movie;
  final MovieType movieType;
  const MovieDetailsPage({
    super.key,
    required this.city,
    required this.movie,
    required this.movieType,
  });

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  final _movieDetailsBloc = MovieDetailsBloc();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyTextController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _bodyTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _fetchDetails();
  }

  void _fetchDetails() {
    _movieDetailsBloc.add(MovieDetailsGetEvent(
        city: widget.city ??
            const CityModel(
                id: newMovies,
                name: "Все города",
                code: 'allCity',
                sortOrder: 0),
        movieModel: widget.movie,
        movieType: widget.movieType));
  }

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

  String convertMinutesToHoursAndMinutes(int? minutes) {
    if (minutes == null) {
      return 'No data';
    }

    int hours = minutes ~/ 60;
    int remainingMinutes = minutes % 60;
    return '$hours час${hours != 1 ? 'а' : ''} $remainingMinutes минут';
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 7;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Push уведомления • ${_movieType(widget.movieType)} • ${widget.city?.name}"),
      ),
      body: BlocListener<MovieDetailsBloc, MovieDetailsState>(
        bloc: _movieDetailsBloc,
        listener: (context, state) {
          if (state is MovieDetailsSendNotificationErrorState) {
            _fetchDetails();
            _showAlert(
                context: context, title: state.title, content: state.content);
          } else if (state is MovieDetailsSendNotificationSuccessState) {
            _fetchDetails();
            _showAlert(
                context: context, title: state.title, content: state.content);
          }
        },
        child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          bloc: _movieDetailsBloc,
          builder: (context, state) {
            if (state is MovieDetailsGetState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MovieDetailsGetSuccessState) {
              return _buildPageContent(state, width, context);
            } else if (state is MovieDetailsGetErrorState) {
              return _buildErrorContent();
            }
            return Container();
          },
        ),
      ),
    );
  }

  Center _buildErrorContent() {
    return Center(
      child: Container(
        width: 600,
        height: 300,
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
        child: const Text('Что то пошло не так!'),
      ),
    );
  }

  Padding _buildPageContent(
      MovieDetailsGetSuccessState state, double width, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left side: Poster
          _buildPoster(state, width),

          // Middle: Movie details
          Expanded(
            child: _buildMovieDetails(state),
          ),

          // Right side: TextFields and Buttons
          _buildInteractionArea(context, state),
        ],
      ),
    );
  }

  Column _buildInteractionArea(
      BuildContext context, MovieDetailsGetSuccessState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            _buildTitleTextField(),
            const SizedBox(height: 16),
            _buildBodyTextField(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildCancelButton(context),
            const SizedBox(width: 8),
            _buildSendButton(state),
          ],
        ),
      ],
    );
  }

  Container _buildSendButton(MovieDetailsGetSuccessState state) {
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            const Icon(
              Icons.notifications_none_outlined,
              color: Colors.white,
            ),
            TextButton(
                onPressed: () {
                  String title = _titleController.text;
                  String bodyText = _bodyTextController.text;
                  _movieDetailsBloc.add(MovieDetailsSendNotificationEvent(
                      city: state.city,
                      movieModel: state.movieModel,
                      movieType: state.movieType,
                      title: title,
                      bodyText: bodyText));
                },
                child: const Text(
                  'Отправить уведомление',
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }

  Container _buildCancelButton(BuildContext context) {
    return Container(
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
          child: const Text('Отмена', style: TextStyle(color: Colors.black))),
    );
  }

  SizedBox _buildBodyTextField() {
    return SizedBox(
      width: 400,
      height: 400,
      child: TextField(
        controller: _bodyTextController,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.top,
        maxLines: null,
        decoration: const InputDecoration(
          labelText: 'Свой текст',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  SizedBox _buildTitleTextField() {
    return SizedBox(
      width: 400,
      height: 40,
      child: TextField(
        controller: _titleController,
        decoration: const InputDecoration(
          labelText: 'Свой заголовок',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Padding _buildMovieDetails(MovieDetailsGetSuccessState state) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              state.movieModel.name ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 8),
            Text(
              state.movieModel.genre(),
              style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              "Режиссер: \n${state.movieModel.director()}",
              style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 600,
              child: Text(
                "В главных ролях: \n${state.movieModel.actor()}",
                style:
                    const TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Продолжительность: \n${state.movieModel.duration} минут (${convertMinutesToHoursAndMinutes(state.movieModel.duration)})",
              style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              "Дата релиза: \n${DateFormat(
                'dd.MM.yyyy',
              ).format(state.movieModel.startTimeFromSource)}",
              style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 600,
              child: Text(
                "Описание: \n${state.movieModel.description}",
                style:
                    const TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ClipRRect _buildPoster(MovieDetailsGetSuccessState state, double width) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: CachedNetworkImage(
        imageUrl: state.movieModel.image?.vertical ?? '',
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
    );
  }

  _showAlert({required BuildContext context, String? title, String? content}) {
    final content0 = content ?? '';
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: title != null
            ? Text(title, style: const TextStyle(fontWeight: FontWeight.w600))
            : null,
        content: Text(content0),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Ок',
              style: TextStyle(color: ThemeViewModel().mainRed),
            ),
          ),
        ],
      ),
    );
  }
}
