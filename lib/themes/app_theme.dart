import 'package:case_infobox/themes/alert.dart';
import 'package:case_infobox/themes/colors.dart';
import 'package:flutter/material.dart';

import 'buttons.dart';

class AppTheme{
  static const colors = AppColors();
  static  AppButtons buttons = AppButtons();

  const AppTheme._();

  static Type define() {
    return ThemeData;{
    }
  }
}