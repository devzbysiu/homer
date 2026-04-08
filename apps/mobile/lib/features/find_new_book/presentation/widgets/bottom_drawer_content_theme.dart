import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../../core/theme/design_system.dart';

part 'bottom_drawer_content_theme.tailor.dart';

@tailorMixin
final class BottomDrawerTheme extends ThemeExtension<BottomDrawerTheme>
    with _$BottomDrawerThemeTailorMixin {
  @override
  final Color accentColor;

  @override
  final Color searchBarColor;

  @override
  final Color backdropColor;

  @override
  final double scrollPaddingTop;

  @override
  final double scrollPaddingBottom;

  @override
  final TextStyle summaryStyle;

  @override
  final Color bannerTextColor;

  @override
  final Color bannerColor;

  @override
  final Color suggestionBgColor;

  @override
  final TextStyle titleStyle;

  @override
  final TextStyle subtitleStyle;

  @override
  final Color errorColor;

  @override
  final TextStyle errorStyle;

  @override
  final Color saveButtonColor;

  @override
  final Color tagInactiveBgColor;

  @override
  final Color tagInactiveTextColor;

  @override
  final Color activeTagTextColor;

  @override
  final double bookAreaTopPadding;

  @override
  final double tagsRowBottomPosition;

  @override
  final double tagsRowRightPadding;

  @override
  final double saveButtonsBottomPosition;

  @override
  final double bookContainerHorizontalPadding;

  @override
  final double dropCapWidth;

  @override
  final double dropCapHeight;

  @override
  final double savedMarkOverlayWidth;

  @override
  final double savedMarkOverlayHeight;

  @override
  final double savedMarkIconSize;

  @override
  final double dropCapBottomPadding;

  @override
  final double dropCapRightPadding;

  @override
  final double summaryBoxHeight;

  @override
  final double remoteBookCardContentMarginTop;

  @override
  final double remoteBookCardHeight;

  @override
  final Color remoteBookCardEndColor;

  @override
  final double suggestionsHeight;

  @override
  final double suggestionsBorderRadius;

  @override
  final double suggestionsElevation;

  @override
  final double suggestionTilePadding;

  @override
  final double suggestionTileElevation;

  @override
  final double suggestionTileBorderRadius;

  BottomDrawerTheme({
    required this.accentColor,
    required this.searchBarColor,
    required this.backdropColor,
    required this.scrollPaddingTop,
    required this.scrollPaddingBottom,
    required this.summaryStyle,
    required this.bannerTextColor,
    required this.bannerColor,
    required this.suggestionBgColor,
    required this.titleStyle,
    required this.subtitleStyle,
    required this.errorColor,
    required this.errorStyle,
    required this.saveButtonColor,
    required this.tagInactiveBgColor,
    required this.tagInactiveTextColor,
    required this.activeTagTextColor,
    required this.bookAreaTopPadding,
    required this.tagsRowBottomPosition,
    required this.tagsRowRightPadding,
    required this.saveButtonsBottomPosition,
    required this.bookContainerHorizontalPadding,
    required this.dropCapWidth,
    required this.dropCapHeight,
    required this.savedMarkOverlayWidth,
    required this.savedMarkOverlayHeight,
    required this.savedMarkIconSize,
    required this.dropCapBottomPadding,
    required this.dropCapRightPadding,
    required this.summaryBoxHeight,
    required this.remoteBookCardContentMarginTop,
    required this.remoteBookCardHeight,
    required this.remoteBookCardEndColor,
    required this.suggestionsHeight,
    required this.suggestionsBorderRadius,
    required this.suggestionsElevation,
    required this.suggestionTilePadding,
    required this.suggestionTileElevation,
    required this.suggestionTileBorderRadius,
  });
}

BottomDrawerTheme bottomDrawerTheme(ThemeData data) {
  final c = data.brightness == Brightness.light
      ? HomerDesign.light
      : HomerDesign.dark;
  return BottomDrawerTheme(
    accentColor: c.accentPrimary,
    searchBarColor: c.searchBarDrawer,
    backdropColor: c.bgOverlay,
    scrollPaddingTop: HomerDesign.spacing.m,
    scrollPaddingBottom: 56.0,
    summaryStyle: HomerDesign.typography.bodyLarge.copyWith(
      color: c.textPrimary,
    ),
    bannerTextColor: c.bgSurface,
    bannerColor: c.accentPrimary,
    suggestionBgColor: c.bgSurface,
    titleStyle: HomerDesign.typography.titleMedium.copyWith(
      color: c.textPrimary,
    ),
    subtitleStyle: HomerDesign.typography.titleSmall.copyWith(
      color: c.textSecondary,
    ),
    errorColor: c.error,
    errorStyle: HomerDesign.typography.bodyLarge.copyWith(color: c.error),
    saveButtonColor: c.accentSecondary,
    tagInactiveBgColor: c.tagInactiveBg,
    tagInactiveTextColor: c.tagInactiveText,
    activeTagTextColor: c.tagActiveText,
    bookAreaTopPadding: 80.0,
    tagsRowBottomPosition: 60.0,
    tagsRowRightPadding: 18.0,
    saveButtonsBottomPosition:
        HomerDesign.spacing.s + HomerDesign.spacing.xxs, // 10.0
    bookContainerHorizontalPadding: 9.0,
    dropCapWidth: 150.0,
    dropCapHeight: 220.0,
    savedMarkOverlayWidth: 24.0,
    savedMarkOverlayHeight: HomerDesign.icons.l,
    savedMarkIconSize: HomerDesign.icons.l,
    dropCapBottomPadding: 5.0,
    dropCapRightPadding: 15.0,
    summaryBoxHeight: 340.0,
    remoteBookCardContentMarginTop: 183.0,
    remoteBookCardHeight: 280.0,
    remoteBookCardEndColor: HomerCoreColors().black,
    suggestionsHeight: 470.0,
    suggestionsBorderRadius: HomerDesign.radii.m,
    suggestionsElevation: HomerDesign.elevation.m,
    suggestionTilePadding: HomerDesign.spacing.s,
    suggestionTileElevation: HomerDesign.elevation.s,
    suggestionTileBorderRadius: HomerDesign.radii.m,
  );
}
