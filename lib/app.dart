import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'core/utils/extensions/settings_context_ext.dart';
import 'features/books_listing/presentation/pages/home.dart';

final class Homer extends StatelessWidget {
  const Homer({super.key});

  @override
  Widget build(BuildContext context) {
    const scheme = FlexScheme.amber;
    final themeMode = context.isThemeDark() ? ThemeMode.dark : ThemeMode.light;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Homer',
      theme: FlexThemeData.light(scheme: scheme),
      darkTheme: FlexThemeData.dark(scheme: scheme),
      themeMode: themeMode,
      home: FlutterSplashScreen(
        duration: const Duration(milliseconds: 2000),
        nextScreen: const Home(),
        backgroundColor: Colors.white,
        splashScreenBody: Center(
          child: Lottie.asset(
            'assets/splash-screen.json',
            repeat: false,
          ),
        ),
      ),
    );
  }
}
