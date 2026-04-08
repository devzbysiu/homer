import 'package:flutter/material.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Design system entry point
// ─────────────────────────────────────────────────────────────────────────────

/// Homer design tokens — single source of truth for all visual values.
///
/// All [ThemeExtension] factories must source every value from here instead
/// of deriving from [ThemeData] at runtime.  This makes the whole visual
/// design immune to third-party [Theme] overrides and trivially restyled from
/// one file.
///
/// Usage in theme factories:
/// ```dart
/// FooTheme fooTheme(ThemeData data) {
///   final c = data.brightness == Brightness.light
///       ? HomerDesign.light
///       : HomerDesign.dark;
///   return FooTheme(
///     bgColor:   c.bgPrimary,
///     accent:    c.accentPrimary,
///     textStyle: HomerDesign.typography.bodyMedium,
///     padding:   HomerDesign.spacing.m,
///     radius:    HomerDesign.radii.m,
///   );
/// }
/// ```
abstract final class HomerDesign {
  static final light = HomerLightColors();
  static final dark = HomerDarkColors();
  static const typography = HomerTypography();
  static const spacing = HomerSpacing();
  static const radii = HomerRadii();
  static const icons = HomerIcons();
  static const elevation = HomerElevation();
  static const shadows = HomerShadows();
}

// ─────────────────────────────────────────────────────────────────────────────
// 1. Core Colors — raw tonal palette
// ─────────────────────────────────────────────────────────────────────────────

/// Raw hex palette for Homer's red M3 color scheme.
///
/// Do not use these directly in widgets or theme factories — use the
/// semantic wrappers [HomerLightColors] / [HomerDarkColors] instead.
/// This separation lets you remap tokens without touching widget code.
final class HomerCoreColors {
  const HomerCoreColors();

  // ── Red (primary hue, M3 tonal palette) ──────────────────────────────────
  Color get red10 => const Color(0xFF410002);
  Color get red20 => const Color(0xFF690005);
  Color get red30 => const Color(0xFF93000A);
  Color get red40 => const Color(0xFFB3261E); // light-mode primary
  Color get red50 => const Color(0xFFCC4133);
  Color get red60 => const Color(0xFFE6594A);
  Color get red70 => const Color(0xFFFF8579);
  Color get red80 => const Color(0xFFFFB4AB); // dark-mode primary
  Color get red90 =>
      const Color(0xFFF9DEDC); // light primaryContainer (FlexScheme.redM3)
  Color get red95 => const Color(0xFFFFEDEA);
  Color get red99 => const Color(0xFFFFFBFF);

  // ── Red variant / secondary hue ───────────────────────────────────────────
  Color get redVariant30 => const Color(0xFF442927);
  Color get redVariant40 => const Color(0xFF775652);
  Color get redVariant50 => const Color(0xFF5D3F3C);
  Color get redVariant60 => const Color(0xFFE7BDB9);
  Color get redVariant90 => const Color(0xFFFFDAD6);

  // ── Neutral ───────────────────────────────────────────────────────────────
  Color get neutral0 => const Color(0xFFFFFFFF);
  Color get neutral10 => const Color(0xFF1C1B1F);
  Color get neutral20 => const Color(0xFF313033);
  Color get neutral30 => const Color(0xFF484649);
  Color get neutral40 => const Color(0xFF605D62);
  Color get neutral50 => const Color(0xFF787579);
  Color get neutral60 => const Color(0xFF939094);
  Color get neutral70 => const Color(0xFFAEAAB0);
  Color get neutral80 => const Color(0xFFCAC4D0);
  Color get neutral90 => const Color(0xFFE6E0E9);
  Color get neutral95 => const Color(0xFFF4EFF4);
  Color get neutral99 => const Color(0xFFFFFBFE);
  Color get neutral100 => const Color(0xFFFFFFFF);

  // ── Neutral variant (warm-tinted grays matching the red hue) ─────────────
  Color get neutralVariant30 => const Color(0xFF534342);
  Color get neutralVariant40 => const Color(0xFF6C5F5E);
  Color get neutralVariant50 => const Color(0xFF857370);
  Color get neutralVariant60 => const Color(0xFFA08C89);
  Color get neutralVariant80 => const Color(0xFFD8C2BF);
  Color get neutralVariant90 => const Color(0xFFF5DDDB);

  // ── Fixed / always-the-same ───────────────────────────────────────────────
  Color get black => const Color(0xFF000000);
  Color get white => const Color(0xFFFFFFFF);
  Color get transparent => const Color(0x00000000);

