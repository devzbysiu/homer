// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_footer_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$CardFooterThemeTailorMixin on ThemeExtension<CardFooterTheme> {
  Color get ratingIconColor;
  double get ratingIconSpacing;
  double get ratingTopPadding;
  Color get ratingTextColor;
  double get shareRightPadding;
  double get shareIconSize;
  Color get shareIconColor;
  double get pageCountTopPadding;
  double get pageCountSpacing;
  double get sizeLabelTopPadding;
  double get sizeLabelSize;
  double get sizeLabelBorderRadius;
  Color get sizeLabelTextColor;
  Color get shortBookColor;
  Color get mediumBookColor;
  Color get longBookColor;

  @override
  CardFooterTheme copyWith({
    Color? ratingIconColor,
    double? ratingIconSpacing,
    double? ratingTopPadding,
    Color? ratingTextColor,
    double? shareRightPadding,
    double? shareIconSize,
    Color? shareIconColor,
    double? pageCountTopPadding,
    double? pageCountSpacing,
    double? sizeLabelTopPadding,
    double? sizeLabelSize,
    double? sizeLabelBorderRadius,
    Color? sizeLabelTextColor,
    Color? shortBookColor,
    Color? mediumBookColor,
    Color? longBookColor,
  }) {
    return CardFooterTheme(
      ratingIconColor: ratingIconColor ?? this.ratingIconColor,
      ratingIconSpacing: ratingIconSpacing ?? this.ratingIconSpacing,
      ratingTopPadding: ratingTopPadding ?? this.ratingTopPadding,
      ratingTextColor: ratingTextColor ?? this.ratingTextColor,
      shareRightPadding: shareRightPadding ?? this.shareRightPadding,
      shareIconSize: shareIconSize ?? this.shareIconSize,
      shareIconColor: shareIconColor ?? this.shareIconColor,
      pageCountTopPadding: pageCountTopPadding ?? this.pageCountTopPadding,
      pageCountSpacing: pageCountSpacing ?? this.pageCountSpacing,
      sizeLabelTopPadding: sizeLabelTopPadding ?? this.sizeLabelTopPadding,
      sizeLabelSize: sizeLabelSize ?? this.sizeLabelSize,
      sizeLabelBorderRadius:
          sizeLabelBorderRadius ?? this.sizeLabelBorderRadius,
      sizeLabelTextColor: sizeLabelTextColor ?? this.sizeLabelTextColor,
      shortBookColor: shortBookColor ?? this.shortBookColor,
      mediumBookColor: mediumBookColor ?? this.mediumBookColor,
      longBookColor: longBookColor ?? this.longBookColor,
    );
  }

  @override
  CardFooterTheme lerp(
    covariant ThemeExtension<CardFooterTheme>? other,
    double t,
  ) {
    if (other is! CardFooterTheme) return this as CardFooterTheme;
    return CardFooterTheme(
      ratingIconColor: Color.lerp(ratingIconColor, other.ratingIconColor, t)!,
      ratingIconSpacing: t < 0.5 ? ratingIconSpacing : other.ratingIconSpacing,
      ratingTopPadding: t < 0.5 ? ratingTopPadding : other.ratingTopPadding,
      ratingTextColor: Color.lerp(ratingTextColor, other.ratingTextColor, t)!,
      shareRightPadding: t < 0.5 ? shareRightPadding : other.shareRightPadding,
      shareIconSize: t < 0.5 ? shareIconSize : other.shareIconSize,
      shareIconColor: Color.lerp(shareIconColor, other.shareIconColor, t)!,
      pageCountTopPadding: t < 0.5
          ? pageCountTopPadding
          : other.pageCountTopPadding,
      pageCountSpacing: t < 0.5 ? pageCountSpacing : other.pageCountSpacing,
      sizeLabelTopPadding: t < 0.5
          ? sizeLabelTopPadding
          : other.sizeLabelTopPadding,
      sizeLabelSize: t < 0.5 ? sizeLabelSize : other.sizeLabelSize,
      sizeLabelBorderRadius: t < 0.5
          ? sizeLabelBorderRadius
          : other.sizeLabelBorderRadius,
      sizeLabelTextColor: Color.lerp(
        sizeLabelTextColor,
        other.sizeLabelTextColor,
        t,
      )!,
      shortBookColor: Color.lerp(shortBookColor, other.shortBookColor, t)!,
      mediumBookColor: Color.lerp(mediumBookColor, other.mediumBookColor, t)!,
      longBookColor: Color.lerp(longBookColor, other.longBookColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CardFooterTheme &&
            const DeepCollectionEquality().equals(
              ratingIconColor,
              other.ratingIconColor,
            ) &&
            const DeepCollectionEquality().equals(
              ratingIconSpacing,
              other.ratingIconSpacing,
            ) &&
            const DeepCollectionEquality().equals(
              ratingTopPadding,
              other.ratingTopPadding,
            ) &&
            const DeepCollectionEquality().equals(
              ratingTextColor,
              other.ratingTextColor,
            ) &&
            const DeepCollectionEquality().equals(
              shareRightPadding,
              other.shareRightPadding,
            ) &&
            const DeepCollectionEquality().equals(
              shareIconSize,
              other.shareIconSize,
            ) &&
            const DeepCollectionEquality().equals(
              shareIconColor,
              other.shareIconColor,
            ) &&
            const DeepCollectionEquality().equals(
              pageCountTopPadding,
              other.pageCountTopPadding,
            ) &&
            const DeepCollectionEquality().equals(
              pageCountSpacing,
              other.pageCountSpacing,
            ) &&
            const DeepCollectionEquality().equals(
              sizeLabelTopPadding,
              other.sizeLabelTopPadding,
            ) &&
            const DeepCollectionEquality().equals(
              sizeLabelSize,
              other.sizeLabelSize,
            ) &&
            const DeepCollectionEquality().equals(
              sizeLabelBorderRadius,
              other.sizeLabelBorderRadius,
            ) &&
            const DeepCollectionEquality().equals(
              sizeLabelTextColor,
              other.sizeLabelTextColor,
            ) &&
            const DeepCollectionEquality().equals(
              shortBookColor,
              other.shortBookColor,
            ) &&
            const DeepCollectionEquality().equals(
              mediumBookColor,
              other.mediumBookColor,
            ) &&
            const DeepCollectionEquality().equals(
              longBookColor,
              other.longBookColor,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(ratingIconColor),
      const DeepCollectionEquality().hash(ratingIconSpacing),
      const DeepCollectionEquality().hash(ratingTopPadding),
      const DeepCollectionEquality().hash(ratingTextColor),
      const DeepCollectionEquality().hash(shareRightPadding),
      const DeepCollectionEquality().hash(shareIconSize),
      const DeepCollectionEquality().hash(shareIconColor),
      const DeepCollectionEquality().hash(pageCountTopPadding),
      const DeepCollectionEquality().hash(pageCountSpacing),
      const DeepCollectionEquality().hash(sizeLabelTopPadding),
      const DeepCollectionEquality().hash(sizeLabelSize),
      const DeepCollectionEquality().hash(sizeLabelBorderRadius),
      const DeepCollectionEquality().hash(sizeLabelTextColor),
      const DeepCollectionEquality().hash(shortBookColor),
      const DeepCollectionEquality().hash(mediumBookColor),
      const DeepCollectionEquality().hash(longBookColor),
    );
  }
}

extension CardFooterThemeBuildContextProps on BuildContext {
  CardFooterTheme get cardFooterTheme =>
      Theme.of(this).extension<CardFooterTheme>()!;
  Color get ratingIconColor => cardFooterTheme.ratingIconColor;
  double get ratingIconSpacing => cardFooterTheme.ratingIconSpacing;
  double get ratingTopPadding => cardFooterTheme.ratingTopPadding;
  Color get ratingTextColor => cardFooterTheme.ratingTextColor;
  double get shareRightPadding => cardFooterTheme.shareRightPadding;
  double get shareIconSize => cardFooterTheme.shareIconSize;
  Color get shareIconColor => cardFooterTheme.shareIconColor;
  double get pageCountTopPadding => cardFooterTheme.pageCountTopPadding;
  double get pageCountSpacing => cardFooterTheme.pageCountSpacing;
  double get sizeLabelTopPadding => cardFooterTheme.sizeLabelTopPadding;
  double get sizeLabelSize => cardFooterTheme.sizeLabelSize;
  double get sizeLabelBorderRadius => cardFooterTheme.sizeLabelBorderRadius;
  Color get sizeLabelTextColor => cardFooterTheme.sizeLabelTextColor;
  Color get shortBookColor => cardFooterTheme.shortBookColor;
  Color get mediumBookColor => cardFooterTheme.mediumBookColor;
  Color get longBookColor => cardFooterTheme.longBookColor;
}
