import 'dart:convert';
import 'package:flutter/services.dart';

import 'features/manage_books/presentation/bloc/navigation/app_tab_state.dart';

int defaultTabIdx() => AppTab.reading.index;

enum Env { dev, prod }

final class AppConfig {
  AppConfig({required this.apiBaseUrl});

  final String apiBaseUrl;

  static Future<AppConfig> forEnvironment(Env env) async {
    final contents = await rootBundle.loadString(
      'assets/config/${envString(env)}.json',
    );

    final json = jsonDecode(contents);

    return AppConfig(apiBaseUrl: json['apiBaseUrl']);
  }
}

String envString(Env env) {
  switch (env) {
    case Env.dev:
      return 'dev';
    case Env.prod:
      return 'prod';
  }
}
