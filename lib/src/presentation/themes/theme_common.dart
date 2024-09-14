import 'package:calendar/src/presentation/constants/fonts/fonts.gen.dart';
import 'package:flutter/material.dart';

import '../utils/theme/application_theme.dart';

class ThemeCommon extends ApplicationTheme {
  static ThemeCommon? _instance;
  static ThemeCommon get instance {
    _instance ??= ThemeCommon._init();
    return _instance!;
  }

  ThemeCommon._init();

  @override
  ThemeData? get themeData => ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFFFF8702),
        secondaryHeaderColor: const Color(0x93FF8702),
        scaffoldBackgroundColor: const Color(0xFFFFFDFC),
        hintColor: const Color(0xFFFFFDFC),
        highlightColor: const Color(0xFFF2F2F2),
        cardColor: const Color(0xFFE1DDD8),
        canvasColor: const Color(0xFF4C4C69),
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(const Color(0xFFFF8702)),
          foregroundColor: WidgetStateProperty.all(const Color(0xFFFFFFFF)),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 118, vertical: 10),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(69),
            ),
          ),
        )),
        textTheme: const TextTheme(
            titleMedium: TextStyle(
              color: Color(0xFFBCBCBF),
              fontSize: 18,
              fontFamily: FontFamily.nunito,
              fontWeight: FontWeight.w700,
            ),
            titleSmall: TextStyle(
                color: Color(0xFF4C4C69),
                fontSize: 16,
                fontFamily: FontFamily.nunito,
                fontWeight: FontWeight.w700),
            labelSmall: TextStyle(
              color: Color(0xFFBCBCBF),
              fontFamily: FontFamily.nunito,
              fontSize: 11,
              fontWeight: FontWeight.w400,
            ),
            labelLarge: TextStyle(
              color: Colors.white,
              fontFamily: FontFamily.nunito,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            )),
      );
}
