// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'books_list_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$BooksListThemeTailorMixin on ThemeExtension<BooksListTheme> {
  TextStyle get summaryTextStyle;
  Color get summaryBlurColor;
  double get summaryColorOpacity;
  double get summaryBlurAmount;
  double get summaryPadding;
  Color get cardColor;
  double get cardHorizontalPadding;
  double get cardVerticalPadding;
  double get cardBorderRadius;
  Color get swipeColor;
  Color get swipeBackgroundColor;
  double get swipeLeftIndicatorPadding;
  double get swipeRightIndicatorPadding;
  double get snackbarMessageFontSize;
  Color get deletionIconColor;
  Color get deletionOverlayColor;
  double get deletionColorOpacity;
  double get deletionBlurAmount;
  double get deletionIconSize;
  double get coverHeight;
  double get coverTagRunSpacing;
  Color get coverEndColor;
  double get tagChipBorderRadius;
  double get tagChipHorizontalPadding;
  double get tagChipVerticalPadding;
  Color get tagChipTextColor;

  @override
  BooksListTheme copyWith({
    TextStyle? summaryTextStyle,
    Color? summaryBlurColor,
    double? summaryColorOpacity,
    double? summaryBlurAmount,
    double? summaryPadding,
    Color? cardColor,
    double? cardHorizontalPadding,
    double? cardVerticalPadding,
    double? cardBorderRadius,
    Color? swipeColor,
    Color? swipeBackgroundColor,
    double? swipeLeftIndicatorPadding,
    double? swipeRightIndicatorPadding,
    double? snackbarMessageFontSize,
    Color? deletionIconColor,
    Color? deletionOverlayColor,
    double? deletionColorOpacity,
    double? deletionBlurAmount,
    double? deletionIconSize,
    double? coverHeight,
    double? coverTagRunSpacing,
    Color? coverEndColor,
    double? tagChipBorderRadius,
    double? tagChipHorizontalPadding,
    double? tagChipVerticalPadding,
    Color? tagChipTextColor,
  }) {
    return BooksListTheme(
      summaryTextStyle: summaryTextStyle ?? this.summaryTextStyle,
      summaryBlurColor: summaryBlurColor ?? this.summaryBlurColor,
      summaryColorOpacity: summaryColorOpacity ?? this.summaryColorOpacity,
      summaryBlurAmount: summaryBlurAmount ?? this.summaryBlurAmount,
      summaryPadding: summaryPadding ?? this.summaryPadding,
      cardColor: cardColor ?? this.cardColor,
      cardHorizontalPadding:
          cardHorizontalPadding ?? this.cardHorizontalPadding,
      cardVerticalPadding: cardVerticalPadding ?? this.cardVerticalPadding,
      cardBorderRadius: cardBorderRadius ?? this.cardBorderRadius,
      swipeColor: swipeColor ?? this.swipeColor,
      swipeBackgroundColor: swipeBackgroundColor ?? this.swipeBackgroundColor,
      swipeLeftIndicatorPadding:
          swipeLeftIndicatorPadding ?? this.swipeLeftIndicatorPadding,
      swipeRightIndicatorPadding:
          swipeRightIndicatorPadding ?? this.swipeRightIndicatorPadding,
      snackbarMessageFontSize:
          snackbarMessageFontSize ?? this.snackbarMessageFontSize,
      deletionIconColor: deletionIconColor ?? this.deletionIconColor,
      deletionOverlayColor: deletionOverlayColor ?? this.deletionOverlayColor,
      deletionColorOpacity: deletionColorOpacity ?? this.deletionColorOpacity,
      deletionBlurAmount: deletionBlurAmount ?? this.deletionBlurAmount,
      deletionIconSize: deletionIconSize ?? this.deletionIconSize,
      coverHeight: coverHeight ?? this.coverHeight,
      coverTagRunSpacing: coverTagRunSpacing ?? this.coverTagRunSpacing,
      coverEndColor: coverEndColor ?? this.coverEndColor,
      tagChipBorderRadius: tagChipBorderRadius ?? this.tagChipBorderRadius,
      tagChipHorizontalPadding:
          tagChipHorizontalPadding ?? this.tagChipHorizontalPadding,
      tagChipVerticalPadding:
          tagChipVerticalPadding ?? this.tagChipVerticalPadding,
      tagChipTextColor: tagChipTextColor ?? this.tagChipTextColor,
    );
  }

  @override
  BooksListTheme lerp(
    covariant ThemeExtension<BooksListTheme>? other,
    double t,
  ) {
    if (other is! BooksListTheme) return this as BooksListTheme;
    return BooksListTheme(
      summaryTextStyle: TextStyle.lerp(
        summaryTextStyle,
        other.summaryTextStyle,
        t,
      )!,
      summaryBlurColor: Color.lerp(
        summaryBlurColor,
        other.summaryBlurColor,
        t,
      )!,
      summaryColorOpacity: t < 0.5
          ? summaryColorOpacity
          : other.summaryColorOpacity,
      summaryBlurAmount: t < 0.5 ? summaryBlurAmount : other.summaryBlurAmount,
      summaryPadding: t < 0.5 ? summaryPadding : other.summaryPadding,
      cardColor: Color.lerp(cardColor, other.cardColor, t)!,
      cardHorizontalPadding: t < 0.5
          ? cardHorizontalPadding
          : other.cardHorizontalPadding,
      cardVerticalPadding: t < 0.5
          ? cardVerticalPadding
          : other.cardVerticalPadding,
      cardBorderRadius: t < 0.5 ? cardBorderRadius : other.cardBorderRadius,
      swipeColor: Color.lerp(swipeColor, other.swipeColor, t)!,
      swipeBackgroundColor: Color.lerp(
        swipeBackgroundColor,
        other.swipeBackgroundColor,
        t,
      )!,
      swipeLeftIndicatorPadding: t < 0.5
          ? swipeLeftIndicatorPadding
          : other.swipeLeftIndicatorPadding,
      swipeRightIndicatorPadding: t < 0.5
          ? swipeRightIndicatorPadding
          : other.swipeRightIndicatorPadding,
      snackbarMessageFontSize: t < 0.5
          ? snackbarMessageFontSize
          : other.snackbarMessageFontSize,
      deletionIconColor: Color.lerp(
        deletionIconColor,
        other.deletionIconColor,
        t,
      )!,
      deletionOverlayColor: Color.lerp(
        deletionOverlayColor,
        other.deletionOverlayColor,
        t,
      )!,
      deletionColorOpacity: t < 0.5
          ? deletionColorOpacity
          : other.deletionColorOpacity,
      deletionBlurAmount: t < 0.5
          ? deletionBlurAmount
          : other.deletionBlurAmount,
      deletionIconSize: t < 0.5 ? deletionIconSize : other.deletionIconSize,
      coverHeight: t < 0.5 ? coverHeight : other.coverHeight,
      coverTagRunSpacing: t < 0.5
          ? coverTagRunSpacing
          : other.coverTagRunSpacing,
      coverEndColor: Color.lerp(coverEndColor, other.coverEndColor, t)!,
      tagChipBorderRadius: t < 0.5
          ? tagChipBorderRadius
          : other.tagChipBorderRadius,
      tagChipHorizontalPadding: t < 0.5
          ? tagChipHorizontalPadding
          : other.tagChipHorizontalPadding,
      tagChipVerticalPadding: t < 0.5
          ? tagChipVerticalPadding
          : other.tagChipVerticalPadding,
      tagChipTextColor: Color.lerp(
        tagChipTextColor,
        other.tagChipTextColor,
        t,
      )!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BooksListTheme &&
            const DeepCollectionEquality().equals(
              summaryTextStyle,
              other.summaryTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              summaryBlurColor,
              other.summaryBlurColor,
            ) &&
            const DeepCollectionEquality().equals(
              summaryColorOpacity,
              other.summaryColorOpacity,
            ) &&
            const DeepCollectionEquality().equals(
              summaryBlurAmount,
              other.summaryBlurAmount,
            ) &&
            const DeepCollectionEquality().equals(
              summaryPadding,
              other.summaryPadding,
            ) &&
            const DeepCollectionEquality().equals(cardColor, other.cardColor) &&
            const DeepCollectionEquality().equals(
              cardHorizontalPadding,
              other.cardHorizontalPadding,
            ) &&
            const DeepCollectionEquality().equals(
              cardVerticalPadding,
              other.cardVerticalPadding,
            ) &&
            const DeepCollectionEquality().equals(
              cardBorderRadius,
              other.cardBorderRadius,
            ) &&
            const DeepCollectionEquality().equals(
              swipeColor,
              other.swipeColor,
            ) &&
            const DeepCollectionEquality().equals(
              swipeBackgroundColor,
              other.swipeBackgroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              swipeLeftIndicatorPadding,
              other.swipeLeftIndicatorPadding,
            ) &&
            const DeepCollectionEquality().equals(
              swipeRightIndicatorPadding,
              other.swipeRightIndicatorPadding,
            ) &&
            const DeepCollectionEquality().equals(
              snackbarMessageFontSize,
              other.snackbarMessageFontSize,
            ) &&
            const DeepCollectionEquality().equals(
              deletionIconColor,
              other.deletionIconColor,
            ) &&
            const DeepCollectionEquality().equals(
              deletionOverlayColor,
              other.deletionOverlayColor,
            ) &&
            const DeepCollectionEquality().equals(
              deletionColorOpacity,
              other.deletionColorOpacity,
            ) &&
            const DeepCollectionEquality().equals(
              deletionBlurAmount,
              other.deletionBlurAmount,
            ) &&
            const DeepCollectionEquality().equals(
              deletionIconSize,
              other.deletionIconSize,
            ) &&
            const DeepCollectionEquality().equals(
              coverHeight,
              other.coverHeight,
            ) &&
            const DeepCollectionEquality().equals(
              coverTagRunSpacing,
              other.coverTagRunSpacing,
            ) &&
            const DeepCollectionEquality().equals(
              coverEndColor,
              other.coverEndColor,
            ) &&
            const DeepCollectionEquality().equals(
              tagChipBorderRadius,
              other.tagChipBorderRadius,
            ) &&
            const DeepCollectionEquality().equals(
              tagChipHorizontalPadding,
              other.tagChipHorizontalPadding,
            ) &&
            const DeepCollectionEquality().equals(
              tagChipVerticalPadding,
              other.tagChipVerticalPadding,
            ) &&
            const DeepCollectionEquality().equals(
              tagChipTextColor,
              other.tagChipTextColor,
            ));
  }

  @override
  int get hashCode {
    return Object.hashAll([
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(summaryTextStyle),
      const DeepCollectionEquality().hash(summaryBlurColor),
      const DeepCollectionEquality().hash(summaryColorOpacity),
      const DeepCollectionEquality().hash(summaryBlurAmount),
      const DeepCollectionEquality().hash(summaryPadding),
      const DeepCollectionEquality().hash(cardColor),
      const DeepCollectionEquality().hash(cardHorizontalPadding),
      const DeepCollectionEquality().hash(cardVerticalPadding),
      const DeepCollectionEquality().hash(cardBorderRadius),
      const DeepCollectionEquality().hash(swipeColor),
      const DeepCollectionEquality().hash(swipeBackgroundColor),
      const DeepCollectionEquality().hash(swipeLeftIndicatorPadding),
      const DeepCollectionEquality().hash(swipeRightIndicatorPadding),
      const DeepCollectionEquality().hash(snackbarMessageFontSize),
      const DeepCollectionEquality().hash(deletionIconColor),
      const DeepCollectionEquality().hash(deletionOverlayColor),
      const DeepCollectionEquality().hash(deletionColorOpacity),
      const DeepCollectionEquality().hash(deletionBlurAmount),
      const DeepCollectionEquality().hash(deletionIconSize),
      const DeepCollectionEquality().hash(coverHeight),
      const DeepCollectionEquality().hash(coverTagRunSpacing),
      const DeepCollectionEquality().hash(coverEndColor),
      const DeepCollectionEquality().hash(tagChipBorderRadius),
      const DeepCollectionEquality().hash(tagChipHorizontalPadding),
      const DeepCollectionEquality().hash(tagChipVerticalPadding),
      const DeepCollectionEquality().hash(tagChipTextColor),
    ]);
  }
}

