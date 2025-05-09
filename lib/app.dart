import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'core/utils/theme.dart';
import 'features/manage_books/presentation/pages/home.dart';
import 'features/manage_books/presentation/pages/splash_screen.dart';
import 'features/settings/presentation/bloc/settings_bloc.dart';
import 'features/settings/presentation/pages/settings_screen.dart';
import 'features/stats/presentation/pages/stats_screen.dart';

final class Homer extends StatelessWidget {
  const Homer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return DynamicColorBuilder(
          builder: (lightDynamic, darkDynamic) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: kDebugMode,
              title: 'Homer',
              theme: lightTheme(lightDynamic, darkDynamic),
              darkTheme: darkTheme(lightDynamic, darkDynamic),
              themeMode: themeMode(state),
              routerConfig: _router(),
            );
          },
        );
      },
    );
  }
}

GoRouter _router() {
  return GoRouter(
    routes: [
      GoRoute(path: '/', builder: (_, _) => const SplashScreen()),
      GoRoute(
        path: '/home',
        builder: (_, _) => const Home(),
        routes: [
          GoRoute(path: 'settings', builder: (_, _) => SettingsScreen()),
          GoRoute(path: 'stats', builder: (_, _) => const StatsScreen()),
        ],
      ),
    ],
  );
}
