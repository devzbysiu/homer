// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_authors_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$BookAuthorsThemeTailorMixin on ThemeExtension<BookAuthorsTheme> {
  TextStyle get textStyle;

  @override
  BookAuthorsTheme copyWith({TextStyle? textStyle}) {
    return BookAuthorsTheme(textStyle: textStyle ?? this.textStyle);
  }

  @override
  BookAuthorsTheme lerp(
    covariant ThemeExtension<BookAuthorsTheme>? other,
    double t,
  ) {
    if (other is! BookAuthorsTheme) return this as BookAuthorsTheme;
    return BookAuthorsTheme(
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookAuthorsTheme &&
            const DeepCollectionEquality().equals(textStyle, other.textStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(textStyle),
    );
  }
}

extension BookAuthorsThemeBuildContextProps on BuildContext {
  BookAuthorsTheme get bookAuthorsTheme =>
      Theme.of(this).extension<BookAuthorsTheme>()!;
  TextStyle get textStyle => bookAuthorsTheme.textStyle;
}
