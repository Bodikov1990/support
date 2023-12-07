// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:support/injections/di.dart' as di;
import 'package:support/core/utils/i18n.dart';

import 'package:support/router/auto_routes.dart';

final supportedLocales = [
  const Locale('kk', 'KZ'),
  const Locale('ru', 'RU'),
  const Locale('uk', 'UK'),
  const Locale('en', ''),
];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const RestartWidget(
      child: SupportApp(),
    ),
  );
}

class SupportApp extends StatefulWidget {
  const SupportApp({super.key});

  @override
  State<SupportApp> createState() => _SupportAppState();
}

class _SupportAppState extends State<SupportApp> {
  final _appRouter = GetIt.instance<AppRouter>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MaterialApp.router(
        title: 'Tessera',
        supportedLocales: supportedLocales,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        routerConfig: _appRouter.config(),
        locale: const Locale('ru', ''),
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[200],
          fontFamily: "Open Sans",
          // primaryColor: Colors.grey[200],
          // canvasColor: ThemeViewModel().canvasColor,
          // primarySwatch: ThemeViewModel().mainRed,
          // appBarTheme: ThemeViewModel().appBarTheme,
          // textTheme: ThemeViewModel().textTheme,
          // bottomNavigationBarTheme: BottomNavigationBarThemeData(
          //     backgroundColor: ThemeViewModel().bottomBarBackgroundColor,
          //     selectedItemColor: ThemeViewModel().accentColor,
          //     unselectedItemColor: ThemeViewModel().grayColor),
          buttonTheme: const ButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
        ),
      );
    });
  }
}

class RestartWidget extends StatefulWidget {
  const RestartWidget({super.key, required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadEnv();
  }

  Future<bool> _loadEnv() async {
    await di.init();
    setState(() {
      loading = false;
    });
    return true;
  }

  void restartApp() async {
    await GetIt.instance.reset();
    await _loadEnv();
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: loading ? Container() : widget.child,
    );
  }
}
