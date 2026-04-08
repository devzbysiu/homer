import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../../core/theme/design_system.dart';

part 'import_books_tile_theme.tailor.dart';

@tailorMixin
final class ImportBooksTileTheme extends ThemeExtension<ImportBooksTileTheme>
    with _$ImportBooksTileThemeTailorMixin {
  @override
  final Color splashColor;

  @override
  final TextStyle titleStyle;

  @override
  final double contentPaddingTop;

  @override
  final double contentPaddingLeft;

  @override
  final double contentPaddingRight;

  @override
  final double titleLeftPadding;

  ImportBooksTileTheme({
    required this.splashColor,
    required this.titleStyle,
    required this.contentPaddingTop,
    required this.contentPaddingLeft,
    required this.contentPaddingRight,
    required this.titleLeftPadding,
  });
}

ImportBooksTileTheme importBooksTileTheme(ThemeData data) {
  final c = data.brightness == Brightness.light
      ? HomerDesign.light
      : HomerDesign.dark;
  return ImportBooksTileTheme(
    splashColor: c.accentContainer,
    titleStyle: HomerDesign.typography.headlineSmall.copyWith(
      color: c.textPrimary,
    ),
    contentPaddingTop: HomerDesign.spacing.s + HomerDesign.spacing.xxs, // 10.0
    contentPaddingLeft: 23.0,
    contentPaddingRight: 25.0,
    titleLeftPadding: HomerDesign.spacing.s,
  );
}
