// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_size_slider_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$BookSizeSliderThemeTailorMixin on ThemeExtension<BookSizeSliderTheme> {
  TextStyle get headerStyle;
  Color get thumbColor;
  double get contentPaddingTop;
  double get contentPaddingLeft;
  double get contentPaddingRight;
  double get titleLeftPadding;
  double get activeTrackSize;
  double get inactiveTrackSize;
  double get textHeightOffset;
  double get sliderHorizontalPadding;
  Color get shortRangeColor;
  Color get mediumRangeColor;
  Color get longRangeColor;

  @override
  BookSizeSliderTheme copyWith({
    TextStyle? headerStyle,
    Color? thumbColor,
    double? contentPaddingTop,
    double? contentPaddingLeft,
    double? contentPaddingRight,
    double? titleLeftPadding,
    double? activeTrackSize,
    double? inactiveTrackSize,
    double? textHeightOffset,
    double? sliderHorizontalPadding,
    Color? shortRangeColor,
    Color? mediumRangeColor,
    Color? longRangeColor,
  }) {
    return BookSizeSliderTheme(
      headerStyle: headerStyle ?? this.headerStyle,
      thumbColor: thumbColor ?? this.thumbColor,
      contentPaddingTop: contentPaddingTop ?? this.contentPaddingTop,
      contentPaddingLeft: contentPaddingLeft ?? this.contentPaddingLeft,
      contentPaddingRight: contentPaddingRight ?? this.contentPaddingRight,
      titleLeftPadding: titleLeftPadding ?? this.titleLeftPadding,
      activeTrackSize: activeTrackSize ?? this.activeTrackSize,
      inactiveTrackSize: inactiveTrackSize ?? this.inactiveTrackSize,
      textHeightOffset: textHeightOffset ?? this.textHeightOffset,
      sliderHorizontalPadding:
          sliderHorizontalPadding ?? this.sliderHorizontalPadding,
      shortRangeColor: shortRangeColor ?? this.shortRangeColor,
      mediumRangeColor: mediumRangeColor ?? this.mediumRangeColor,
      longRangeColor: longRangeColor ?? this.longRangeColor,
    );
  }

  @override
  BookSizeSliderTheme lerp(
    covariant ThemeExtension<BookSizeSliderTheme>? other,
    double t,
  ) {
    if (other is! BookSizeSliderTheme) return this as BookSizeSliderTheme;
    return BookSizeSliderTheme(
      headerStyle: TextStyle.lerp(headerStyle, other.headerStyle, t)!,
      thumbColor: Color.lerp(thumbColor, other.thumbColor, t)!,
      contentPaddingTop: t < 0.5 ? contentPaddingTop : other.contentPaddingTop,
      contentPaddingLeft: t < 0.5
          ? contentPaddingLeft
          : other.contentPaddingLeft,
      contentPaddingRight: t < 0.5
          ? contentPaddingRight
          : other.contentPaddingRight,
      titleLeftPadding: t < 0.5 ? titleLeftPadding : other.titleLeftPadding,
      activeTrackSize: t < 0.5 ? activeTrackSize : other.activeTrackSize,
      inactiveTrackSize: t < 0.5 ? inactiveTrackSize : other.inactiveTrackSize,
      textHeightOffset: t < 0.5 ? textHeightOffset : other.textHeightOffset,
      sliderHorizontalPadding: t < 0.5
          ? sliderHorizontalPadding
          : other.sliderHorizontalPadding,
      shortRangeColor: Color.lerp(shortRangeColor, other.shortRangeColor, t)!,
      mediumRangeColor: Color.lerp(
        mediumRangeColor,
        other.mediumRangeColor,
        t,
      )!,
      longRangeColor: Color.lerp(longRangeColor, other.longRangeColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookSizeSliderTheme &&
            const DeepCollectionEquality().equals(
              headerStyle,
              other.headerStyle,
            ) &&
            const DeepCollectionEquality().equals(
              thumbColor,
              other.thumbColor,
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
              activeTrackSize,
              other.activeTrackSize,
            ) &&
            const DeepCollectionEquality().equals(
              inactiveTrackSize,
              other.inactiveTrackSize,
            ) &&
            const DeepCollectionEquality().equals(
              textHeightOffset,
              other.textHeightOffset,
            ) &&
            const DeepCollectionEquality().equals(
              sliderHorizontalPadding,
              other.sliderHorizontalPadding,
            ) &&
            const DeepCollectionEquality().equals(
              shortRangeColor,
              other.shortRangeColor,
            ) &&
            const DeepCollectionEquality().equals(
              mediumRangeColor,
              other.mediumRangeColor,
            ) &&
            const DeepCollectionEquality().equals(
              longRangeColor,
              other.longRangeColor,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(headerStyle),
      const DeepCollectionEquality().hash(thumbColor),
      const DeepCollectionEquality().hash(contentPaddingTop),
      const DeepCollectionEquality().hash(contentPaddingLeft),
      const DeepCollectionEquality().hash(contentPaddingRight),
      const DeepCollectionEquality().hash(titleLeftPadding),
      const DeepCollectionEquality().hash(activeTrackSize),
      const DeepCollectionEquality().hash(inactiveTrackSize),
      const DeepCollectionEquality().hash(textHeightOffset),
      const DeepCollectionEquality().hash(sliderHorizontalPadding),
      const DeepCollectionEquality().hash(shortRangeColor),
      const DeepCollectionEquality().hash(mediumRangeColor),
      const DeepCollectionEquality().hash(longRangeColor),
    );
  }
}

extension BookSizeSliderThemeBuildContextProps on BuildContext {
  BookSizeSliderTheme get bookSizeSliderTheme =>
      Theme.of(this).extension<BookSizeSliderTheme>()!;
  TextStyle get headerStyle => bookSizeSliderTheme.headerStyle;
  Color get thumbColor => bookSizeSliderTheme.thumbColor;
  double get contentPaddingTop => bookSizeSliderTheme.contentPaddingTop;
  double get contentPaddingLeft => bookSizeSliderTheme.contentPaddingLeft;
  double get contentPaddingRight => bookSizeSliderTheme.contentPaddingRight;
  double get titleLeftPadding => bookSizeSliderTheme.titleLeftPadding;
  double get activeTrackSize => bookSizeSliderTheme.activeTrackSize;
  double get inactiveTrackSize => bookSizeSliderTheme.inactiveTrackSize;
  double get textHeightOffset => bookSizeSliderTheme.textHeightOffset;
  double get sliderHorizontalPadding =>
      bookSizeSliderTheme.sliderHorizontalPadding;
  Color get shortRangeColor => bookSizeSliderTheme.shortRangeColor;
  Color get mediumRangeColor => bookSizeSliderTheme.mediumRangeColor;
  Color get longRangeColor => bookSizeSliderTheme.longRangeColor;
}
