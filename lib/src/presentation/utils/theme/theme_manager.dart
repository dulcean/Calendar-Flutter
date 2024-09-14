import 'package:flutter/material.dart';

import '../../themes/theme_common.dart';

enum ThemeEnum { common }

extension ThemeManager on ThemeEnum {
  ThemeData get generateTheme {
    switch (this) {
      case ThemeEnum.common: return ThemeCommon.instance.themeData!;
      default: return ThemeCommon.instance.themeData!;
    }
  }
}