import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:support/core/viewmodels/theme_view_model.dart';
import 'package:support/router/auto_routes.dart';
import 'package:support/src/general_page/presentation/bloc/general_bloc.dart';

class NavLink extends StatelessWidget {
  final IconData icon;
  final String label;
  final PageRouteInfo destination;
  final bool isActive;
  final Function(PageRouteInfo) onSelected;

  const NavLink({
    super.key,
    required this.label,
    required this.destination,
    required this.icon,
    required this.isActive,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.replace(destination);
        onSelected(destination);
      },
      child: Container(
        width: double.infinity,
        color: isActive ? ThemeViewModel().mainRed : null,
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon,
                color: isActive ? Colors.white : const Color(0xFF83858A)),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                  color: isActive ? Colors.white : const Color(0xFF83858A)),
            ),
          ],
        ),
      ),
    );
  }
}

class TabLink extends StatelessWidget {
  final IconData icon;
  final String label;
  final PageRouteInfo destination;
  final bool isActive;
  final Function(PageRouteInfo) onSelected;

  const TabLink({
    super.key,
    required this.label,
    required this.destination,
    required this.icon,
    required this.isActive,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 3 - 16;
    return InkWell(
      onTap: () {
        context.router.replace(destination);
        onSelected(destination);
      },
      child: Container(
        width: width,
        color: isActive ? ThemeViewModel().mainRed : null,
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Icon(icon,
            color: isActive ? Colors.white : const Color(0xFF83858A)),
      ),
    );
  }
}

@RoutePage()
class GeneralPage extends StatefulWidget {
  const GeneralPage({super.key});

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  PageRouteInfo? activeRoute;
  final _generalBloc = GeneralBloc();

  @override
  void initState() {
    super.initState();
    activeRoute = const IdSearchRoute();
    _generalBloc.add(GeneralGetCitiesLoadingEvent());
  }

  void setActiveRoute(PageRouteInfo route) {
    setState(() {
      activeRoute = route;
    });
  }

  bool _isMobilePlatform() {
    if (Platform.isIOS || Platform.isAndroid) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    if (_isMobilePlatform()) {
      var width = MediaQuery.of(context).size.width - 16;
      return Scaffold(
        body: Column(children: [
          const Expanded(child: AutoRouter()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: width,
              decoration: const BoxDecoration(
                  color: Color(0xFF222834),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TabLink(
                        icon: Icons.search,
                        label: '',
                        destination: const IdSearchRoute(),
                        isActive: activeRoute is IdSearchRoute,
                        onSelected: setActiveRoute),
                    TabLink(
                        icon: Icons.search,
                        label: '',
                        destination:
                            NumberSearchRoute(isMobile: _isMobilePlatform()),
                        isActive: activeRoute is NumberSearchRoute,
                        onSelected: setActiveRoute),
                    BlocBuilder<GeneralBloc, GeneralState>(
                      bloc: _generalBloc,
                      builder: (context, state) {
                        if (state is GeneralGetCitiesLoadedState) {
                          return TabLink(
                              icon: Icons.notifications_none_outlined,
                              label: '',
                              destination: PushRoute(
                                  isMobile: _isMobilePlatform(),
                                  cities: state.cities),
                              isActive: activeRoute is PushRoute,
                              onSelected: setActiveRoute);
                        }
                        return Container();
                      },
                    ),
                  ]),
            ),
          ),
        ]),
      );
    } else {
      return Scaffold(
        body: Row(children: [
          Container(
            width: 200,
            decoration: const BoxDecoration(color: Color(0xFF222834)),
            child: Column(children: [
              Container(
                width: double.infinity,
                height: 56,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: SvgPicture.asset(
                  'assets/images/tessera_logo.svg',
                  height: 24,
                  width: 103,
                ),
              ),
              NavLink(
                  icon: Icons.search,
                  label: 'Поиск по ID',
                  destination: const IdSearchRoute(),
                  isActive: activeRoute is IdSearchRoute,
                  onSelected: setActiveRoute),
              NavLink(
                  icon: Icons.search,
                  label: 'Поиск по брони',
                  destination: NumberSearchRoute(isMobile: _isMobilePlatform()),
                  isActive: activeRoute is NumberSearchRoute,
                  onSelected: setActiveRoute),
              BlocBuilder<GeneralBloc, GeneralState>(
                bloc: _generalBloc,
                builder: (context, state) {
                  if (state is GeneralGetCitiesLoadedState) {
                    return NavLink(
                        icon: Icons.notifications_none_outlined,
                        label: 'Push уведомления',
                        destination: PushRoute(
                            isMobile: _isMobilePlatform(),
                            cities: state.cities),
                        isActive: activeRoute is PushRoute,
                        onSelected: setActiveRoute);
                  }
                  return Container();
                },
              ),
            ]),
          ),
          const Expanded(child: AutoRouter())
        ]),
      );
    }
  }
}
