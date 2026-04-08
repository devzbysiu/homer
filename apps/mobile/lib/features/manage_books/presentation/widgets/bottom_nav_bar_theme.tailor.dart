// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bottom_nav_bar_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$BottomNavBarThemeTailorMixin on ThemeExtension<BottomNavBarTheme> {
  Color get shadowColor;
  Color get backgroundColor;
  Color get unselectedColor;
  TextStyle get labelStyle;
  Color get accentColor;
  Color get deleteColor;
  double get sheetOpenHeight;
  double get barHeight;
  double get shadowSpreadRadius;
  double get shadowBlurRadius;
  Offset get shadowOffset;
  double get barTopRightRadius;
  double get buttonPadding;

  @override
  BottomNavBarTheme copyWith({
    Color? shadowColor,
    Color? backgroundColor,
    Color? unselectedColor,
    TextStyle? labelStyle,
    Color? accentColor,
    Color? deleteColor,
    double? sheetOpenHeight,
    double? barHeight,
    double? shadowSpreadRadius,
    double? shadowBlurRadius,
    Offset? shadowOffset,
    double? barTopRightRadius,
    double? buttonPadding,
  }) {
    return BottomNavBarTheme(
      shadowColor: shadowColor ?? this.shadowColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      unselectedColor: unselectedColor ?? this.unselectedColor,
      labelStyle: labelStyle ?? this.labelStyle,
      accentColor: accentColor ?? this.accentColor,
      deleteColor: deleteColor ?? this.deleteColor,
      sheetOpenHeight: sheetOpenHeight ?? this.sheetOpenHeight,
      barHeight: barHeight ?? this.barHeight,
      shadowSpreadRadius: shadowSpreadRadius ?? this.shadowSpreadRadius,
      shadowBlurRadius: shadowBlurRadius ?? this.shadowBlurRadius,
      shadowOffset: shadowOffset ?? this.shadowOffset,
      barTopRightRadius: barTopRightRadius ?? this.barTopRightRadius,
      buttonPadding: buttonPadding ?? this.buttonPadding,
    );
  }

  @override
  BottomNavBarTheme lerp(
    covariant ThemeExtension<BottomNavBarTheme>? other,
    double t,
  ) {
    if (other is! BottomNavBarTheme) return this as BottomNavBarTheme;
    return BottomNavBarTheme(
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      unselectedColor: Color.lerp(unselectedColor, other.unselectedColor, t)!,
      labelStyle: TextStyle.lerp(labelStyle, other.labelStyle, t)!,
      accentColor: Color.lerp(accentColor, other.accentColor, t)!,
      deleteColor: Color.lerp(deleteColor, other.deleteColor, t)!,
      sheetOpenHeight: t < 0.5 ? sheetOpenHeight : other.sheetOpenHeight,
      barHeight: t < 0.5 ? barHeight : other.barHeight,
      shadowSpreadRadius: t < 0.5
          ? shadowSpreadRadius
          : other.shadowSpreadRadius,
      shadowBlurRadius: t < 0.5 ? shadowBlurRadius : other.shadowBlurRadius,
      shadowOffset: t < 0.5 ? shadowOffset : other.shadowOffset,
      barTopRightRadius: t < 0.5 ? barTopRightRadius : other.barTopRightRadius,
      buttonPadding: t < 0.5 ? buttonPadding : other.buttonPadding,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BottomNavBarTheme &&
            const DeepCollectionEquality().equals(
              shadowColor,
              other.shadowColor,
            ) &&
            const DeepCollectionEquality().equals(
              backgroundColor,
              other.backgroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              unselectedColor,
              other.unselectedColor,
            ) &&
            const DeepCollectionEquality().equals(
              labelStyle,
              other.labelStyle,
            ) &&
            const DeepCollectionEquality().equals(
              accentColor,
              other.accentColor,
            ) &&
            const DeepCollectionEquality().equals(
              deleteColor,
              other.deleteColor,
            ) &&
            const DeepCollectionEquality().equals(
              sheetOpenHeight,
              other.sheetOpenHeight,
            ) &&
            const DeepCollectionEquality().equals(barHeight, other.barHeight) &&
            const DeepCollectionEquality().equals(
              shadowSpreadRadius,
              other.shadowSpreadRadius,
            ) &&
            const DeepCollectionEquality().equals(
              shadowBlurRadius,
              other.shadowBlurRadius,
            ) &&
            const DeepCollectionEquality().equals(
              shadowOffset,
              other.shadowOffset,
            ) &&
            const DeepCollectionEquality().equals(
              barTopRightRadius,
              other.barTopRightRadius,
            ) &&
            const DeepCollectionEquality().equals(
              buttonPadding,
              other.buttonPadding,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(shadowColor),
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(unselectedColor),
      const DeepCollectionEquality().hash(labelStyle),
      const DeepCollectionEquality().hash(accentColor),
      const DeepCollectionEquality().hash(deleteColor),
      const DeepCollectionEquality().hash(sheetOpenHeight),
      const DeepCollectionEquality().hash(barHeight),
      const DeepCollectionEquality().hash(shadowSpreadRadius),
      const DeepCollectionEquality().hash(shadowBlurRadius),
      const DeepCollectionEquality().hash(shadowOffset),
      const DeepCollectionEquality().hash(barTopRightRadius),
      const DeepCollectionEquality().hash(buttonPadding),
    );
  }
}

extension BottomNavBarThemeBuildContextProps on BuildContext {
  BottomNavBarTheme get bottomNavBarTheme =>
      Theme.of(this).extension<BottomNavBarTheme>()!;
  Color get shadowColor => bottomNavBarTheme.shadowColor;
  Color get backgroundColor => bottomNavBarTheme.backgroundColor;
  Color get unselectedColor => bottomNavBarTheme.unselectedColor;
  TextStyle get labelStyle => bottomNavBarTheme.labelStyle;
  Color get accentColor => bottomNavBarTheme.accentColor;
  Color get deleteColor => bottomNavBarTheme.deleteColor;
  double get sheetOpenHeight => bottomNavBarTheme.sheetOpenHeight;
  double get barHeight => bottomNavBarTheme.barHeight;
  double get shadowSpreadRadius => bottomNavBarTheme.shadowSpreadRadius;
  double get shadowBlurRadius => bottomNavBarTheme.shadowBlurRadius;
  Offset get shadowOffset => bottomNavBarTheme.shadowOffset;
  double get barTopRightRadius => bottomNavBarTheme.barTopRightRadius;
  double get buttonPadding => bottomNavBarTheme.buttonPadding;
}
