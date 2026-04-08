import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../../core/theme/design_system.dart';

part 'books_per_month_theme.tailor.dart';

@tailorMixin
final class BooksPerMonthTheme extends ThemeExtension<BooksPerMonthTheme>
    with _$BooksPerMonthThemeTailorMixin {
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
  final Color goalLineColor;

  @override
  final TextStyle goalLabelStyle;

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
  final double bottomAxisLabelAngle;

  @override
  final double bottomAxisLabelRightPadding;

  @override
  final double leftAxisReservedSize;

  @override
  final double goalLineStrokeWidth;

  @override
  final int goalLineDashLength;

  @override
  final int goalLineDashGap;

  @override
  final double goalLabelRightPadding;

  BooksPerMonthTheme({
    required this.chartColor,
    required this.chartColorLight,
    required this.fillColor,
    required this.fillColorFaded,
    required this.tooltipBgColor,
    required this.tooltipStyle,
    required this.axisLabelStyle,
    required this.goalLineColor,
    required this.goalLabelStyle,
    required this.headlineStyle,
    required this.chartBackgroundColor,
    required this.lineWidth,
    required this.dotRadius,
    required this.dotStrokeWidth,
    required this.tooltipHorizontalPadding,
    required this.tooltipVerticalPadding,
    required this.bottomAxisReservedSize,
    required this.bottomAxisLabelAngle,
    required this.bottomAxisLabelRightPadding,
    required this.leftAxisReservedSize,
    required this.goalLineStrokeWidth,
    required this.goalLineDashLength,
    required this.goalLineDashGap,
    required this.goalLabelRightPadding,
  });
}

BooksPerMonthTheme booksPerMonthTheme(ThemeData data) {
  final c = data.brightness == Brightness.light
      ? HomerDesign.light
      : HomerDesign.dark;
  return BooksPerMonthTheme(
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
    goalLineColor: c.chartGoal,
    goalLabelStyle: HomerDesign.typography.bodyMedium.copyWith(
      color: c.chartGoal,
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
    bottomAxisLabelAngle: -0.7,
    bottomAxisLabelRightPadding: HomerDesign.spacing.s,
    leftAxisReservedSize: 42.0,
    goalLineStrokeWidth: 1.0,
    goalLineDashLength: 10,
    goalLineDashGap: 4,
    goalLabelRightPadding: HomerDesign.spacing.s,
  );
}
