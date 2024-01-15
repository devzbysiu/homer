import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  // General
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  ListTileThemeData get listTileTheme => theme.listTileTheme;
  IconThemeData get iconTheme => theme.iconTheme;

  // Text
  TextStyle get bodyMedium => textTheme.bodyMedium!;
  TextStyle get bodyLarge => textTheme.bodyLarge!;
  TextStyle get headlineMedium => textTheme.headlineMedium!;
  TextStyle get headlineSmall => textTheme.headlineSmall!;
  TextStyle get titleMedium => textTheme.titleMedium!;
  TextStyle get titleSmall => textTheme.titleSmall!;
  TextStyle get errorStyle => bodyLarge.copyWith(color: error);

  // Colors
  Color get primary => colorScheme.primary;
  Color get lightPrimary => colorScheme.primary.lighten(20);
  Color get primaryContainer => colorScheme.primaryContainer;
  Color get lightPrimaryContainer => colorScheme.primaryContainer.lighten(20);
  Color get headlineMediumColor => headlineMedium.color!;
  Color get background => colorScheme.background;
  Color get onBackground => colorScheme.onBackground;
  Color get lightBackground => background.lighten(20);
  Color get error => colorScheme.error;
  Color get secondary => colorScheme.secondary;
  Color get tile => listTileTheme.tileColor!;
  Color get icon => iconTheme.color!;
  Color get card => theme.cardColor;
  Color get shadow => theme.shadowColor;
  Color get unselected => theme.unselectedWidgetColor;
}
