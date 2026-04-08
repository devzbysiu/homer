// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_screen_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$MainScreenThemeTailorMixin on ThemeExtension<MainScreenTheme> {
  Color get searchBarColor;
  Color get gradientStart;
  Color get gradientEnd;
  double get booksListTopPadding;
  double get searchIconRightPadding;

  @override
  MainScreenTheme copyWith({
    Color? searchBarColor,
    Color? gradientStart,
    Color? gradientEnd,
    double? booksListTopPadding,
    double? searchIconRightPadding,
  }) {
    return MainScreenTheme(
      searchBarColor: searchBarColor ?? this.searchBarColor,
      gradientStart: gradientStart ?? this.gradientStart,
      gradientEnd: gradientEnd ?? this.gradientEnd,
      booksListTopPadding: booksListTopPadding ?? this.booksListTopPadding,
      searchIconRightPadding:
          searchIconRightPadding ?? this.searchIconRightPadding,
    );
  }

  @override
  MainScreenTheme lerp(
    covariant ThemeExtension<MainScreenTheme>? other,
    double t,
  ) {
    if (other is! MainScreenTheme) return this as MainScreenTheme;
    return MainScreenTheme(
      searchBarColor: Color.lerp(searchBarColor, other.searchBarColor, t)!,
      gradientStart: Color.lerp(gradientStart, other.gradientStart, t)!,
      gradientEnd: Color.lerp(gradientEnd, other.gradientEnd, t)!,
      booksListTopPadding: t < 0.5
          ? booksListTopPadding
          : other.booksListTopPadding,
      searchIconRightPadding: t < 0.5
          ? searchIconRightPadding
          : other.searchIconRightPadding,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MainScreenTheme &&
            const DeepCollectionEquality().equals(
              searchBarColor,
              other.searchBarColor,
            ) &&
            const DeepCollectionEquality().equals(
              gradientStart,
              other.gradientStart,
            ) &&
            const DeepCollectionEquality().equals(
              gradientEnd,
              other.gradientEnd,
            ) &&
            const DeepCollectionEquality().equals(
              booksListTopPadding,
              other.booksListTopPadding,
            ) &&
            const DeepCollectionEquality().equals(
              searchIconRightPadding,
              other.searchIconRightPadding,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(searchBarColor),
      const DeepCollectionEquality().hash(gradientStart),
      const DeepCollectionEquality().hash(gradientEnd),
      const DeepCollectionEquality().hash(booksListTopPadding),
      const DeepCollectionEquality().hash(searchIconRightPadding),
    );
  }
}

extension MainScreenThemeBuildContextProps on BuildContext {
  MainScreenTheme get mainScreenTheme =>
      Theme.of(this).extension<MainScreenTheme>()!;
  Color get searchBarColor => mainScreenTheme.searchBarColor;
  Color get gradientStart => mainScreenTheme.gradientStart;
  Color get gradientEnd => mainScreenTheme.gradientEnd;
  double get booksListTopPadding => mainScreenTheme.booksListTopPadding;
  double get searchIconRightPadding => mainScreenTheme.searchIconRightPadding;
}
