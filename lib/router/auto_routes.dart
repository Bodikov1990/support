import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:support/core/utils/constants.dart';
import 'package:support/core/utils/no_animation_route.dart';
import 'package:support/src/all_movies_page/presentation/views/all_moves_page.dart';
import 'package:support/src/general_page/data/models/city_model.dart';

import 'package:support/src/general_page/presentation/views/general_page.dart';
import 'package:support/src/id_search_page/presentation/views/id_search_page.dart';
import 'package:support/src/movie_details_page.dart/presentation/views/movie_details_page.dart';

import 'package:support/src/ticket_search_page/presentation/views/ticket_search_page.dart';
import 'package:support/src/push_page/data/models/movie_model.dart';
import 'package:support/src/push_page/presentation/views/push_sending_page.dart';

part 'auto_routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: GeneralRoute.page,
          children: [
            AutoRoute(
                path: 'id_search',
                page: IdSearchRoute.page,
                type: const NoAnimationRouteType(),
                initial: true),
            AutoRoute(
                path: 'number_search',
                page: NumberSearchRoute.page,
                type: const NoAnimationRouteType()),
            AutoRoute(
                path: 'push_page',
                page: PushRoute.page,
                type: const NoAnimationRouteType(),
                children: [
                  AutoRoute(
                      page: AllMoviesRoute.page,
                      initial: true,
                      type: const NoAnimationRouteType()),
                ]),
          ],
        ),
        AutoRoute(
            page: MovieDetailsRoute.page,
            // type: const NoAnimationRouteType(),
            initial: false),
      ];
}
