import 'package:flutter/material.dart';
import 'package:support/core/viewmodels/base.dart';

class ThemeViewModel extends BaseViewModel {
  bool dark = false;

  Image get appBarLogo {
    return Image.asset(
      dark
          ? 'assets/images/app_bar_logo_dark.png'
          : 'assets/images/app_bar_logo_light.png',
      height: 35,
    );
  }

  Color get cinemaSpinnerBackgroundColor {
    return dark
        ? const Color(0xFF8C8D93)
        : const Color.fromARGB(255, 243, 23, 23);
  }

  Color get textColor {
    return dark ? Colors.black : Colors.white;
  }

  Color get textColorSoft {
    return dark ? Colors.white : const Color(0xFF2C2C2C);
  }

  Color get primaryColor {
    return dark ? const Color(0xFF191B27) : mainRed;
  }

  Color? get canvasColor {
    return dark ? const Color(0xFF191B27) : Colors.grey[200];
  }

  Color get grayColor {
    return dark
        ? const Color(0xFF8C8D93)
        : const Color.fromARGB(255, 163, 163, 164);
  }

  MaterialColor get primarySwatch {
    return dark ? mainRed : mainRed;
  }

  Color get accentColor {
    return dark ? mainRed : mainRed;
  }

  Brightness get brightness {
    return dark ? Brightness.dark : Brightness.light;
  }

  AppBarTheme get appBarTheme {
    return const AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Color(0xFF222834),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 4,
    );
  }

  TextTheme get textTheme {
    return const TextTheme(
        // display4: dark
        //     ? TextStyle(color: Colors.white)
        //     : TextStyle(color: Colors.black),
        // display3: dark
        //     ? TextStyle(color: Colors.white)
        //     : TextStyle(color: Colors.black),
        // display2: dark
        //     ? TextStyle(color: Colors.white)
        //     : TextStyle(color: Colors.black),
        // display1: dark
        //     ? TextStyle(color: Colors.white)
        //     : TextStyle(color: Colors.black),
        // caption: dark
        //     ? TextStyle(color: Colors.white)
        //     : TextStyle(color: Colors.black),
        // body1: dark
        //     ? TextStyle(color: Colors.white)
        //     : TextStyle(color: Colors.black),
        );
  }

  Color get disabledSectionButtonColor {
    return dark ? const Color(0xFF2B2D3A) : const Color(0xFFE0E0E0);
  }

  Color get bottomBarBackgroundColor {
    return dark ? const Color(0xFF2B2D3A) : Colors.white;
  }

  Color get inputBackgroundColor {
    return dark ? const Color(0xFF2B2D3A) : const Color(0xFFE0E0E0);
  }

  Color get inputBackgroundColorLight {
    return dark ? const Color(0xFF2B2D3A) : const Color(0xFFECECEC);
  }

  MaterialColor mainYellow = const MaterialColor(0xFF808080, {
    50: Color.fromRGBO(128, 128, 128, .1),
    100: Color.fromRGBO(128, 128, 128, .2),
    200: Color.fromRGBO(128, 128, 128, .3),
    300: Color.fromRGBO(128, 128, 128, .4),
    400: Color.fromRGBO(128, 128, 128, .5),
    500: Color.fromRGBO(128, 128, 128, .6),
    600: Color.fromRGBO(128, 128, 128, .7),
    700: Color.fromRGBO(128, 128, 128, .8),
    800: Color.fromRGBO(128, 128, 128, .9),
    900: Color.fromRGBO(128, 128, 128, 1),
  });

  MaterialColor mainRed = const MaterialColor(0xFFB71C1C, {
    50: Color.fromRGBO(255, 235, 238, .1),
    100: Color.fromRGBO(255, 205, 210, .2),
    200: Color.fromRGBO(239, 154, 154, .3),
    300: Color.fromRGBO(229, 115, 115, .4),
    400: Color.fromRGBO(239, 83, 80, .5),
    500: Color.fromRGBO(244, 67, 54, .6),
    600: Color.fromRGBO(229, 57, 53, .7),
    700: Color.fromRGBO(211, 47, 47, .8),
    800: Color.fromRGBO(198, 40, 40, .9),
    900: Color.fromRGBO(183, 28, 28, 1),
  });
}
