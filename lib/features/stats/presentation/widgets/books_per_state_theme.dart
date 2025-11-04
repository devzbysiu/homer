import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../../core/theme/design_system.dart';

part 'books_per_state_theme.tailor.dart';

@tailorMixin
final class BooksPerStateTheme extends ThemeExtension<BooksPerStateTheme>
    with _$BooksPerStateThemeTailorMixin {
  @override
  final TextStyle headlineStyle;

  @override
  final Color waitingColor;

  @override
  final Color inProgressColor;

  @override
  final Color readColor;

  @override
  final TextStyle legendStyle;

  @override
  final double barWidth;

  @override
  final double legendSwatchSize;

  @override
  final double legendSwatchSpacing;

  @override
  final double legendItemSpacing;

  BooksPerStateTheme({
    required this.headlineStyle,
    required this.waitingColor,
    required this.inProgressColor,
    required this.readColor,
    required this.legendStyle,
    required this.barWidth,
    required this.legendSwatchSize,
    required this.legendSwatchSpacing,
    required this.legendItemSpacing,
  });
}

BooksPerStateTheme booksPerStateTheme(ThemeData data) {
  final c = data.brightness == Brightness.light
      ? HomerDesign.light
      : HomerDesign.dark;
  return BooksPerStateTheme(
    headlineStyle: HomerDesign.typography.headlineSmall.copyWith(
      color: c.textPrimary,
    ),
    waitingColor: c.accentPrimary,
    inProgressColor: c.accentSecondary,
    readColor: c.chartBooksRead,
    legendStyle: HomerDesign.typography.titleSmall.copyWith(
      color: c.textPrimary,
    ),
    barWidth: 30.0,
    legendSwatchSize: HomerDesign.icons.s,
    legendSwatchSpacing: 5.0,
    legendItemSpacing: HomerDesign.icons.s,
  );
}
