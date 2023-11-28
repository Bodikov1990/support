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
    Key? key,
    required this.label,
    required this.destination,
    required this.icon,
    required this.isActive,
    required this.onSelected,
  }) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        Container(
          width: 200,
          decoration: const BoxDecoration(color: Color(0xFF222834)),
          child: Column(children: [
            Container(
              width: double.infinity,
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
                destination: const NumberSearchRoute(),
                isActive: activeRoute is NumberSearchRoute,
                onSelected: setActiveRoute),
            BlocBuilder<GeneralBloc, GeneralState>(
              bloc: _generalBloc,
              builder: (context, state) {
                if (state is GeneralGetCitiesLoadedState) {
                  return NavLink(
                      icon: Icons.notifications_none_outlined,
                      label: 'Push уведомления',
                      destination: PushRoute(cities: state.cities),
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
