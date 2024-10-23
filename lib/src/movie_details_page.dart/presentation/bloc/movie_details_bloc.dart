import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:support/core/utils/constants.dart';
import 'package:support/main.dart';
import 'package:support/settings/repositories/settings_repository.dart';
import 'package:support/src/general_page/data/models/city_model.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/message_entity.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/notification_data_entity.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/notification_entity.dart';
import 'package:support/src/movie_details_page.dart/domain/entities/push_notification_entity.dart';
import 'package:support/src/movie_details_page.dart/domain/usecases/send_notification_usecase.dart';
import 'package:support/src/push_page/data/models/movie_model.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final SendNotificationUseCase _sendNotificationUseCase =
      SendNotificationUseCase();
  final SettingsRepository _settingsRepository = SettingsRepository();

  MovieDetailsBloc() : super(MovieDetailsInitial()) {
    on<MovieDetailsGetEvent>(_getMovieDetailsEvent);
    on<MovieDetailsSendNotificationEvent>(_sendNotificationEvent);
  }

  Future<void> _getMovieDetailsEvent(
      MovieDetailsGetEvent event, Emitter<MovieDetailsState> emit) async {
    emit(MovieDetailsGetState());

    emit(MovieDetailsGetSuccessState(
        city: event.city,
        movieModel: event.movieModel,
        movieType: event.movieType));
  }

  Future<void> _sendNotificationEvent(MovieDetailsSendNotificationEvent event,
      Emitter<MovieDetailsState> emit) async {
    String toTopics = '${event.city.id}';
    String title =
        event.title.isEmpty ? event.movieModel.name ?? '' : event.title;
    String bodyText = event.bodyText.isEmpty
        ? event.movieModel.description ?? ''
        : event.bodyText;

    final notificationData = await _createNotificationData(event);
    final notificationContent =
        NotificationContentEntity(title: title, body: bodyText);
    final message = MessageEntity(
        topic: toTopics,
        notification: notificationContent,
        data: notificationData);

    final pushNotification = PushNotification(message: message);

    final result = await _sendNotificationUseCase(
        SendNotificationUseCaseParams(pushNotification: pushNotification));

    result.fold(
        (failure) => emit(const MovieDetailsSendNotificationErrorState(
            title: 'Ошибка!', content: 'Уведомление не отправлено!')),
        (r) => emit(const MovieDetailsSendNotificationSuccessState(
            title: 'Успешно!', content: 'Уведомление отправлено!')));
  }

  Future<NotificationDataEntity> _createNotificationData(
      MovieDetailsSendNotificationEvent event) async {
    final env = await _settingsRepository.getEnv();
    String? channel;
    switch (env) {
      case Environment.TEST:
        channel = testMoviesChannel;
        break;
      case Environment.PRODUCTION:
        channel = moviesChannel;
        break;
      case Environment.TEST_UA:
        channel = testMoviesChannelUkraine;
        break;
      case Environment.PRODUCTION_UA:
        channel = mainMoviesChannelUkraine;
        break;
      default:
        channel = testMoviesChannel;
    }
    return NotificationDataEntity(
      contentId: DateTime.now().microsecondsSinceEpoch.toString(),
      channelKey: channel,
      largeIcon: event.movieModel.image?.vertical,
      bigPicture: event.movieModel.image?.vertical,
      movieId: event.movieModel.id,
      type: _movieType(event.movieType),
    );
  }

  String _movieType(MovieType movieType) {
    return movieType == MovieType.TODAY
        ? 'TODAY'
        : movieType == MovieType.SOON
            ? 'SOON'
            : 'PRESALE';
  }
}
