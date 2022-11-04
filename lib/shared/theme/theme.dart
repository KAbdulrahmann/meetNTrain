import 'package:flutter/material.dart';
import 'package:meet_n_train/shared/colors.dart';

class MeetNTrainTheme {
  static ThemeData get light {
    return ThemeData(
      primaryColor: mainColor,
      appBarTheme: const AppBarTheme(
        color: Colors.white70,
      ),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: const Color(0xFF13B9FF),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      toggleableActiveColor: const Color(0xFF13B9FF),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      primaryColor: mainColor,
      appBarTheme: const AppBarTheme(
        color: Colors.black54,
      ),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        accentColor: const Color(0xFF13B9FF),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      toggleableActiveColor: const Color(0xFF13B9FF),
    );
  }

  ThemeData theme() {
    return ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
          bodyText1: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
          bodyText2: TextStyle(color: Colors.black12, fontFamily: 'Poppins'),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
        ));
  }
}