  // Book-length category colors (always fixed)
  Color get green => const Color(0xFF4CAF50);
  Color get blue => const Color(0xFF2196F3);
  Color get orange => const Color(0xFFFF9800);
}

// ─────────────────────────────────────────────────────────────────────────────
// 2. Semantic Colors — abstract interface
// ─────────────────────────────────────────────────────────────────────────────

/// Semantic color contract that every theme variant must fulfill.
///
/// Properties are grouped by purpose (background, accent, text, chart …)
/// so that consumers read naturally: `c.bgSurface`, `c.textPrimary`,
/// `c.accentPrimary`, `c.chartShortBook`.
abstract class HomerSemanticColors {
  // ── Backgrounds ────────────────────────────────────────────────────────────
  Color get bgPrimary; // screen / scaffold background
  Color get bgSecondary; // card / sheet / drawer background
  Color get bgSurface; // surface — same as bgSecondary in M3
  Color get bgOverlay; // scrim / transparent overlay on covers

  // ── Accent (primary brand color — the reds) ───────────────────────────────
  Color get accentPrimary; // buttons, active icons, sliders
  Color get accentOnPrimary; // text / icons drawn on accentPrimary
  Color get accentContainer; // subtle tinted background (chips, banners)
  Color get accentOnContainer; // text on accentContainer
  Color get accentContainerLight; // accentContainer lightened — gradients
  Color get accentSecondary; // secondary brand accent
  Color get accentOnSecondary;
  Color get accentTertiary; // used for save-button etc.

  // ── Text ───────────────────────────────────────────────────────────────────
  Color get textPrimary; // body text on bg
  Color get textSecondary; // muted / caption text
  Color get textOnAccent; // text on accent-colored backgrounds
  Color get textOnDark; // text / icons on dark image surfaces

  // ── Icons ──────────────────────────────────────────────────────────────────
  Color get iconPrimary;
  Color get iconUnselected; // nav bar inactive icons

  // ── Borders ────────────────────────────────────────────────────────────────
  Color get borderAccent;

  // ── State colors ───────────────────────────────────────────────────────────
  Color get error;
  Color get onError;
  Color get errorContainer;
  Color get success; // positive / "read" state
  Color get shadow;

  // ── Search bar ────────────────────────────────────────────────────────────
  Color get searchBar; // search bar fill
  Color get searchBarDrawer; // search bar inside bottom drawer

  // ── Chart / data-vis ──────────────────────────────────────────────────────
  Color get chartPrimary; // chart line / bar color
  Color get chartPrimaryLight; // lighter variant — filled area
  Color get chartSurface; // chart background (typically transparent)
  Color get chartGoal; // goal dashed line
  Color get chartTooltipBg; // tooltip background

  // Book-length category colors (same in both themes)
  Color get chartShortBook;
  Color get chartMediumBook;
  Color get chartLongBook;
  Color get chartBooksRead; // read-state segment color

  // ── Tag chips ─────────────────────────────────────────────────────────────
  Color get tagInactiveBg;
  Color get tagInactiveText;
  Color get tagActiveText;

  // ── ColorScheme ───────────────────────────────────────────────────────────

  /// Converts these tokens into a Flutter [ColorScheme] so that built-in
  /// Material widgets (buttons, dialogs, etc.) stay consistent with the app.
  ColorScheme toColorScheme();
}

// ─────────────────────────────────────────────────────────────────────────────
// 3a. Light theme
// ─────────────────────────────────────────────────────────────────────────────

final class HomerLightColors implements HomerSemanticColors {
  static const _c = HomerCoreColors();

  @override
  Color get bgPrimary => _c.neutral99;

  @override
  Color get bgSecondary => _c.neutral99;

  @override
  Color get bgSurface => _c.neutral99;

  @override
  Color get bgOverlay => _c.transparent;

  @override
  Color get accentPrimary => _c.red40;

  @override
  Color get accentOnPrimary => _c.white;

  @override
  Color get accentContainer => const Color(0xFFF9DEDC); // FlexScheme.redM3 primaryContainer

  @override
  Color get accentOnContainer => _c.red10;

  @override
  Color get accentContainerLight => const Color(0xFFFFF5F4); // primaryContainer.lighten(20) ≈ near-white

  @override
  Color get accentSecondary => _c.redVariant40;

  @override
  Color get accentOnSecondary => _c.white;

  @override
  Color get accentTertiary => _c.redVariant40;

  @override
  Color get textPrimary => _c.neutral10;

  @override
  Color get textSecondary => _c.neutralVariant40;

  @override
  Color get textOnAccent => _c.white;

  @override
  Color get textOnDark => _c.white;

  @override
  Color get iconPrimary => _c.neutral10;

