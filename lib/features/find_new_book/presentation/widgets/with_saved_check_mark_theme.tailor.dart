// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'with_saved_check_mark_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$WithSavedCheckMarkThemeTailorMixin
    on ThemeExtension<WithSavedCheckMarkTheme> {
  Color get overlayColor;
  Color get iconColor;
  double get overlayWidth;
  double get overlayHeight;
  double get iconSize;
  double get iconLeftOffset;

  @override
  WithSavedCheckMarkTheme copyWith({
    Color? overlayColor,
    Color? iconColor,
    double? overlayWidth,
    double? overlayHeight,
    double? iconSize,
    double? iconLeftOffset,
  }) {
    return WithSavedCheckMarkTheme(
      overlayColor: overlayColor ?? this.overlayColor,
      iconColor: iconColor ?? this.iconColor,
      overlayWidth: overlayWidth ?? this.overlayWidth,
      overlayHeight: overlayHeight ?? this.overlayHeight,
      iconSize: iconSize ?? this.iconSize,
      iconLeftOffset: iconLeftOffset ?? this.iconLeftOffset,
    );
  }

  @override
  WithSavedCheckMarkTheme lerp(
    covariant ThemeExtension<WithSavedCheckMarkTheme>? other,
    double t,
  ) {
    if (other is! WithSavedCheckMarkTheme)
      return this as WithSavedCheckMarkTheme;
    return WithSavedCheckMarkTheme(
      overlayColor: Color.lerp(overlayColor, other.overlayColor, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      overlayWidth: t < 0.5 ? overlayWidth : other.overlayWidth,
      overlayHeight: t < 0.5 ? overlayHeight : other.overlayHeight,
      iconSize: t < 0.5 ? iconSize : other.iconSize,
      iconLeftOffset: t < 0.5 ? iconLeftOffset : other.iconLeftOffset,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WithSavedCheckMarkTheme &&
            const DeepCollectionEquality().equals(
              overlayColor,
              other.overlayColor,
            ) &&
            const DeepCollectionEquality().equals(iconColor, other.iconColor) &&
            const DeepCollectionEquality().equals(
              overlayWidth,
              other.overlayWidth,
            ) &&
            const DeepCollectionEquality().equals(
              overlayHeight,
              other.overlayHeight,
            ) &&
            const DeepCollectionEquality().equals(iconSize, other.iconSize) &&
            const DeepCollectionEquality().equals(
              iconLeftOffset,
              other.iconLeftOffset,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(overlayColor),
      const DeepCollectionEquality().hash(iconColor),
      const DeepCollectionEquality().hash(overlayWidth),
      const DeepCollectionEquality().hash(overlayHeight),
      const DeepCollectionEquality().hash(iconSize),
      const DeepCollectionEquality().hash(iconLeftOffset),
    );
  }
}

extension WithSavedCheckMarkThemeBuildContextProps on BuildContext {
  WithSavedCheckMarkTheme get withSavedCheckMarkTheme =>
      Theme.of(this).extension<WithSavedCheckMarkTheme>()!;
  Color get overlayColor => withSavedCheckMarkTheme.overlayColor;
  Color get iconColor => withSavedCheckMarkTheme.iconColor;
  double get overlayWidth => withSavedCheckMarkTheme.overlayWidth;
  double get overlayHeight => withSavedCheckMarkTheme.overlayHeight;
  double get iconSize => withSavedCheckMarkTheme.iconSize;
  double get iconLeftOffset => withSavedCheckMarkTheme.iconLeftOffset;
}
