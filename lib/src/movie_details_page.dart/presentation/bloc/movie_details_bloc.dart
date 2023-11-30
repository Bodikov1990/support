import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:support/core/utils/constants.dart';
import 'package:support/src/general_page/data/models/city_model.dart';
import 'package:support/src/movie_details_page.dart/data/models/notification_action_btn_model.dart';
import 'package:support/src/movie_details_page.dart/data/models/notification_body_model.dart';
import 'package:support/src/movie_details_page.dart/data/models/notification_content_model.dart';
import 'package:support/src/movie_details_page.dart/data/models/notification_data_model.dart';
import 'package:support/src/movie_details_page.dart/data/models/notification_model.dart';
import 'package:support/src/movie_details_page.dart/data/models/notification_payload_model.dart';
import 'package:support/src/movie_details_page.dart/domain/usecases/send_notification_usecase.dart';
import 'package:support/src/push_page/data/models/movie_model.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final SendNotificationUseCase _sendNotificationUseCase =
      SendNotificationUseCase();
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
    String toTopics = '/topics/${event.city.id}';
    String title =
        event.title.isEmpty ? event.movieModel.name ?? '' : event.title;
    String bodyText = event.bodyText.isEmpty
        ? event.movieModel.description ?? ''
        : event.bodyText;

    final notificationBody =
        NotificationBodyModel(title: title, body: bodyText);
    final notificationContentModel = _createNotificationContentModel(event);
    final notificationData = NotificationDataModel(
      content: notificationContentModel,
      actionButtons: _createActionButtons(),
    );

    final notificationModel = NotificationModel(
      to: toTopics,
      priority: highPriority,
      notification: notificationBody,
      contentAvailable: true,
      mutableContent: true,
      data: notificationData,
    );

    final result = await _sendNotificationUseCase(
        SendNotificationUseCaseParams(notificationModel: notificationModel));

    result.fold(
        (failure) => emit(const MovieDetailsSendNotificationErrorState(
            title: 'Ошибка!', content: 'Уведомление не отправлено!')),
        (r) => emit(const MovieDetailsSendNotificationSuccessState(
            title: 'Успешно!', content: 'Уведомление отправлено!')));
  }

  NotificationContentModel _createNotificationContentModel(
      MovieDetailsSendNotificationEvent event) {
    return NotificationContentModel(
        id: 1,
        channelKey: movieChannel,
        notificationLayout: bigPicture,
        largeIcon: event.movieModel.image?.vertical,
        bigPicture: event.movieModel.image?.vertical,
        showWhen: true,
        autoDismissible: true,
        wakeUpScreen: true,
        displayOnForeground: true,
        payload: NotificationPayloadModel(
            movieId: event.movieModel.id, type: _movieType(event.movieType)));
  }

  List<NotifiationActionBtnModel> _createActionButtons() {
    return const [
      NotifiationActionBtnModel(
          key: "DISMISS",
          label: "Закрыть",
          actionType: "DismissAction",
          isDangerousOption: true,
          autoDismissible: true)
    ];
  }

  String _movieType(MovieType movieType) {
    return movieType == MovieType.TODAY
        ? 'TODAY'
        : movieType == MovieType.SOON
            ? 'SOON'
            : 'PRESALE';
  }
}
