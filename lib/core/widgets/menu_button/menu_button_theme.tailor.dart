// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_button_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$MenuButtonThemeTailorMixin on ThemeExtension<MenuButtonTheme> {
  Color get splashColor;
  TextStyle get textStyle;

  @override
  MenuButtonTheme copyWith({Color? splashColor, TextStyle? textStyle}) {
    return MenuButtonTheme(
      splashColor: splashColor ?? this.splashColor,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  MenuButtonTheme lerp(
    covariant ThemeExtension<MenuButtonTheme>? other,
    double t,
  ) {
    if (other is! MenuButtonTheme) return this as MenuButtonTheme;
    return MenuButtonTheme(
      splashColor: Color.lerp(splashColor, other.splashColor, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MenuButtonTheme &&
            const DeepCollectionEquality().equals(
              splashColor,
              other.splashColor,
            ) &&
            const DeepCollectionEquality().equals(textStyle, other.textStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(splashColor),
      const DeepCollectionEquality().hash(textStyle),
    );
  }
}

extension MenuButtonThemeBuildContextProps on BuildContext {
  MenuButtonTheme get menuButtonTheme =>
      Theme.of(this).extension<MenuButtonTheme>()!;
  Color get splashColor => menuButtonTheme.splashColor;
  TextStyle get textStyle => menuButtonTheme.textStyle;
}
