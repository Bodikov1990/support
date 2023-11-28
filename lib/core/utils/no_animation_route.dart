import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class NoAnimationRouteType extends CustomRouteType {
  const NoAnimationRouteType()
      : super(
          transitionsBuilder: _noAnimationTransition,
          opaque: true,
          barrierDismissible: false,
        );

  static Widget _noAnimationTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
