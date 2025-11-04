import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../../core/theme/design_system.dart';

part 'books_per_year_theme.tailor.dart';

@tailorMixin
final class BooksPerYearTheme extends ThemeExtension<BooksPerYearTheme>
    with _$BooksPerYearThemeTailorMixin {
  @override
  final Color chartColor;

  @override
  final Color chartColorLight;

  @override
  final Color fillColor;

  @override
  final Color fillColorFaded;

  @override
  final Color tooltipBgColor;

  @override
  final TextStyle tooltipStyle;

  @override
  final TextStyle axisLabelStyle;

  @override
  final TextStyle headlineStyle;

  @override
  final Color chartBackgroundColor;

  @override
  final double lineWidth;

  @override
  final double dotRadius;

  @override
  final double dotStrokeWidth;

  @override
  final double tooltipHorizontalPadding;

  @override
  final double tooltipVerticalPadding;

  @override
  final double bottomAxisReservedSize;

  @override
  final double leftAxisReservedSize;

  BooksPerYearTheme({
    required this.chartColor,
    required this.chartColorLight,
    required this.fillColor,
    required this.fillColorFaded,
    required this.tooltipBgColor,
    required this.tooltipStyle,
    required this.axisLabelStyle,
    required this.headlineStyle,
    required this.chartBackgroundColor,
    required this.lineWidth,
    required this.dotRadius,
    required this.dotStrokeWidth,
    required this.tooltipHorizontalPadding,
    required this.tooltipVerticalPadding,
    required this.bottomAxisReservedSize,
    required this.leftAxisReservedSize,
  });
}

BooksPerYearTheme booksPerYearTheme(ThemeData data) {
  final c = data.brightness == Brightness.light
      ? HomerDesign.light
      : HomerDesign.dark;
  return BooksPerYearTheme(
    chartColor: c.chartPrimary,
    chartColorLight: c.chartPrimaryLight,
    fillColor: c.bgSurface,
    fillColorFaded: c.bgSurface.withValues(alpha: 0.2),
    tooltipBgColor: c.chartTooltipBg,
    tooltipStyle: HomerDesign.typography.bodyMedium.copyWith(
      color: c.textOnAccent,
    ),
    axisLabelStyle: HomerDesign.typography.bodySmall.copyWith(
      color: c.textPrimary,
    ),
    headlineStyle: HomerDesign.typography.headlineSmall.copyWith(
      color: c.textPrimary,
    ),
    chartBackgroundColor: c.chartSurface,
    lineWidth: 2.0,
    dotRadius: 3.0,
    dotStrokeWidth: 2.0,
    tooltipHorizontalPadding:
        HomerDesign.spacing.s + HomerDesign.spacing.xxs, // 10.0
    tooltipVerticalPadding: HomerDesign.spacing.xs,
    bottomAxisReservedSize: 30.0,
    leftAxisReservedSize: 42.0,
  );
}
