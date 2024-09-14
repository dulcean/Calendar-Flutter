import 'package:flutter/material.dart';

import 'utils/theme/theme_manager.dart';

abstract class ThemeManager {
  late ThemeData currentTheme;
  late ThemeEnum currentThemeEnum;

  void changeTheme(ThemeEnum theme);
}
