import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'core/utils/theme.dart';
import 'features/settings/presentation/bloc/settings_bloc.dart';
import 'router.dart';

final GoRouter appRouter = router();

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
              routerConfig: appRouter,
            );
          },
        );
      },
    );
  }
}
