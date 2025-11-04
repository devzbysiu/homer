// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'import_books_tile_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$ImportBooksTileThemeTailorMixin
    on ThemeExtension<ImportBooksTileTheme> {
  Color get splashColor;
  TextStyle get titleStyle;
  double get contentPaddingTop;
  double get contentPaddingLeft;
  double get contentPaddingRight;
  double get titleLeftPadding;

  @override
  ImportBooksTileTheme copyWith({
    Color? splashColor,
    TextStyle? titleStyle,
    double? contentPaddingTop,
    double? contentPaddingLeft,
    double? contentPaddingRight,
    double? titleLeftPadding,
  }) {
    return ImportBooksTileTheme(
      splashColor: splashColor ?? this.splashColor,
      titleStyle: titleStyle ?? this.titleStyle,
      contentPaddingTop: contentPaddingTop ?? this.contentPaddingTop,
      contentPaddingLeft: contentPaddingLeft ?? this.contentPaddingLeft,
      contentPaddingRight: contentPaddingRight ?? this.contentPaddingRight,
      titleLeftPadding: titleLeftPadding ?? this.titleLeftPadding,
    );
  }

  @override
  ImportBooksTileTheme lerp(
    covariant ThemeExtension<ImportBooksTileTheme>? other,
    double t,
  ) {
    if (other is! ImportBooksTileTheme) return this as ImportBooksTileTheme;
    return ImportBooksTileTheme(
      splashColor: Color.lerp(splashColor, other.splashColor, t)!,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
      contentPaddingTop: t < 0.5 ? contentPaddingTop : other.contentPaddingTop,
      contentPaddingLeft: t < 0.5
          ? contentPaddingLeft
          : other.contentPaddingLeft,
      contentPaddingRight: t < 0.5
          ? contentPaddingRight
          : other.contentPaddingRight,
      titleLeftPadding: t < 0.5 ? titleLeftPadding : other.titleLeftPadding,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ImportBooksTileTheme &&
            const DeepCollectionEquality().equals(
              splashColor,
              other.splashColor,
            ) &&
            const DeepCollectionEquality().equals(
              titleStyle,
              other.titleStyle,
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
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(splashColor),
      const DeepCollectionEquality().hash(titleStyle),
      const DeepCollectionEquality().hash(contentPaddingTop),
      const DeepCollectionEquality().hash(contentPaddingLeft),
      const DeepCollectionEquality().hash(contentPaddingRight),
      const DeepCollectionEquality().hash(titleLeftPadding),
    );
  }
}

extension ImportBooksTileThemeBuildContextProps on BuildContext {
  ImportBooksTileTheme get importBooksTileTheme =>
      Theme.of(this).extension<ImportBooksTileTheme>()!;
  Color get splashColor => importBooksTileTheme.splashColor;
  TextStyle get titleStyle => importBooksTileTheme.titleStyle;
  double get contentPaddingTop => importBooksTileTheme.contentPaddingTop;
  double get contentPaddingLeft => importBooksTileTheme.contentPaddingLeft;
  double get contentPaddingRight => importBooksTileTheme.contentPaddingRight;
  double get titleLeftPadding => importBooksTileTheme.titleLeftPadding;
}
