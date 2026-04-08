import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../../core/theme/design_system.dart';

part 'with_saved_check_mark_theme.tailor.dart';

@tailorMixin
final class WithSavedCheckMarkTheme
    extends ThemeExtension<WithSavedCheckMarkTheme>
    with _$WithSavedCheckMarkThemeTailorMixin {
  @override
  final Color overlayColor;

  @override
  final Color iconColor;

  @override
  final double overlayWidth;

  @override
  final double overlayHeight;

  @override
  final double iconSize;

  @override
  final double iconLeftOffset;

  WithSavedCheckMarkTheme({
    required this.overlayColor,
    required this.iconColor,
    required this.overlayWidth,
    required this.overlayHeight,
    required this.iconSize,
    required this.iconLeftOffset,
  });
}

WithSavedCheckMarkTheme withSavedCheckMarkTheme(ThemeData data) {
  final c = data.brightness == Brightness.light
      ? HomerDesign.light
      : HomerDesign.dark;
  return WithSavedCheckMarkTheme(
    overlayColor: c.bgSurface,
    iconColor: c.accentPrimary,
    overlayWidth: 19.0,
    overlayHeight: 25.0,
    iconSize: HomerDesign.icons.m,
    iconLeftOffset: -3.0,
  );
}
