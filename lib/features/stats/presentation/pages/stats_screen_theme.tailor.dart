// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats_screen_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$StatsScreenThemeTailorMixin on ThemeExtension<StatsScreenTheme> {
  Color get gradientStart;
  Color get gradientEnd;
  double get sectionSpacing;

  @override
  StatsScreenTheme copyWith({
    Color? gradientStart,
    Color? gradientEnd,
    double? sectionSpacing,
  }) {
    return StatsScreenTheme(
      gradientStart: gradientStart ?? this.gradientStart,
      gradientEnd: gradientEnd ?? this.gradientEnd,
      sectionSpacing: sectionSpacing ?? this.sectionSpacing,
    );
  }

  @override
  StatsScreenTheme lerp(
    covariant ThemeExtension<StatsScreenTheme>? other,
    double t,
  ) {
    if (other is! StatsScreenTheme) return this as StatsScreenTheme;
    return StatsScreenTheme(
      gradientStart: Color.lerp(gradientStart, other.gradientStart, t)!,
      gradientEnd: Color.lerp(gradientEnd, other.gradientEnd, t)!,
      sectionSpacing: t < 0.5 ? sectionSpacing : other.sectionSpacing,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StatsScreenTheme &&
            const DeepCollectionEquality().equals(
              gradientStart,
              other.gradientStart,
            ) &&
            const DeepCollectionEquality().equals(
              gradientEnd,
              other.gradientEnd,
            ) &&
            const DeepCollectionEquality().equals(
              sectionSpacing,
              other.sectionSpacing,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(gradientStart),
      const DeepCollectionEquality().hash(gradientEnd),
      const DeepCollectionEquality().hash(sectionSpacing),
    );
  }
}

extension StatsScreenThemeBuildContextProps on BuildContext {
  StatsScreenTheme get statsScreenTheme =>
      Theme.of(this).extension<StatsScreenTheme>()!;
  Color get gradientStart => statsScreenTheme.gradientStart;
  Color get gradientEnd => statsScreenTheme.gradientEnd;
  double get sectionSpacing => statsScreenTheme.sectionSpacing;
}
