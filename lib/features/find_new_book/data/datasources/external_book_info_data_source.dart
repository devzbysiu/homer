import 'dart:convert';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:http/http.dart' as http;

import '../../../../app_config.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../logger.dart';
import '../models/external_book_info_dto.dart';

abstract class ExternalBookInfoDataSource {
  Future<ExternalBookInfoDTO> getFromWebsite(String url);
}

final class ScraperDataSource implements ExternalBookInfoDataSource {
  ScraperDataSource({required this.config});

  final AppConfig config;

  @override
  Future<ExternalBookInfoDTO> getFromWebsite(String websiteUrl) async {
    final apiUrl = config.bookInfoEndpoint(websiteUrl);
    log.i('fetching book info from: $apiUrl');
    final resp = await http.get(_tryParse(apiUrl)).timeout(30.seconds);
    final json = _tryJsonDecode(utf8.decode(resp.bodyBytes));
    final bookInfoDTO = _tryFromJson(json);
    return Future.value(bookInfoDTO);
  }

  Uri _tryParse(String apiUrl) {
    try {
      return Uri.parse(apiUrl);
    } on FormatException {
      throw InvalidUrlException(apiUrl);
    }
  }

  Map<String, dynamic> _tryJsonDecode(String body) {
    try {
      return jsonDecode(body);
    } on FormatException catch (e) {
      throw NotJsonException(e.message);
    }
  }

  ExternalBookInfoDTO _tryFromJson(Map<String, dynamic> json) {
    try {
      return ExternalBookInfoDTO.fromJson(json);
    } catch (e) {
      throw WrongJsonException(e);
    }
  }
}
