import 'package:flutter/material.dart';

import '../../features/find_new_book/presentation/widgets/bottom_drawer_content_theme.dart';
import '../../features/find_new_book/presentation/widgets/with_saved_check_mark_theme.dart';
import '../../features/manage_books/presentation/pages/main_screen_theme.dart';
import '../../features/manage_books/presentation/pages/splash_screen_theme.dart';
import '../../features/manage_books/presentation/widgets/books_list_theme.dart';
import '../../features/manage_books/presentation/widgets/bottom_nav_bar_theme.dart';
import '../../features/settings/presentation/bloc/settings_state.dart';
import '../../features/settings/presentation/pages/settings_screen_theme.dart';
import '../../features/settings/presentation/widgets/book_size_slider_theme.dart';
import '../../features/settings/presentation/widgets/export_books_tile_theme.dart';
import '../../features/settings/presentation/widgets/import_books_tile_theme.dart';
import '../../features/settings/presentation/widgets/reading_goal_slider_theme.dart';
import '../../features/stats/presentation/pages/stats_screen_theme.dart';
import '../../features/stats/presentation/widgets/books_per_month_theme.dart';
import '../../features/stats/presentation/widgets/books_per_state_theme.dart';
import '../../features/stats/presentation/widgets/books_per_year_theme.dart';
import '../../features/stats/presentation/widgets/other_stats_theme.dart';
import '../widgets/book_authors/book_authors_theme.dart';
import '../widgets/book_title/book_title_theme.dart';
import '../widgets/card_footer/card_footer_theme.dart';
import '../widgets/menu_button/menu_button_theme.dart';
import 'design_system.dart';

ThemeData lightTheme() => HomerTheme(ThemeMode.light).data();

ThemeData darkTheme() => HomerTheme(ThemeMode.dark).data();

final class HomerTheme {
  HomerTheme(this.mode);

  final ThemeMode mode;

  ThemeData data() {
    final colors = mode == ThemeMode.light
        ? HomerDesign.light
        : HomerDesign.dark;
    final base = ThemeData(
      colorScheme: colors.toColorScheme(),
      useMaterial3: true,
      sliderTheme: _noThumbSlider(),
    );
    return base.copyWith(
      extensions: [
        bookAuthorsTheme(base),
        bookTitleTheme(base),
        cardFooterTheme(base),
        menuButtonTheme(base),
        booksListTheme(base),
        bottomNavBarTheme(base),
        mainScreenTheme(base),
        splashScreenTheme(base),
        withSavedCheckMarkTheme(base),
        bottomDrawerTheme(base),
        bookSizeSliderTheme(base),
        exportBooksTileTheme(base),
        importBooksTileTheme(base),
        settingsScreenTheme(base),
        booksPerMonthTheme(base),
        booksPerYearTheme(base),
        booksPerStateTheme(base),
        otherStatsTheme(base),
        statsScreenTheme(base),
        readingGoalSliderTheme(base),
      ],
    );
  }

  SliderThemeData _noThumbSlider() {
    return SliderThemeData(overlayShape: SliderComponentShape.noThumb);
  }
}

ThemeMode themeMode(SettingsState state) {
  return state.useSystemTheme
      ? ThemeMode.system
      : state.useDarkTheme
      ? ThemeMode.dark
      : ThemeMode.light;
}
