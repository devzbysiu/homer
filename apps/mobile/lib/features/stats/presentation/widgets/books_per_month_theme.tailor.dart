// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'books_per_month_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$BooksPerMonthThemeTailorMixin on ThemeExtension<BooksPerMonthTheme> {
  Color get chartColor;
  Color get chartColorLight;
  Color get fillColor;
  Color get fillColorFaded;
  Color get tooltipBgColor;
  TextStyle get tooltipStyle;
  TextStyle get axisLabelStyle;
  Color get goalLineColor;
  TextStyle get goalLabelStyle;
  TextStyle get headlineStyle;
  Color get chartBackgroundColor;
  double get lineWidth;
  double get dotRadius;
  double get dotStrokeWidth;
  double get tooltipHorizontalPadding;
  double get tooltipVerticalPadding;
  double get bottomAxisReservedSize;
  double get bottomAxisLabelAngle;
  double get bottomAxisLabelRightPadding;
  double get leftAxisReservedSize;
  double get goalLineStrokeWidth;
  int get goalLineDashLength;
  int get goalLineDashGap;
  double get goalLabelRightPadding;

  @override
  BooksPerMonthTheme copyWith({
    Color? chartColor,
    Color? chartColorLight,
    Color? fillColor,
    Color? fillColorFaded,
    Color? tooltipBgColor,
    TextStyle? tooltipStyle,
    TextStyle? axisLabelStyle,
    Color? goalLineColor,
    TextStyle? goalLabelStyle,
    TextStyle? headlineStyle,
    Color? chartBackgroundColor,
    double? lineWidth,
    double? dotRadius,
    double? dotStrokeWidth,
    double? tooltipHorizontalPadding,
    double? tooltipVerticalPadding,
    double? bottomAxisReservedSize,
    double? bottomAxisLabelAngle,
    double? bottomAxisLabelRightPadding,
    double? leftAxisReservedSize,
    double? goalLineStrokeWidth,
    int? goalLineDashLength,
    int? goalLineDashGap,
    double? goalLabelRightPadding,
  }) {
    return BooksPerMonthTheme(
      chartColor: chartColor ?? this.chartColor,
      chartColorLight: chartColorLight ?? this.chartColorLight,
      fillColor: fillColor ?? this.fillColor,
      fillColorFaded: fillColorFaded ?? this.fillColorFaded,
      tooltipBgColor: tooltipBgColor ?? this.tooltipBgColor,
      tooltipStyle: tooltipStyle ?? this.tooltipStyle,
      axisLabelStyle: axisLabelStyle ?? this.axisLabelStyle,
      goalLineColor: goalLineColor ?? this.goalLineColor,
      goalLabelStyle: goalLabelStyle ?? this.goalLabelStyle,
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
      bottomAxisLabelAngle: bottomAxisLabelAngle ?? this.bottomAxisLabelAngle,
      bottomAxisLabelRightPadding:
          bottomAxisLabelRightPadding ?? this.bottomAxisLabelRightPadding,
      leftAxisReservedSize: leftAxisReservedSize ?? this.leftAxisReservedSize,
      goalLineStrokeWidth: goalLineStrokeWidth ?? this.goalLineStrokeWidth,
      goalLineDashLength: goalLineDashLength ?? this.goalLineDashLength,
      goalLineDashGap: goalLineDashGap ?? this.goalLineDashGap,
      goalLabelRightPadding:
          goalLabelRightPadding ?? this.goalLabelRightPadding,
    );
  }

  @override
  BooksPerMonthTheme lerp(
    covariant ThemeExtension<BooksPerMonthTheme>? other,
    double t,
  ) {
    if (other is! BooksPerMonthTheme) return this as BooksPerMonthTheme;
    return BooksPerMonthTheme(
      chartColor: Color.lerp(chartColor, other.chartColor, t)!,
      chartColorLight: Color.lerp(chartColorLight, other.chartColorLight, t)!,
      fillColor: Color.lerp(fillColor, other.fillColor, t)!,
      fillColorFaded: Color.lerp(fillColorFaded, other.fillColorFaded, t)!,
      tooltipBgColor: Color.lerp(tooltipBgColor, other.tooltipBgColor, t)!,
      tooltipStyle: TextStyle.lerp(tooltipStyle, other.tooltipStyle, t)!,
      axisLabelStyle: TextStyle.lerp(axisLabelStyle, other.axisLabelStyle, t)!,
      goalLineColor: Color.lerp(goalLineColor, other.goalLineColor, t)!,
      goalLabelStyle: TextStyle.lerp(goalLabelStyle, other.goalLabelStyle, t)!,
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
      bottomAxisLabelAngle: t < 0.5
          ? bottomAxisLabelAngle
          : other.bottomAxisLabelAngle,
      bottomAxisLabelRightPadding: t < 0.5
          ? bottomAxisLabelRightPadding
          : other.bottomAxisLabelRightPadding,
      leftAxisReservedSize: t < 0.5
          ? leftAxisReservedSize
          : other.leftAxisReservedSize,
      goalLineStrokeWidth: t < 0.5
          ? goalLineStrokeWidth
          : other.goalLineStrokeWidth,
      goalLineDashLength: t < 0.5
          ? goalLineDashLength
          : other.goalLineDashLength,
      goalLineDashGap: t < 0.5 ? goalLineDashGap : other.goalLineDashGap,
      goalLabelRightPadding: t < 0.5
          ? goalLabelRightPadding
          : other.goalLabelRightPadding,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BooksPerMonthTheme &&
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
              goalLineColor,
              other.goalLineColor,
            ) &&
            const DeepCollectionEquality().equals(
              goalLabelStyle,
              other.goalLabelStyle,
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
              bottomAxisLabelAngle,
              other.bottomAxisLabelAngle,
            ) &&
            const DeepCollectionEquality().equals(
              bottomAxisLabelRightPadding,
              other.bottomAxisLabelRightPadding,
            ) &&
            const DeepCollectionEquality().equals(
              leftAxisReservedSize,
              other.leftAxisReservedSize,
            ) &&
            const DeepCollectionEquality().equals(
              goalLineStrokeWidth,
              other.goalLineStrokeWidth,
            ) &&
            const DeepCollectionEquality().equals(
              goalLineDashLength,
              other.goalLineDashLength,
            ) &&
            const DeepCollectionEquality().equals(
              goalLineDashGap,
              other.goalLineDashGap,
            ) &&
            const DeepCollectionEquality().equals(
              goalLabelRightPadding,
              other.goalLabelRightPadding,
            ));
  }

  @override
  int get hashCode {
    return Object.hashAll([
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(chartColor),
      const DeepCollectionEquality().hash(chartColorLight),
      const DeepCollectionEquality().hash(fillColor),
      const DeepCollectionEquality().hash(fillColorFaded),
      const DeepCollectionEquality().hash(tooltipBgColor),
      const DeepCollectionEquality().hash(tooltipStyle),
      const DeepCollectionEquality().hash(axisLabelStyle),
      const DeepCollectionEquality().hash(goalLineColor),
      const DeepCollectionEquality().hash(goalLabelStyle),
      const DeepCollectionEquality().hash(headlineStyle),
      const DeepCollectionEquality().hash(chartBackgroundColor),
      const DeepCollectionEquality().hash(lineWidth),
      const DeepCollectionEquality().hash(dotRadius),
      const DeepCollectionEquality().hash(dotStrokeWidth),
      const DeepCollectionEquality().hash(tooltipHorizontalPadding),
      const DeepCollectionEquality().hash(tooltipVerticalPadding),
      const DeepCollectionEquality().hash(bottomAxisReservedSize),
      const DeepCollectionEquality().hash(bottomAxisLabelAngle),
      const DeepCollectionEquality().hash(bottomAxisLabelRightPadding),
      const DeepCollectionEquality().hash(leftAxisReservedSize),
      const DeepCollectionEquality().hash(goalLineStrokeWidth),
      const DeepCollectionEquality().hash(goalLineDashLength),
      const DeepCollectionEquality().hash(goalLineDashGap),
      const DeepCollectionEquality().hash(goalLabelRightPadding),
    ]);
  }
}