extension BooksListThemeBuildContextProps on BuildContext {
  BooksListTheme get booksListTheme =>
      Theme.of(this).extension<BooksListTheme>()!;
  TextStyle get summaryTextStyle => booksListTheme.summaryTextStyle;
  Color get summaryBlurColor => booksListTheme.summaryBlurColor;
  double get summaryColorOpacity => booksListTheme.summaryColorOpacity;
  double get summaryBlurAmount => booksListTheme.summaryBlurAmount;
  double get summaryPadding => booksListTheme.summaryPadding;
  Color get cardColor => booksListTheme.cardColor;
  double get cardHorizontalPadding => booksListTheme.cardHorizontalPadding;
  double get cardVerticalPadding => booksListTheme.cardVerticalPadding;
  double get cardBorderRadius => booksListTheme.cardBorderRadius;
  Color get swipeColor => booksListTheme.swipeColor;
  Color get swipeBackgroundColor => booksListTheme.swipeBackgroundColor;
  double get swipeLeftIndicatorPadding =>
      booksListTheme.swipeLeftIndicatorPadding;
  double get swipeRightIndicatorPadding =>
      booksListTheme.swipeRightIndicatorPadding;
  double get snackbarMessageFontSize => booksListTheme.snackbarMessageFontSize;
  Color get deletionIconColor => booksListTheme.deletionIconColor;
  Color get deletionOverlayColor => booksListTheme.deletionOverlayColor;
  double get deletionColorOpacity => booksListTheme.deletionColorOpacity;
  double get deletionBlurAmount => booksListTheme.deletionBlurAmount;
  double get deletionIconSize => booksListTheme.deletionIconSize;
  double get coverHeight => booksListTheme.coverHeight;
  double get coverTagRunSpacing => booksListTheme.coverTagRunSpacing;
  Color get coverEndColor => booksListTheme.coverEndColor;
  double get tagChipBorderRadius => booksListTheme.tagChipBorderRadius;
  double get tagChipHorizontalPadding =>
      booksListTheme.tagChipHorizontalPadding;
  double get tagChipVerticalPadding => booksListTheme.tagChipVerticalPadding;
  Color get tagChipTextColor => booksListTheme.tagChipTextColor;
}
