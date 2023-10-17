import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'features/books_listing/presentation/pages/home.dart';

final class Homer extends StatelessWidget {
  const Homer({super.key});

  @override
  Widget build(BuildContext context) {
    const scheme = FlexScheme.amber;
    const themeMode = ThemeMode.dark;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Homer',
      theme: FlexThemeData.light(scheme: scheme),
      darkTheme: FlexThemeData.dark(scheme: scheme),
      themeMode: themeMode,
      home: const Home(),
    );
  }
}
