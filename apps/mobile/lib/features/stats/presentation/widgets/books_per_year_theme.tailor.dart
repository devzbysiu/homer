// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'books_per_year_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$BooksPerYearThemeTailorMixin on ThemeExtension<BooksPerYearTheme> {
  Color get chartColor;
  Color get chartColorLight;
  Color get fillColor;
  Color get fillColorFaded;
  Color get tooltipBgColor;
  TextStyle get tooltipStyle;
  TextStyle get axisLabelStyle;
  TextStyle get headlineStyle;
  Color get chartBackgroundColor;
  double get lineWidth;
  double get dotRadius;
  double get dotStrokeWidth;
  double get tooltipHorizontalPadding;
  double get tooltipVerticalPadding;
  double get bottomAxisReservedSize;
  double get leftAxisReservedSize;

  @override
  BooksPerYearTheme copyWith({
    Color? chartColor,
    Color? chartColorLight,
    Color? fillColor,
    Color? fillColorFaded,
    Color? tooltipBgColor,
    TextStyle? tooltipStyle,
    TextStyle? axisLabelStyle,
    TextStyle? headlineStyle,
    Color? chartBackgroundColor,
    double? lineWidth,
    double? dotRadius,
    double? dotStrokeWidth,
    double? tooltipHorizontalPadding,
    double? tooltipVerticalPadding,
    double? bottomAxisReservedSize,
    double? leftAxisReservedSize,
  }) {
    return BooksPerYearTheme(
      chartColor: chartColor ?? this.chartColor,
      chartColorLight: chartColorLight ?? this.chartColorLight,
      fillColor: fillColor ?? this.fillColor,
      fillColorFaded: fillColorFaded ?? this.fillColorFaded,
      tooltipBgColor: tooltipBgColor ?? this.tooltipBgColor,
      tooltipStyle: tooltipStyle ?? this.tooltipStyle,
      axisLabelStyle: axisLabelStyle ?? this.axisLabelStyle,
      headlineStyle: headlineStyle ?? this.headlineStyle,
      chartBackgroundColor: chartBackgroundColor ?? this.chartBackgroundColor,
      lineWidth: lineWidth ?? this.lineWidth,
      dotRadius: dotRadius ?? this.dotRadius,
      dotStrokeWidth: dotStrokeWidth ?? this.dotStrokeWidth,
      tooltipHorizontalPadding:
          tooltipHorizontalPadding ?? this.tooltipHorizontalPadding,
      tooltipVerticalPadding:
          tooltipVerticalPadding ?? this.tooltipVerticalPadding,
      bottomAxisReservedSize:
          bottomAxisReservedSize ?? this.bottomAxisReservedSize,
      leftAxisReservedSize: leftAxisReservedSize ?? this.leftAxisReservedSize,
    );
  }

  @override
  BooksPerYearTheme lerp(
    covariant ThemeExtension<BooksPerYearTheme>? other,
    double t,
  ) {
    if (other is! BooksPerYearTheme) return this as BooksPerYearTheme;
    return BooksPerYearTheme(
      chartColor: Color.lerp(chartColor, other.chartColor, t)!,
      chartColorLight: Color.lerp(chartColorLight, other.chartColorLight, t)!,
      fillColor: Color.lerp(fillColor, other.fillColor, t)!,
      fillColorFaded: Color.lerp(fillColorFaded, other.fillColorFaded, t)!,
      tooltipBgColor: Color.lerp(tooltipBgColor, other.tooltipBgColor, t)!,
      tooltipStyle: TextStyle.lerp(tooltipStyle, other.tooltipStyle, t)!,
      axisLabelStyle: TextStyle.lerp(axisLabelStyle, other.axisLabelStyle, t)!,
      headlineStyle: TextStyle.lerp(headlineStyle, other.headlineStyle, t)!,
      chartBackgroundColor: Color.lerp(
        chartBackgroundColor,
        other.chartBackgroundColor,
        t,
      )!,
      lineWidth: t < 0.5 ? lineWidth : other.lineWidth,
      dotRadius: t < 0.5 ? dotRadius : other.dotRadius,
      dotStrokeWidth: t < 0.5 ? dotStrokeWidth : other.dotStrokeWidth,
      tooltipHorizontalPadding: t < 0.5
          ? tooltipHorizontalPadding
          : other.tooltipHorizontalPadding,
      tooltipVerticalPadding: t < 0.5
          ? tooltipVerticalPadding
          : other.tooltipVerticalPadding,
      bottomAxisReservedSize: t < 0.5
          ? bottomAxisReservedSize
          : other.bottomAxisReservedSize,
      leftAxisReservedSize: t < 0.5
          ? leftAxisReservedSize
          : other.leftAxisReservedSize,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BooksPerYearTheme &&
            const DeepCollectionEquality().equals(
              chartColor,
              other.chartColor,
            ) &&
            const DeepCollectionEquality().equals(
              chartColorLight,
              other.chartColorLight,
            ) &&
            const DeepCollectionEquality().equals(fillColor, other.fillColor) &&
            const DeepCollectionEquality().equals(
              fillColorFaded,
              other.fillColorFaded,
            ) &&
            const DeepCollectionEquality().equals(
              tooltipBgColor,
              other.tooltipBgColor,
            ) &&
            const DeepCollectionEquality().equals(
              tooltipStyle,
              other.tooltipStyle,
            ) &&
            const DeepCollectionEquality().equals(
              axisLabelStyle,
              other.axisLabelStyle,
            ) &&
            const DeepCollectionEquality().equals(
              headlineStyle,
              other.headlineStyle,
            ) &&
            const DeepCollectionEquality().equals(
              chartBackgroundColor,
              other.chartBackgroundColor,
            ) &&
            const DeepCollectionEquality().equals(lineWidth, other.lineWidth) &&
            const DeepCollectionEquality().equals(dotRadius, other.dotRadius) &&
            const DeepCollectionEquality().equals(
              dotStrokeWidth,
              other.dotStrokeWidth,
            ) &&
            const DeepCollectionEquality().equals(
              tooltipHorizontalPadding,
              other.tooltipHorizontalPadding,
            ) &&
            const DeepCollectionEquality().equals(
              tooltipVerticalPadding,
              other.tooltipVerticalPadding,
            ) &&
            const DeepCollectionEquality().equals(
              bottomAxisReservedSize,
              other.bottomAxisReservedSize,
            ) &&
            const DeepCollectionEquality().equals(
              leftAxisReservedSize,
              other.leftAxisReservedSize,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(chartColor),
      const DeepCollectionEquality().hash(chartColorLight),
      const DeepCollectionEquality().hash(fillColor),
      const DeepCollectionEquality().hash(fillColorFaded),
      const DeepCollectionEquality().hash(tooltipBgColor),
      const DeepCollectionEquality().hash(tooltipStyle),
      const DeepCollectionEquality().hash(axisLabelStyle),
      const DeepCollectionEquality().hash(headlineStyle),
      const DeepCollectionEquality().hash(chartBackgroundColor),
      const DeepCollectionEquality().hash(lineWidth),
      const DeepCollectionEquality().hash(dotRadius),
      const DeepCollectionEquality().hash(dotStrokeWidth),
      const DeepCollectionEquality().hash(tooltipHorizontalPadding),
      const DeepCollectionEquality().hash(tooltipVerticalPadding),
      const DeepCollectionEquality().hash(bottomAxisReservedSize),
      const DeepCollectionEquality().hash(leftAxisReservedSize),
    );
  }
}

