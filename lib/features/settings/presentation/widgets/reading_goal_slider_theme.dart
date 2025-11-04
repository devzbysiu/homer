import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../../core/theme/design_system.dart';

part 'reading_goal_slider_theme.tailor.dart';

@tailorMixin
final class ReadingGoalSliderTheme
    extends ThemeExtension<ReadingGoalSliderTheme>
    with _$ReadingGoalSliderThemeTailorMixin {
  @override
  final TextStyle headerStyle;

  @override
  final double contentPaddingTop;

  @override
  final double contentPaddingLeft;

  @override
  final double contentPaddingRight;

  @override
  final double titleLeftPadding;

  @override
  final double sliderTopPadding;

  ReadingGoalSliderTheme({
    required this.headerStyle,
    required this.contentPaddingTop,
    required this.contentPaddingLeft,
    required this.contentPaddingRight,
    required this.titleLeftPadding,
    required this.sliderTopPadding,
  });
}

ReadingGoalSliderTheme readingGoalSliderTheme(ThemeData data) {
  final c = data.brightness == Brightness.light
      ? HomerDesign.light
      : HomerDesign.dark;
  return ReadingGoalSliderTheme(
    headerStyle: HomerDesign.typography.headlineSmall.copyWith(
      color: c.textPrimary,
    ),
    contentPaddingTop: HomerDesign.spacing.s + HomerDesign.spacing.xxs, // 10.0
    contentPaddingLeft: 23.0,
    contentPaddingRight: 25.0,
    titleLeftPadding: HomerDesign.spacing.s,
    sliderTopPadding: 13.0,
  );
}
