import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../../core/theme/design_system.dart';

part 'main_screen_theme.tailor.dart';

@tailorMixin
final class MainScreenTheme extends ThemeExtension<MainScreenTheme>
    with _$MainScreenThemeTailorMixin {
  @override
  final Color searchBarColor;

  @override
  final Color gradientStart;

  @override
  final Color gradientEnd;

  @override
  final double booksListTopPadding;

  @override
  final double searchIconRightPadding;

  MainScreenTheme({
    required this.searchBarColor,
    required this.gradientStart,
    required this.gradientEnd,
    required this.booksListTopPadding,
    required this.searchIconRightPadding,
  });
}

MainScreenTheme mainScreenTheme(ThemeData data) {
  final c = data.brightness == Brightness.light
      ? HomerDesign.light
      : HomerDesign.dark;
  return MainScreenTheme(
    searchBarColor: c.searchBar,
    gradientStart: c.accentContainer,
    gradientEnd: c.accentContainerLight,
    booksListTopPadding: 52.0,
    searchIconRightPadding: HomerDesign.spacing.s,
  );
}
