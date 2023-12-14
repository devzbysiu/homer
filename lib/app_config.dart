// lib/app_config.dart
import 'dart:convert';
import 'package:flutter/services.dart';

enum Env { dev, prod }

class AppConfig {
  AppConfig({required String bookInfoUrl}) : _apiUrl = bookInfoUrl;

  final String _apiUrl;

  static Future<AppConfig> forEnvironment(Env env) async {
    final contents = await rootBundle.loadString(
      'assets/config/${_envString(env)}.json',
    );

    final json = jsonDecode(contents);

    return AppConfig(bookInfoUrl: json['bookInfoUrl']);
  }

  String bookInfoEndpoint(String websiteUrl) => '$_apiUrl?url=$websiteUrl';
}

String _envString(Env env) {
  switch (env) {
    case Env.dev:
      return 'dev';
    case Env.prod:
      return 'prod';
  }
}
