import 'package:flutter/material.dart';
import 'package:teknopath/utils/theme/widget_theme/text_theme.dart';

class TAppTheme {
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: const MaterialColor(
      0xFFFFDF01,
      <int, Color>{
        50: Color(0xFFFFEF80),
        100: Color(0xFFFFEC67),
        200: Color(0xFFFFE94D),
        300: Color(0xFFFFE534),
        400: Color(0xFFFFE21A),
        500: Color(0xFFFFDF01),
        600: Color(0xFFF2D60E),
        700: Color(0xFFE6CC1A),
        800: Color(0xFFD9C327),
        900: Color(0xFFCCB934),
      },
    ),
    textTheme: TTextTheme.lightTextTheme,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: const MaterialColor(
      0xFFFFDF01,
      <int, Color>{
        50: Color(0xFFFFEF80),
        100: Color(0xFFFFEC67),
        200: Color(0xFFFFE94D),
        300: Color(0xFFFFE534),
        400: Color(0xFFFFE21A),
        500: Color(0xFFFFDF01),
        600: Color(0xFFF2D60E),
        700: Color(0xFFE6CC1A),
        800: Color(0xFFD9C327),
        900: Color(0xFFCCB934),
      },
    ),
    textTheme: TTextTheme.darkTextTheme,
  );
}
