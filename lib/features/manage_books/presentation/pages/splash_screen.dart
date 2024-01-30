
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utils/theme.dart';

final class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen(
      duration: const Duration(milliseconds: 2000),
      backgroundColor: context.primaryContainer,
      splashScreenBody: Center(
        child: Lottie.asset(
          'assets/splash-screen.json',
          repeat: false,
        ),
      ),
      onEnd: () => context.go('/home'),
    );
  }
}