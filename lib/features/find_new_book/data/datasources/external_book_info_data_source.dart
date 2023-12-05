import 'dart:convert';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../models/external_book_info_dto.dart';

abstract class ExternalBookInfoDataSource {
  Future<ExternalBookInfoDTO> getFromUrl(String url);
}

final class ScraperDataSource implements ExternalBookInfoDataSource {
  @override
  Future<ExternalBookInfoDTO> getFromUrl(String url) async {
    final apiUrl = 'https://dante-backend.shuttleapp.rs?url=$url';
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
      throw IncorrectResponseException(e.message);
    }
  }

  ExternalBookInfoDTO _tryFromJson(Map<String, dynamic> json) {
    try {
      return ExternalBookInfoDTO.fromJson(json);
    } catch (e) {
      throw InvalidJsonException(e);
    }
  }
}
