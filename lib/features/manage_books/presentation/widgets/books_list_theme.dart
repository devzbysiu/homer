import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../../core/theme/design_system.dart';

part 'books_list_theme.tailor.dart';

@tailorMixin
final class BooksListTheme extends ThemeExtension<BooksListTheme>
    with _$BooksListThemeTailorMixin {
  @override
  final TextStyle summaryTextStyle;

  @override
  final Color summaryBlurColor;

  @override
  final double summaryColorOpacity;

  @override
  final double summaryBlurAmount;

  @override
  final double summaryPadding;

  @override
  final Color cardColor;

  @override
  final double cardHorizontalPadding;

  @override
  final double cardVerticalPadding;

  @override
  final double cardBorderRadius;

  @override
  final Color swipeColor;

  @override
  final Color swipeBackgroundColor;

  @override
  final double swipeLeftIndicatorPadding;

  @override
  final double swipeRightIndicatorPadding;

  @override
  final double snackbarMessageFontSize;

  @override
  final Color deletionIconColor;

  @override
  final Color deletionOverlayColor;

  @override
  final double deletionColorOpacity;

  @override
  final double deletionBlurAmount;

  @override
  final double deletionIconSize;

  @override
  final double coverHeight;

  @override
  final double coverTagRunSpacing;

  @override
  final Color coverEndColor;

  @override
  final double tagChipBorderRadius;

  @override
  final double tagChipHorizontalPadding;

  @override
  final double tagChipVerticalPadding;

  @override
  final Color tagChipTextColor;

  BooksListTheme({
    required this.summaryTextStyle,
    required this.summaryBlurColor,
    required this.summaryColorOpacity,
    required this.summaryBlurAmount,
    required this.summaryPadding,
    required this.cardColor,
    required this.cardHorizontalPadding,
    required this.cardVerticalPadding,
    required this.cardBorderRadius,
    required this.swipeColor,
    required this.swipeBackgroundColor,
    required this.swipeLeftIndicatorPadding,
    required this.swipeRightIndicatorPadding,
    required this.snackbarMessageFontSize,
    required this.deletionIconColor,
    required this.deletionOverlayColor,
    required this.deletionColorOpacity,
    required this.deletionBlurAmount,
    required this.deletionIconSize,
    required this.coverHeight,
    required this.coverTagRunSpacing,
    required this.coverEndColor,
    required this.tagChipBorderRadius,
    required this.tagChipHorizontalPadding,
    required this.tagChipVerticalPadding,
    required this.tagChipTextColor,
  });
}

BooksListTheme booksListTheme(ThemeData data) {
  final c = data.brightness == Brightness.light
      ? HomerDesign.light
      : HomerDesign.dark;
  return BooksListTheme(
    summaryTextStyle: HomerDesign.typography.bodyLarge.copyWith(
      color: c.textPrimary,
    ),
    summaryBlurColor: c.bgSurface,
    summaryColorOpacity: 1.0,
    summaryBlurAmount: 0.0,
    summaryPadding: HomerDesign.spacing.s + HomerDesign.spacing.xxs, // 10.0
    cardColor: c.bgSecondary,
    cardHorizontalPadding:
        HomerDesign.spacing.s + HomerDesign.spacing.xxs, // 10.0
    cardVerticalPadding:
        HomerDesign.spacing.s + HomerDesign.spacing.xxs, // 10.0
    cardBorderRadius: HomerDesign.radii.m,
    swipeColor: c.accentContainer,
    swipeBackgroundColor: c.bgOverlay,
    swipeLeftIndicatorPadding: 30.0,
    swipeRightIndicatorPadding: 30.0,
    snackbarMessageFontSize: HomerDesign.typography.fontSizeSnackbar,
    deletionIconColor: c.iconPrimary,
    deletionOverlayColor: c.error,
    deletionColorOpacity: 0.8,
    deletionBlurAmount: 0.0,
    deletionIconSize: HomerDesign.icons.xl,
    coverHeight: 250.0,
    coverTagRunSpacing: HomerDesign.spacing.s,
    coverEndColor: HomerCoreColors().black,
    tagChipBorderRadius: HomerDesign.radii.s,
    tagChipHorizontalPadding: HomerDesign.spacing.s,
    tagChipVerticalPadding: HomerDesign.spacing.xxs,
    tagChipTextColor: c.textOnDark,
  );
}
