// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'books_per_state_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$BooksPerStateThemeTailorMixin on ThemeExtension<BooksPerStateTheme> {
  TextStyle get headlineStyle;
  Color get waitingColor;
  Color get inProgressColor;
  Color get readColor;
  TextStyle get legendStyle;
  double get barWidth;
  double get legendSwatchSize;
  double get legendSwatchSpacing;
  double get legendItemSpacing;

  @override
  BooksPerStateTheme copyWith({
    TextStyle? headlineStyle,
    Color? waitingColor,
    Color? inProgressColor,
    Color? readColor,
    TextStyle? legendStyle,
    double? barWidth,
    double? legendSwatchSize,
    double? legendSwatchSpacing,
    double? legendItemSpacing,
  }) {
    return BooksPerStateTheme(
      headlineStyle: headlineStyle ?? this.headlineStyle,
      waitingColor: waitingColor ?? this.waitingColor,
      inProgressColor: inProgressColor ?? this.inProgressColor,
      readColor: readColor ?? this.readColor,
      legendStyle: legendStyle ?? this.legendStyle,
      barWidth: barWidth ?? this.barWidth,
      legendSwatchSize: legendSwatchSize ?? this.legendSwatchSize,
      legendSwatchSpacing: legendSwatchSpacing ?? this.legendSwatchSpacing,
      legendItemSpacing: legendItemSpacing ?? this.legendItemSpacing,
    );
  }

  @override
  BooksPerStateTheme lerp(
    covariant ThemeExtension<BooksPerStateTheme>? other,
    double t,
  ) {
    if (other is! BooksPerStateTheme) return this as BooksPerStateTheme;
    return BooksPerStateTheme(
      headlineStyle: TextStyle.lerp(headlineStyle, other.headlineStyle, t)!,
      waitingColor: Color.lerp(waitingColor, other.waitingColor, t)!,
      inProgressColor: Color.lerp(inProgressColor, other.inProgressColor, t)!,
      readColor: Color.lerp(readColor, other.readColor, t)!,
      legendStyle: TextStyle.lerp(legendStyle, other.legendStyle, t)!,
      barWidth: t < 0.5 ? barWidth : other.barWidth,
      legendSwatchSize: t < 0.5 ? legendSwatchSize : other.legendSwatchSize,
      legendSwatchSpacing: t < 0.5
          ? legendSwatchSpacing
          : other.legendSwatchSpacing,
      legendItemSpacing: t < 0.5 ? legendItemSpacing : other.legendItemSpacing,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BooksPerStateTheme &&
            const DeepCollectionEquality().equals(
              headlineStyle,
              other.headlineStyle,
            ) &&
            const DeepCollectionEquality().equals(
              waitingColor,
              other.waitingColor,
            ) &&
            const DeepCollectionEquality().equals(
              inProgressColor,
              other.inProgressColor,
            ) &&
            const DeepCollectionEquality().equals(readColor, other.readColor) &&
            const DeepCollectionEquality().equals(
              legendStyle,
              other.legendStyle,
            ) &&
            const DeepCollectionEquality().equals(barWidth, other.barWidth) &&
            const DeepCollectionEquality().equals(
              legendSwatchSize,
              other.legendSwatchSize,
            ) &&
            const DeepCollectionEquality().equals(
              legendSwatchSpacing,
              other.legendSwatchSpacing,
            ) &&
            const DeepCollectionEquality().equals(
              legendItemSpacing,
              other.legendItemSpacing,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(headlineStyle),
      const DeepCollectionEquality().hash(waitingColor),
      const DeepCollectionEquality().hash(inProgressColor),
      const DeepCollectionEquality().hash(readColor),
      const DeepCollectionEquality().hash(legendStyle),
      const DeepCollectionEquality().hash(barWidth),
      const DeepCollectionEquality().hash(legendSwatchSize),
      const DeepCollectionEquality().hash(legendSwatchSpacing),
      const DeepCollectionEquality().hash(legendItemSpacing),
    );
  }
}

extension BooksPerStateThemeBuildContextProps on BuildContext {
  BooksPerStateTheme get booksPerStateTheme =>
      Theme.of(this).extension<BooksPerStateTheme>()!;
  TextStyle get headlineStyle => booksPerStateTheme.headlineStyle;
  Color get waitingColor => booksPerStateTheme.waitingColor;
  Color get inProgressColor => booksPerStateTheme.inProgressColor;
  Color get readColor => booksPerStateTheme.readColor;
  TextStyle get legendStyle => booksPerStateTheme.legendStyle;
  double get barWidth => booksPerStateTheme.barWidth;
  double get legendSwatchSize => booksPerStateTheme.legendSwatchSize;
  double get legendSwatchSpacing => booksPerStateTheme.legendSwatchSpacing;
  double get legendItemSpacing => booksPerStateTheme.legendItemSpacing;
}
