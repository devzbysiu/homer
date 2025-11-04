import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../../core/theme/design_system.dart';

part 'other_stats_theme.tailor.dart';

@tailorMixin
final class OtherStatsTheme extends ThemeExtension<OtherStatsTheme>
    with _$OtherStatsThemeTailorMixin {
  @override
  final TextStyle headlineStyle;

  @override
  final TextStyle valueStyle;

  @override
  final TextStyle labelStyle;

  @override
  final double valueFontSize;

  OtherStatsTheme({
    required this.headlineStyle,
    required this.valueStyle,
    required this.labelStyle,
    required this.valueFontSize,
  });
}

OtherStatsTheme otherStatsTheme(ThemeData data) {
  final c = data.brightness == Brightness.light
      ? HomerDesign.light
      : HomerDesign.dark;
  return OtherStatsTheme(
    headlineStyle: HomerDesign.typography.headlineSmall.copyWith(
      color: c.textPrimary,
    ),
    valueStyle: HomerDesign.typography.bodyLarge.copyWith(color: c.textPrimary),
    labelStyle: HomerDesign.typography.bodyMedium.copyWith(
      color: c.textPrimary,
    ),
    valueFontSize: HomerDesign.typography.fontSizeStatValue,
  );
}
