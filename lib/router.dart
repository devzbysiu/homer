import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'features/manage_books/presentation/pages/home.dart';
import 'features/manage_books/presentation/pages/splash_screen.dart';
import 'features/settings/presentation/pages/settings_screen.dart';
import 'features/stats/presentation/pages/stats_screen.dart';
import 'logger.dart';

GoRouter router() {
  return GoRouter(
    observers: [TalkerRouteObserver(log)],
    routes: [
      GoRoute(path: '/', builder: (_, _) => const SplashScreen()),
      GoRoute(
        path: '/home',
        builder: (_, _) => const Home(),
        routes: [
          GoRoute(path: 'settings', builder: (_, _) => SettingsScreen()),
          GoRoute(path: 'stats', builder: (_, _) => const StatsScreen()),
          GoRoute(
            path: 'logs',
            builder: (_, _) => TalkerScreen(talker: log),
          ),
        ],
      ),
    ],
  );
}
