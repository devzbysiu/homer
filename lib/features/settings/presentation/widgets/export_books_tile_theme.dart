import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../../core/theme/design_system.dart';

part 'export_books_tile_theme.tailor.dart';

@tailorMixin
final class ExportBooksTileTheme extends ThemeExtension<ExportBooksTileTheme>
    with _$ExportBooksTileThemeTailorMixin {
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

  ExportBooksTileTheme({
    required this.splashColor,
    required this.titleStyle,
    required this.contentPaddingTop,
    required this.contentPaddingLeft,
    required this.contentPaddingRight,
    required this.titleLeftPadding,
  });
}

ExportBooksTileTheme exportBooksTileTheme(ThemeData data) {
  final c = data.brightness == Brightness.light
      ? HomerDesign.light
      : HomerDesign.dark;
  return ExportBooksTileTheme(
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
