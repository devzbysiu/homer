// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_screen_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$SettingsScreenThemeTailorMixin on ThemeExtension<SettingsScreenTheme> {
  Color get backgroundColor;
  Color get switchColor;
  TextStyle get titleStyle;
  double get listTopPadding;

  @override
  SettingsScreenTheme copyWith({
    Color? backgroundColor,
    Color? switchColor,
    TextStyle? titleStyle,
    double? listTopPadding,
  }) {
    return SettingsScreenTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      switchColor: switchColor ?? this.switchColor,
      titleStyle: titleStyle ?? this.titleStyle,
      listTopPadding: listTopPadding ?? this.listTopPadding,
    );
  }

  @override
  SettingsScreenTheme lerp(
    covariant ThemeExtension<SettingsScreenTheme>? other,
    double t,
  ) {
    if (other is! SettingsScreenTheme) return this as SettingsScreenTheme;
    return SettingsScreenTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      switchColor: Color.lerp(switchColor, other.switchColor, t)!,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
      listTopPadding: t < 0.5 ? listTopPadding : other.listTopPadding,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SettingsScreenTheme &&
            const DeepCollectionEquality().equals(
              backgroundColor,
              other.backgroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              switchColor,
              other.switchColor,
            ) &&
            const DeepCollectionEquality().equals(
              titleStyle,
              other.titleStyle,
            ) &&
            const DeepCollectionEquality().equals(
              listTopPadding,
              other.listTopPadding,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(switchColor),
      const DeepCollectionEquality().hash(titleStyle),
      const DeepCollectionEquality().hash(listTopPadding),
    );
  }
}

extension SettingsScreenThemeBuildContextProps on BuildContext {
  SettingsScreenTheme get settingsScreenTheme =>
      Theme.of(this).extension<SettingsScreenTheme>()!;
  Color get backgroundColor => settingsScreenTheme.backgroundColor;
  Color get switchColor => settingsScreenTheme.switchColor;
  TextStyle get titleStyle => settingsScreenTheme.titleStyle;
  double get listTopPadding => settingsScreenTheme.listTopPadding;
}
