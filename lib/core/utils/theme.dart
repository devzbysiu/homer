import 'package:dynamic_color/dynamic_color.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../features/settings/presentation/bloc/settings_bloc.dart';

const scheme = FlexScheme.redM3;

extension ThemeExtension on BuildContext {
  // General
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  ListTileThemeData get listTileTheme => theme.listTileTheme;
  IconThemeData get iconTheme => theme.iconTheme;

  // Text
  TextStyle get bodySmall => textTheme.bodySmall!;
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
  Color get icon => iconTheme.color!;
  Color get card => theme.cardColor;
  Color get shadow => theme.shadowColor;
  Color get unselected => theme.unselectedWidgetColor;
}

SizedBox spaceBetween([double howMuch = 20]) => SizedBox(height: howMuch);

ThemeData lightTheme(ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
  return lightDynamic != null && darkDynamic != null
      ? _lightDynamicTheme(lightDynamic)
      : _lightFlexTheme();
}

ThemeData _lightDynamicTheme(ColorScheme lightDynamic) {
  return ThemeData(
    colorScheme: lightDynamic.harmonized(),
    sliderTheme: _noThumbSlider(),
  );
}

SliderThemeData _noThumbSlider() {
  return SliderThemeData(
    overlayShape: SliderComponentShape.noThumb,
  );
}

ThemeData _lightFlexTheme() {
  return FlexColorScheme.light(
    scheme: scheme,
    useMaterial3: true,
  ).toTheme.copyWith(sliderTheme: _noThumbSlider());
}

ThemeData darkTheme(ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
  return lightDynamic != null && darkDynamic != null
      ? _darkDynamicTheme(darkDynamic)
      : _darkFlexTheme();
}

ThemeData _darkDynamicTheme(ColorScheme darkDynamic) {
  return ThemeData(
    colorScheme: darkDynamic.harmonized(),
    sliderTheme: _noThumbSlider(),
  );
}

ThemeData _darkFlexTheme() {
  return FlexColorScheme.dark(
    scheme: scheme,
    useMaterial3: true,
  ).toTheme.copyWith(sliderTheme: _noThumbSlider());
}

ThemeMode themeMode(SettingsState state) {
  return state.useSystemTheme
      ? ThemeMode.system
      : state.useDarkTheme
          ? ThemeMode.dark
          : ThemeMode.light;
}
