import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'features/manage_books/presentation/pages/home.dart';
import 'features/settings/presentation/bloc/settings_bloc.dart';
import 'features/settings/presentation/pages/settings_screen.dart';

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Home();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'settings',
          builder: (BuildContext context, GoRouterState state) {
            return const SettingsScreen();
          },
        ),
      ],
    ),
  ],
);

final class Homer extends StatelessWidget {
  const Homer({super.key});

  @override
  Widget build(BuildContext context) {
    const scheme = FlexScheme.amber;
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        final themeMode = state.isSystemThemeOn
            ? ThemeMode.system
            : state.isDarkThemeOn
                ? ThemeMode.dark
                : ThemeMode.light;
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Homer',
          theme: FlexThemeData.light(scheme: scheme, useMaterial3: true),
          darkTheme: FlexThemeData.dark(scheme: scheme, useMaterial3: true),
          themeMode: themeMode,
          routerConfig: _router,
          // TODO: Take care of splash screen
          // home: FlutterSplashScreen(
          //   duration: const Duration(milliseconds: 2000),
          //   nextScreen: const Home(),
          //   backgroundColor: Colors.white,
          //   splashScreenBody: Center(
          //     child: Lottie.asset(
          //       'assets/splash-screen.json',
          //       repeat: false,
          //     ),
          //   ),
          // ),
        );
      },
    );
  }
}
