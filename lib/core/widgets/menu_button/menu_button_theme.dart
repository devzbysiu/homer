import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../core/theme/design_system.dart';

part 'menu_button_theme.tailor.dart';

@tailorMixin
final class MenuButtonTheme extends ThemeExtension<MenuButtonTheme>
    with _$MenuButtonThemeTailorMixin {
  @override
  final Color splashColor;

  @override
  final TextStyle textStyle;

  MenuButtonTheme({required this.splashColor, required this.textStyle});
}

MenuButtonTheme menuButtonTheme(ThemeData data) {
  final c = data.brightness == Brightness.light
      ? HomerDesign.light
      : HomerDesign.dark;
  return MenuButtonTheme(
    splashColor: c.accentContainer,
    textStyle: HomerDesign.typography.headlineMedium.copyWith(
      color: c.textPrimary,
    ),
  );
}