extension BooksPerYearThemeBuildContextProps on BuildContext {
  BooksPerYearTheme get booksPerYearTheme =>
      Theme.of(this).extension<BooksPerYearTheme>()!;
  Color get chartColor => booksPerYearTheme.chartColor;
  Color get chartColorLight => booksPerYearTheme.chartColorLight;
  Color get fillColor => booksPerYearTheme.fillColor;
  Color get fillColorFaded => booksPerYearTheme.fillColorFaded;
  Color get tooltipBgColor => booksPerYearTheme.tooltipBgColor;
  TextStyle get tooltipStyle => booksPerYearTheme.tooltipStyle;
  TextStyle get axisLabelStyle => booksPerYearTheme.axisLabelStyle;
  TextStyle get headlineStyle => booksPerYearTheme.headlineStyle;
  Color get chartBackgroundColor => booksPerYearTheme.chartBackgroundColor;
  double get lineWidth => booksPerYearTheme.lineWidth;
  double get dotRadius => booksPerYearTheme.dotRadius;
  double get dotStrokeWidth => booksPerYearTheme.dotStrokeWidth;
  double get tooltipHorizontalPadding =>
      booksPerYearTheme.tooltipHorizontalPadding;
  double get tooltipVerticalPadding => booksPerYearTheme.tooltipVerticalPadding;
  double get bottomAxisReservedSize => booksPerYearTheme.bottomAxisReservedSize;
  double get leftAxisReservedSize => booksPerYearTheme.leftAxisReservedSize;
}
