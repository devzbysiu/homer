import 'dart:convert';
import 'package:flutter/services.dart';

import 'features/manage_books/presentation/bloc/navigation/app_tab_state.dart';

int defaultTabIdx() => AppTab.reading.index;

enum Env { dev, prod }

final class AppConfig {
  AppConfig({required String bookInfoUrl}) : _apiUrl = bookInfoUrl;

  final String _apiUrl;

  static Future<AppConfig> forEnvironment(Env env) async {
    final contents = await rootBundle.loadString(
      'assets/config/${envString(env)}.json',
    );

    final json = jsonDecode(contents);

    return AppConfig(bookInfoUrl: json['bookInfoUrl']);
  }

  String bookInfoEndpoint(String websiteUrl) => '$_apiUrl?url=$websiteUrl';
}

String envString(Env env) {
  switch (env) {
    case Env.dev:
      return 'dev';
    case Env.prod:
      return 'prod';
  }
}
