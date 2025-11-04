import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../../core/theme/design_system.dart';

part 'stats_screen_theme.tailor.dart';

@tailorMixin
final class StatsScreenTheme extends ThemeExtension<StatsScreenTheme>
    with _$StatsScreenThemeTailorMixin {
  @override
  final Color gradientStart;

  @override
  final Color gradientEnd;

  @override
  final double sectionSpacing;

  StatsScreenTheme({
    required this.gradientStart,
    required this.gradientEnd,
    required this.sectionSpacing,
  });
}

StatsScreenTheme statsScreenTheme(ThemeData data) {
  final c = data.brightness == Brightness.light
      ? HomerDesign.light
      : HomerDesign.dark;
  return StatsScreenTheme(
    gradientStart: c.accentContainer,
    gradientEnd: c.accentContainerLight,
    sectionSpacing: 50.0,
  );
}
