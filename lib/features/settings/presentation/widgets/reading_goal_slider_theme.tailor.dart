// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reading_goal_slider_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$ReadingGoalSliderThemeTailorMixin
    on ThemeExtension<ReadingGoalSliderTheme> {
  TextStyle get headerStyle;
  double get contentPaddingTop;
  double get contentPaddingLeft;
  double get contentPaddingRight;
  double get titleLeftPadding;
  double get sliderTopPadding;

  @override
  ReadingGoalSliderTheme copyWith({
    TextStyle? headerStyle,
    double? contentPaddingTop,
    double? contentPaddingLeft,
    double? contentPaddingRight,
    double? titleLeftPadding,
    double? sliderTopPadding,
  }) {
    return ReadingGoalSliderTheme(
      headerStyle: headerStyle ?? this.headerStyle,
      contentPaddingTop: contentPaddingTop ?? this.contentPaddingTop,
      contentPaddingLeft: contentPaddingLeft ?? this.contentPaddingLeft,
      contentPaddingRight: contentPaddingRight ?? this.contentPaddingRight,
      titleLeftPadding: titleLeftPadding ?? this.titleLeftPadding,
      sliderTopPadding: sliderTopPadding ?? this.sliderTopPadding,
    );
  }

  @override
  ReadingGoalSliderTheme lerp(
    covariant ThemeExtension<ReadingGoalSliderTheme>? other,
    double t,
  ) {
    if (other is! ReadingGoalSliderTheme) return this as ReadingGoalSliderTheme;
    return ReadingGoalSliderTheme(
      headerStyle: TextStyle.lerp(headerStyle, other.headerStyle, t)!,
      contentPaddingTop: t < 0.5 ? contentPaddingTop : other.contentPaddingTop,
      contentPaddingLeft: t < 0.5
          ? contentPaddingLeft
          : other.contentPaddingLeft,
      contentPaddingRight: t < 0.5
          ? contentPaddingRight
          : other.contentPaddingRight,
      titleLeftPadding: t < 0.5 ? titleLeftPadding : other.titleLeftPadding,
      sliderTopPadding: t < 0.5 ? sliderTopPadding : other.sliderTopPadding,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReadingGoalSliderTheme &&
            const DeepCollectionEquality().equals(
              headerStyle,
              other.headerStyle,
            ) &&
            const DeepCollectionEquality().equals(
              contentPaddingTop,
              other.contentPaddingTop,
            ) &&
            const DeepCollectionEquality().equals(
              contentPaddingLeft,
              other.contentPaddingLeft,
            ) &&
            const DeepCollectionEquality().equals(
              contentPaddingRight,
              other.contentPaddingRight,
            ) &&
            const DeepCollectionEquality().equals(
              titleLeftPadding,
              other.titleLeftPadding,
            ) &&
            const DeepCollectionEquality().equals(
              sliderTopPadding,
              other.sliderTopPadding,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(headerStyle),
      const DeepCollectionEquality().hash(contentPaddingTop),
      const DeepCollectionEquality().hash(contentPaddingLeft),
      const DeepCollectionEquality().hash(contentPaddingRight),
      const DeepCollectionEquality().hash(titleLeftPadding),
      const DeepCollectionEquality().hash(sliderTopPadding),
    );
  }
}

extension ReadingGoalSliderThemeBuildContextProps on BuildContext {
  ReadingGoalSliderTheme get readingGoalSliderTheme =>
      Theme.of(this).extension<ReadingGoalSliderTheme>()!;
  TextStyle get headerStyle => readingGoalSliderTheme.headerStyle;
  double get contentPaddingTop => readingGoalSliderTheme.contentPaddingTop;
  double get contentPaddingLeft => readingGoalSliderTheme.contentPaddingLeft;
  double get contentPaddingRight => readingGoalSliderTheme.contentPaddingRight;
  double get titleLeftPadding => readingGoalSliderTheme.titleLeftPadding;
  double get sliderTopPadding => readingGoalSliderTheme.sliderTopPadding;
}
