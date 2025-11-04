// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'other_stats_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$OtherStatsThemeTailorMixin on ThemeExtension<OtherStatsTheme> {
  TextStyle get headlineStyle;
  TextStyle get valueStyle;
  TextStyle get labelStyle;
  double get valueFontSize;

  @override
  OtherStatsTheme copyWith({
    TextStyle? headlineStyle,
    TextStyle? valueStyle,
    TextStyle? labelStyle,
    double? valueFontSize,
  }) {
    return OtherStatsTheme(
      headlineStyle: headlineStyle ?? this.headlineStyle,
      valueStyle: valueStyle ?? this.valueStyle,
      labelStyle: labelStyle ?? this.labelStyle,
      valueFontSize: valueFontSize ?? this.valueFontSize,
    );
  }

  @override
  OtherStatsTheme lerp(
    covariant ThemeExtension<OtherStatsTheme>? other,
    double t,
  ) {
    if (other is! OtherStatsTheme) return this as OtherStatsTheme;
    return OtherStatsTheme(
      headlineStyle: TextStyle.lerp(headlineStyle, other.headlineStyle, t)!,
      valueStyle: TextStyle.lerp(valueStyle, other.valueStyle, t)!,
      labelStyle: TextStyle.lerp(labelStyle, other.labelStyle, t)!,
      valueFontSize: t < 0.5 ? valueFontSize : other.valueFontSize,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OtherStatsTheme &&
            const DeepCollectionEquality().equals(
              headlineStyle,
              other.headlineStyle,
            ) &&
            const DeepCollectionEquality().equals(
              valueStyle,
              other.valueStyle,
            ) &&
            const DeepCollectionEquality().equals(
              labelStyle,
              other.labelStyle,
            ) &&
            const DeepCollectionEquality().equals(
              valueFontSize,
              other.valueFontSize,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(headlineStyle),
      const DeepCollectionEquality().hash(valueStyle),
      const DeepCollectionEquality().hash(labelStyle),
      const DeepCollectionEquality().hash(valueFontSize),
    );
  }
}

extension OtherStatsThemeBuildContextProps on BuildContext {
  OtherStatsTheme get otherStatsTheme =>
      Theme.of(this).extension<OtherStatsTheme>()!;
  TextStyle get headlineStyle => otherStatsTheme.headlineStyle;
  TextStyle get valueStyle => otherStatsTheme.valueStyle;
  TextStyle get labelStyle => otherStatsTheme.labelStyle;
  double get valueFontSize => otherStatsTheme.valueFontSize;
}
