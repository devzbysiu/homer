import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../core/theme/design_system.dart';

part 'book_title_theme.tailor.dart';

@tailorMixin
final class BookTitleTheme extends ThemeExtension<BookTitleTheme>
    with _$BookTitleThemeTailorMixin {
  @override
  final TextStyle titleStyle;

  @override
  final Color tagBorderColor;

  @override
  final Color titleColor;

  @override
  final double tagSize;

  @override
  final double tagBorderRadius;

  @override
  final Color tagBackgroundColor;

  @override
  final Color tagIconColor;

  @override
  final double tagIconSize;

  BookTitleTheme({
    required this.titleStyle,
    required this.tagBorderColor,
    required this.titleColor,
    required this.tagSize,
    required this.tagBorderRadius,
    required this.tagBackgroundColor,
    required this.tagIconColor,
    required this.tagIconSize,
  });
}

BookTitleTheme bookTitleTheme(ThemeData data) {
  final c = data.brightness == Brightness.light
      ? HomerDesign.light
      : HomerDesign.dark;
  return BookTitleTheme(
    titleStyle: HomerDesign.typography.bodyLarge.copyWith(color: c.textOnDark),
    tagBorderColor: c.borderAccent,
    titleColor: c.textOnDark,
    tagSize: HomerDesign.icons.m,
    tagBorderRadius: HomerDesign.radii.s,
    tagBackgroundColor: HomerCoreColors().black,
    tagIconColor: c.textOnDark,
    tagIconSize: HomerDesign.icons.xs,
  );
}
