import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../core/theme/design_system.dart';

part 'card_footer_theme.tailor.dart';

@tailorMixin
final class CardFooterTheme extends ThemeExtension<CardFooterTheme>
    with _$CardFooterThemeTailorMixin {
  @override
  final Color ratingIconColor;

  @override
  final double ratingIconSpacing;

  @override
  final double ratingTopPadding;

  @override
  final Color ratingTextColor;

  @override
  final double shareRightPadding;

  @override
  final double shareIconSize;

  @override
  final Color shareIconColor;

  @override
  final double pageCountTopPadding;

  @override
  final double pageCountSpacing;

  @override
  final double sizeLabelTopPadding;

  @override
  final double sizeLabelSize;

  @override
  final double sizeLabelBorderRadius;

  @override
  final Color sizeLabelTextColor;

  @override
  final Color shortBookColor;

  @override
  final Color mediumBookColor;

  @override
  final Color longBookColor;

  CardFooterTheme({
    required this.ratingIconColor,
    required this.ratingIconSpacing,
    required this.ratingTopPadding,
    required this.ratingTextColor,
    required this.shareRightPadding,
    required this.shareIconSize,
    required this.shareIconColor,
    required this.pageCountTopPadding,
    required this.pageCountSpacing,
    required this.sizeLabelTopPadding,
    required this.sizeLabelSize,
    required this.sizeLabelBorderRadius,
    required this.sizeLabelTextColor,
    required this.shortBookColor,
    required this.mediumBookColor,
    required this.longBookColor,
  });
}

CardFooterTheme cardFooterTheme(ThemeData data) {
  final c = data.brightness == Brightness.light
      ? HomerDesign.light
      : HomerDesign.dark;
  return CardFooterTheme(
    ratingIconColor: c.accentPrimary,
    ratingIconSpacing: HomerDesign.spacing.xs,
    ratingTopPadding: HomerDesign.spacing.xs,
    ratingTextColor: c.textOnDark,
    shareRightPadding: 15.0,
    shareIconSize: HomerDesign.icons.s,
    shareIconColor: c.textOnDark,
    pageCountTopPadding: 6.0,
    pageCountSpacing: 10.0,
    sizeLabelTopPadding: 3.0,
    sizeLabelSize: HomerDesign.icons.m,
    sizeLabelBorderRadius: HomerDesign.radii.xs,
    sizeLabelTextColor: c.textOnDark,
    shortBookColor: c.chartShortBook,
    mediumBookColor: c.chartMediumBook,
    longBookColor: c.chartLongBook,
  );
}
