import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../../core/theme/design_system.dart';

part 'splash_screen_theme.tailor.dart';

@tailorMixin
final class SplashScreenTheme extends ThemeExtension<SplashScreenTheme>
    with _$SplashScreenThemeTailorMixin {
  @override
  final Color backgroundColor;

  SplashScreenTheme({required this.backgroundColor});
}

SplashScreenTheme splashScreenTheme(ThemeData data) {
  final c = data.brightness == Brightness.light
      ? HomerDesign.light
      : HomerDesign.dark;
  return SplashScreenTheme(backgroundColor: c.accentContainer);
}
