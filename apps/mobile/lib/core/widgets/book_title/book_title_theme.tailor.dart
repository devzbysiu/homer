// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_title_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$BookTitleThemeTailorMixin on ThemeExtension<BookTitleTheme> {
  TextStyle get titleStyle;
  Color get tagBorderColor;
  Color get titleColor;
  double get tagSize;
  double get tagBorderRadius;
  Color get tagBackgroundColor;
  Color get tagIconColor;
  double get tagIconSize;

  @override
  BookTitleTheme copyWith({
    TextStyle? titleStyle,
    Color? tagBorderColor,
    Color? titleColor,
    double? tagSize,
    double? tagBorderRadius,
    Color? tagBackgroundColor,
    Color? tagIconColor,
    double? tagIconSize,
  }) {
    return BookTitleTheme(
      titleStyle: titleStyle ?? this.titleStyle,
      tagBorderColor: tagBorderColor ?? this.tagBorderColor,
      titleColor: titleColor ?? this.titleColor,
      tagSize: tagSize ?? this.tagSize,
      tagBorderRadius: tagBorderRadius ?? this.tagBorderRadius,
      tagBackgroundColor: tagBackgroundColor ?? this.tagBackgroundColor,
      tagIconColor: tagIconColor ?? this.tagIconColor,
      tagIconSize: tagIconSize ?? this.tagIconSize,
    );
  }

  @override
  BookTitleTheme lerp(
    covariant ThemeExtension<BookTitleTheme>? other,
    double t,
  ) {
    if (other is! BookTitleTheme) return this as BookTitleTheme;
    return BookTitleTheme(
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
      tagBorderColor: Color.lerp(tagBorderColor, other.tagBorderColor, t)!,
      titleColor: Color.lerp(titleColor, other.titleColor, t)!,
      tagSize: t < 0.5 ? tagSize : other.tagSize,
      tagBorderRadius: t < 0.5 ? tagBorderRadius : other.tagBorderRadius,
      tagBackgroundColor: Color.lerp(
        tagBackgroundColor,
        other.tagBackgroundColor,
        t,
      )!,
      tagIconColor: Color.lerp(tagIconColor, other.tagIconColor, t)!,
      tagIconSize: t < 0.5 ? tagIconSize : other.tagIconSize,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookTitleTheme &&
            const DeepCollectionEquality().equals(
              titleStyle,
              other.titleStyle,
            ) &&
            const DeepCollectionEquality().equals(
              tagBorderColor,
              other.tagBorderColor,
            ) &&
            const DeepCollectionEquality().equals(
              titleColor,
              other.titleColor,
            ) &&
            const DeepCollectionEquality().equals(tagSize, other.tagSize) &&
            const DeepCollectionEquality().equals(
              tagBorderRadius,
              other.tagBorderRadius,
            ) &&
            const DeepCollectionEquality().equals(
              tagBackgroundColor,
              other.tagBackgroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              tagIconColor,
              other.tagIconColor,
            ) &&
            const DeepCollectionEquality().equals(
              tagIconSize,
              other.tagIconSize,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(titleStyle),
      const DeepCollectionEquality().hash(tagBorderColor),
      const DeepCollectionEquality().hash(titleColor),
      const DeepCollectionEquality().hash(tagSize),
      const DeepCollectionEquality().hash(tagBorderRadius),
      const DeepCollectionEquality().hash(tagBackgroundColor),
      const DeepCollectionEquality().hash(tagIconColor),
      const DeepCollectionEquality().hash(tagIconSize),
    );
  }
}

extension BookTitleThemeBuildContextProps on BuildContext {
  BookTitleTheme get bookTitleTheme =>
      Theme.of(this).extension<BookTitleTheme>()!;
  TextStyle get titleStyle => bookTitleTheme.titleStyle;
  Color get tagBorderColor => bookTitleTheme.tagBorderColor;
  Color get titleColor => bookTitleTheme.titleColor;
  double get tagSize => bookTitleTheme.tagSize;
  double get tagBorderRadius => bookTitleTheme.tagBorderRadius;
  Color get tagBackgroundColor => bookTitleTheme.tagBackgroundColor;
  Color get tagIconColor => bookTitleTheme.tagIconColor;
  double get tagIconSize => bookTitleTheme.tagIconSize;
}