  @override
  Color get iconUnselected => _c.neutralVariant40;

  @override
  Color get borderAccent => _c.red40;

  @override
  Color get error => _c.red40;

  @override
  Color get onError => _c.white;

  @override
  Color get errorContainer => _c.red90;

  @override
  Color get success => _c.green;

  @override
  Color get shadow => _c.black;

  @override
  Color get searchBar => _c.neutral99;

  @override
  Color get searchBarDrawer => const Color(0xFFFCF4F4); // surface.lighten(20) ≈ warmer white

  @override
  Color get chartPrimary => _c.red40;

  @override
  Color get chartPrimaryLight => _c.red60;

  @override
  Color get chartSurface => _c.transparent;

  @override
  Color get chartGoal => _c.neutral10;

  @override
  Color get chartTooltipBg => _c.red40;

  @override
  Color get chartShortBook => _c.green;

  @override
  Color get chartMediumBook => _c.blue;

  @override
  Color get chartLongBook => _c.orange;

  @override
  Color get chartBooksRead => _c.green;

  @override
  Color get tagInactiveBg => _c.neutral99;

  @override
  Color get tagInactiveText => _c.neutral10;

  @override
  Color get tagActiveText => _c.white;

  @override
  ColorScheme toColorScheme() => ColorScheme(
    brightness: Brightness.light,
    primary: accentPrimary,
    onPrimary: accentOnPrimary,
    primaryContainer: accentContainer,
    onPrimaryContainer: accentOnContainer,
    secondary: accentSecondary,
    onSecondary: accentOnSecondary,
    secondaryContainer: _c.redVariant90,
    onSecondaryContainer: _c.redVariant30,
    surface: bgSurface,
    onSurface: textPrimary,
    error: error,
    onError: onError,
    errorContainer: errorContainer,
    onErrorContainer: accentOnContainer,
    shadow: shadow,
  );
}

// ─────────────────────────────────────────────────────────────────────────────
// 3b. Dark theme
// ─────────────────────────────────────────────────────────────────────────────

final class HomerDarkColors implements HomerSemanticColors {
  static const _c = HomerCoreColors();

  @override
  Color get bgPrimary => const Color(0xFF141213);

  @override
  Color get bgSecondary => const Color(0xFF141213);

  @override
  Color get bgSurface => const Color(0xFF141213);

  @override
  Color get bgOverlay => _c.transparent;

  @override
  Color get accentPrimary => _c.red80;

  @override
  Color get accentOnPrimary => _c.red20;

  @override
  Color get accentContainer => _c.red30;

  @override
  Color get accentOnContainer => _c.red90;

  @override
  Color get accentContainerLight => const Color(0xFFC43312); // red30 lightened

  @override
  Color get accentSecondary => _c.redVariant60;

  @override
  Color get accentOnSecondary => _c.redVariant30;

  @override
  Color get accentTertiary => _c.redVariant60;

  @override
  Color get textPrimary => _c.neutral90;

  @override
  Color get textSecondary => _c.neutralVariant80;

  @override
  Color get textOnAccent => _c.white;

  @override
  Color get textOnDark => _c.white;

  @override
  Color get iconPrimary => _c.neutral90;

  @override
  Color get iconUnselected => _c.neutral60;

  @override
  Color get borderAccent => _c.red80;

  @override
  Color get error => const Color(0xFFF2B8B5);

  @override
  Color get onError => const Color(0xFF601410);

  @override
  Color get errorContainer => const Color(0xFF8C1D18);

  @override
  Color get success => _c.green;

  @override
  Color get shadow => _c.black;

  @override
  Color get searchBar => const Color(0xFF141213);

  @override
  Color get searchBarDrawer => const Color(0xFF3D3A3B); // surface.lighten(20)

  @override
  Color get chartPrimary => _c.red80;

  @override
  Color get chartPrimaryLight => _c.red70;

  @override
  Color get chartSurface => _c.transparent;

  @override
  Color get chartGoal => _c.neutral90;

  @override
  Color get chartTooltipBg => _c.red80;

  @override
  Color get chartShortBook => _c.green;

  @override
  Color get chartMediumBook => _c.blue;

  @override
  Color get chartLongBook => _c.orange;

  @override
  Color get chartBooksRead => _c.green;

  @override
  Color get tagInactiveBg => const Color(0xFF141213);

  @override
  Color get tagInactiveText => _c.neutral90;

  @override
  Color get tagActiveText => _c.white;

