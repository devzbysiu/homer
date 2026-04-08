import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../core/theme/design_system.dart';

part 'book_authors_theme.tailor.dart';

@tailorMixin
final class BookAuthorsTheme extends ThemeExtension<BookAuthorsTheme>
    with _$BookAuthorsThemeTailorMixin {
  @override
  final TextStyle textStyle;

  BookAuthorsTheme({required this.textStyle});
}

BookAuthorsTheme bookAuthorsTheme(ThemeData data) {
  final c = data.brightness == Brightness.light
      ? HomerDesign.light
      : HomerDesign.dark;
  return BookAuthorsTheme(
    textStyle: HomerDesign.typography.bodyMedium.copyWith(color: c.textPrimary),
  );
}
