// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'export_books_tile_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$ExportBooksTileThemeTailorMixin
    on ThemeExtension<ExportBooksTileTheme> {
  Color get splashColor;
  TextStyle get titleStyle;
  double get contentPaddingTop;
  double get contentPaddingLeft;
  double get contentPaddingRight;
  double get titleLeftPadding;

  @override
  ExportBooksTileTheme copyWith({
    Color? splashColor,
    TextStyle? titleStyle,
    double? contentPaddingTop,
    double? contentPaddingLeft,
    double? contentPaddingRight,
    double? titleLeftPadding,
  }) {
    return ExportBooksTileTheme(
      splashColor: splashColor ?? this.splashColor,
      titleStyle: titleStyle ?? this.titleStyle,
      contentPaddingTop: contentPaddingTop ?? this.contentPaddingTop,
      contentPaddingLeft: contentPaddingLeft ?? this.contentPaddingLeft,
      contentPaddingRight: contentPaddingRight ?? this.contentPaddingRight,
      titleLeftPadding: titleLeftPadding ?? this.titleLeftPadding,
    );
  }

  @override
  ExportBooksTileTheme lerp(
    covariant ThemeExtension<ExportBooksTileTheme>? other,
    double t,
  ) {
    if (other is! ExportBooksTileTheme) return this as ExportBooksTileTheme;
    return ExportBooksTileTheme(
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
            other is ExportBooksTileTheme &&
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

extension ExportBooksTileThemeBuildContextProps on BuildContext {
  ExportBooksTileTheme get exportBooksTileTheme =>
      Theme.of(this).extension<ExportBooksTileTheme>()!;
  Color get splashColor => exportBooksTileTheme.splashColor;
  TextStyle get titleStyle => exportBooksTileTheme.titleStyle;
  double get contentPaddingTop => exportBooksTileTheme.contentPaddingTop;
  double get contentPaddingLeft => exportBooksTileTheme.contentPaddingLeft;
  double get contentPaddingRight => exportBooksTileTheme.contentPaddingRight;
  double get titleLeftPadding => exportBooksTileTheme.titleLeftPadding;
}