  @override
  ColorScheme toColorScheme() => ColorScheme(
    brightness: Brightness.dark,
    primary: accentPrimary,
    onPrimary: accentOnPrimary,
    primaryContainer: accentContainer,
    onPrimaryContainer: accentOnContainer,
    secondary: accentSecondary,
    onSecondary: accentOnSecondary,
    secondaryContainer: _c.redVariant50,
    onSecondaryContainer: _c.redVariant90,
    surface: bgSurface,
    onSurface: textPrimary,
    error: error,
    onError: onError,
    errorContainer: errorContainer,
    onErrorContainer: accentOnContainer,
    shadow: shadow,
  );
}

// ─────────────────────────────────────────────────────────────────────────────
// 4. Typography
// ─────────────────────────────────────────────────────────────────────────────

/// Font metrics and composed [TextStyle]s.
///
/// Styles have explicit [fontSize] / [fontWeight] values and are therefore
/// immune to any ancestor [Theme] override.
final class HomerTypography {
  const HomerTypography();

  /// Set a font-family name here (e.g. `'Lato'`) to change the whole app.
  /// [null] means the platform default (Roboto on Android, SF Pro on iOS).
  String? get fontFamily => null;

  // Font sizes — Material Design 3 type scale
  double get fontSizeBodySmall => 12.0;
  double get fontSizeBodyMedium => 14.0;
  double get fontSizeBodyLarge => 16.0;
  double get fontSizeTitleSmall => 14.0;
  double get fontSizeTitleMedium => 16.0;
  double get fontSizeHeadlineSmall => 24.0;
  double get fontSizeHeadlineMedium => 28.0;

  // Semantic sizes beyond the standard scale
  double get fontSizeSnackbar => 18.0;
  double get fontSizeStatValue => 60.0;

  // Font weights
  FontWeight get weightRegular => FontWeight.w400;
  FontWeight get weightMedium => FontWeight.w500;
  FontWeight get weightSemiBold => FontWeight.w600;

  // Composed text styles — explicit sizes, unaffected by ambient Theme.
  // decoration: TextDecoration.none is required to prevent inherited or
  // system-level decorations (e.g. Android text-classifier underlines) from
  // leaking into widgets.
  TextStyle get bodySmall => TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeBodySmall,
    fontWeight: weightRegular,
    decoration: TextDecoration.none,
  );
  TextStyle get bodyMedium => TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeBodyMedium,
    fontWeight: weightRegular,
    decoration: TextDecoration.none,
  );
  TextStyle get bodyLarge => TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeBodyLarge,
    fontWeight: weightRegular,
    decoration: TextDecoration.none,
  );
  TextStyle get titleSmall => TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeTitleSmall,
    fontWeight: weightMedium,
    decoration: TextDecoration.none,
  );
  TextStyle get titleMedium => TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeTitleMedium,
    fontWeight: weightMedium,
    decoration: TextDecoration.none,
  );
  TextStyle get headlineSmall => TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeHeadlineSmall,
    fontWeight: weightRegular,
    decoration: TextDecoration.none,
  );
  TextStyle get headlineMedium => TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeHeadlineMedium,
    fontWeight: weightRegular,
    decoration: TextDecoration.none,
  );
}

// ─────────────────────────────────────────────────────────────────────────────
// 5. Spacing
// ─────────────────────────────────────────────────────────────────────────────

final class HomerSpacing {
  const HomerSpacing();

  double get xxs => 2.0;
  double get xs => 4.0;
  double get s => 8.0;
  double get m => 16.0;
  double get l => 24.0;
  double get xl => 32.0;
  double get xxl => 48.0;
}

// ─────────────────────────────────────────────────────────────────────────────
// 6. Border Radii
// ─────────────────────────────────────────────────────────────────────────────

final class HomerRadii {
  const HomerRadii();

  double get xs => 5.0;
  double get s => 6.0;
  double get m => 8.0;
  double get l => 45.0;
}

// ─────────────────────────────────────────────────────────────────────────────
// 7. Icons
// ─────────────────────────────────────────────────────────────────────────────

final class HomerIcons {
  const HomerIcons();

  double get xs => 15.0;
  double get s => 20.0;
  double get m => 25.0;
  double get l => 30.0;
  double get xl => 35.0;
}

// ─────────────────────────────────────────────────────────────────────────────
// 8. Elevation
// ─────────────────────────────────────────────────────────────────────────────

final class HomerElevation {
  const HomerElevation();

  double get s => 3.0;
  double get m => 4.0;
}

// ─────────────────────────────────────────────────────────────────────────────
// 9. Shadows
// ─────────────────────────────────────────────────────────────────────────────

final class HomerShadows {
  const HomerShadows();

  double get spreadRadius => 1.0;
  double get blurRadius => 4.0;
  Offset get offset => const Offset(0, 3);
}
