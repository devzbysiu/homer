import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../../core/theme/design_system.dart';

part 'bottom_nav_bar_theme.tailor.dart';

@tailorMixin
final class BottomNavBarTheme extends ThemeExtension<BottomNavBarTheme>
    with _$BottomNavBarThemeTailorMixin {
  @override
  final Color shadowColor;

  @override
  final Color backgroundColor;

  @override
  final Color unselectedColor;

  @override
  final TextStyle labelStyle;

  @override
  final Color accentColor;

  @override
  final Color deleteColor;

  @override
  final double sheetOpenHeight;

  @override
  final double barHeight;

  @override
  final double shadowSpreadRadius;

  @override
  final double shadowBlurRadius;

  @override
  final Offset shadowOffset;

  @override
  final double barTopRightRadius;

  @override
  final double buttonPadding;

  BottomNavBarTheme({
    required this.shadowColor,
    required this.backgroundColor,
    required this.unselectedColor,
    required this.labelStyle,
    required this.accentColor,
    required this.deleteColor,
    required this.sheetOpenHeight,
    required this.barHeight,
    required this.shadowSpreadRadius,
    required this.shadowBlurRadius,
    required this.shadowOffset,
    required this.barTopRightRadius,
    required this.buttonPadding,
  });
}

BottomNavBarTheme bottomNavBarTheme(ThemeData data) {
  final c = data.brightness == Brightness.light
      ? HomerDesign.light
      : HomerDesign.dark;
  return BottomNavBarTheme(
    shadowColor: c.shadow,
    backgroundColor: c.bgSurface,
    unselectedColor: c.iconUnselected,
    labelStyle: HomerDesign.typography.bodyMedium.copyWith(
      color: c.textPrimary,
    ),
    accentColor: c.accentPrimary,
    deleteColor: c.error,
    sheetOpenHeight: 600.0,
    barHeight: 68.0,
    shadowSpreadRadius: HomerDesign.shadows.spreadRadius,
    shadowBlurRadius: HomerDesign.shadows.blurRadius,
    shadowOffset: HomerDesign.shadows.offset,
    barTopRightRadius: HomerDesign.radii.l,
    buttonPadding: HomerDesign.spacing.s + HomerDesign.spacing.xxs, // 10.0
  );
}
