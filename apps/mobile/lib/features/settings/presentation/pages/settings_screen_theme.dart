import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../../core/theme/design_system.dart';

part 'settings_screen_theme.tailor.dart';

@tailorMixin
final class SettingsScreenTheme extends ThemeExtension<SettingsScreenTheme>
    with _$SettingsScreenThemeTailorMixin {
  @override
  final Color backgroundColor;

  @override
  final Color switchColor;

  @override
  final TextStyle titleStyle;

  @override
  final double listTopPadding;

  SettingsScreenTheme({
    required this.backgroundColor,
    required this.switchColor,
    required this.titleStyle,
    required this.listTopPadding,
  });
}

SettingsScreenTheme settingsScreenTheme(ThemeData data) {
  final c = data.brightness == Brightness.light
      ? HomerDesign.light
      : HomerDesign.dark;
  return SettingsScreenTheme(
    backgroundColor: c.bgSurface,
    switchColor: c.accentPrimary,
    titleStyle: HomerDesign.typography.headlineSmall.copyWith(
      color: c.textPrimary,
    ),
    listTopPadding: 50.0,
  );
}