extension BooksPerMonthThemeBuildContextProps on BuildContext {
  BooksPerMonthTheme get booksPerMonthTheme =>
      Theme.of(this).extension<BooksPerMonthTheme>()!;
  Color get chartColor => booksPerMonthTheme.chartColor;
  Color get chartColorLight => booksPerMonthTheme.chartColorLight;
  Color get fillColor => booksPerMonthTheme.fillColor;
  Color get fillColorFaded => booksPerMonthTheme.fillColorFaded;
  Color get tooltipBgColor => booksPerMonthTheme.tooltipBgColor;
  TextStyle get tooltipStyle => booksPerMonthTheme.tooltipStyle;
  TextStyle get axisLabelStyle => booksPerMonthTheme.axisLabelStyle;
  Color get goalLineColor => booksPerMonthTheme.goalLineColor;
  TextStyle get goalLabelStyle => booksPerMonthTheme.goalLabelStyle;
  TextStyle get headlineStyle => booksPerMonthTheme.headlineStyle;
  Color get chartBackgroundColor => booksPerMonthTheme.chartBackgroundColor;
  double get lineWidth => booksPerMonthTheme.lineWidth;
  double get dotRadius => booksPerMonthTheme.dotRadius;
  double get dotStrokeWidth => booksPerMonthTheme.dotStrokeWidth;
  double get tooltipHorizontalPadding =>
      booksPerMonthTheme.tooltipHorizontalPadding;
  double get tooltipVerticalPadding =>
      booksPerMonthTheme.tooltipVerticalPadding;
  double get bottomAxisReservedSize =>
      booksPerMonthTheme.bottomAxisReservedSize;
  double get bottomAxisLabelAngle => booksPerMonthTheme.bottomAxisLabelAngle;
  double get bottomAxisLabelRightPadding =>
      booksPerMonthTheme.bottomAxisLabelRightPadding;
  double get leftAxisReservedSize => booksPerMonthTheme.leftAxisReservedSize;
  double get goalLineStrokeWidth => booksPerMonthTheme.goalLineStrokeWidth;
  int get goalLineDashLength => booksPerMonthTheme.goalLineDashLength;
  int get goalLineDashGap => booksPerMonthTheme.goalLineDashGap;
  double get goalLabelRightPadding => booksPerMonthTheme.goalLabelRightPadding;
}
