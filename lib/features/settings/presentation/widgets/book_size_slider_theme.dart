import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../../core/theme/design_system.dart';

part 'book_size_slider_theme.tailor.dart';

@tailorMixin
final class BookSizeSliderTheme extends ThemeExtension<BookSizeSliderTheme>
    with _$BookSizeSliderThemeTailorMixin {
  @override
  final TextStyle headerStyle;

  @override
  final Color thumbColor;

  @override
  final double contentPaddingTop;

  @override
  final double contentPaddingLeft;

  @override
  final double contentPaddingRight;

  @override
  final double titleLeftPadding;

  @override
  final double activeTrackSize;

  @override
  final double inactiveTrackSize;

  @override
  final double textHeightOffset;

  @override
  final double sliderHorizontalPadding;

  @override
  final Color shortRangeColor;

  @override
  final Color mediumRangeColor;

  @override
  final Color longRangeColor;

  BookSizeSliderTheme({
    required this.headerStyle,
    required this.thumbColor,
    required this.contentPaddingTop,
    required this.contentPaddingLeft,
    required this.contentPaddingRight,
    required this.titleLeftPadding,
    required this.activeTrackSize,
    required this.inactiveTrackSize,
    required this.textHeightOffset,
    required this.sliderHorizontalPadding,
    required this.shortRangeColor,
    required this.mediumRangeColor,
    required this.longRangeColor,
  });
}

BookSizeSliderTheme bookSizeSliderTheme(ThemeData data) {
  final c = data.brightness == Brightness.light
      ? HomerDesign.light
      : HomerDesign.dark;
  return BookSizeSliderTheme(
    headerStyle: HomerDesign.typography.headlineSmall.copyWith(
      color: c.textPrimary,
    ),
    thumbColor: c.accentPrimary,
    contentPaddingTop: HomerDesign.spacing.s + HomerDesign.spacing.xxs, // 10.0
    contentPaddingLeft: 23.0,
    contentPaddingRight: 25.0,
    titleLeftPadding: HomerDesign.spacing.s,
    activeTrackSize: HomerDesign.radii.s,
    inactiveTrackSize: HomerDesign.radii.s,
    textHeightOffset: -25.0,
    sliderHorizontalPadding: 13.0,
    shortRangeColor: c.chartShortBook,
    mediumRangeColor: c.chartMediumBook,
    longRangeColor: c.chartLongBook,
  );
}
