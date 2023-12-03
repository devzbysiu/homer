import 'dart:convert';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../models/book_info_dto.dart';

abstract class RemoteBookInfoDataSource {
  Future<BookInfoDTO> getFromUrl(String url);
}

final class ScraperDataSource implements RemoteBookInfoDataSource {
  @override
  Future<BookInfoDTO> getFromUrl(String url) async {
    final apiUrl = 'https://dante-backend.shuttleapp.rs?url=$url';
    final resp = await http.get(tryParse(apiUrl)).timeout(30.seconds);
    final json = tryJsonDecode(utf8.decode(resp.bodyBytes));
    final bookInfoDTO = tryFromJson(json);
    return Future.value(bookInfoDTO);
  }

  Uri tryParse(String apiUrl) {
    try {
      return Uri.parse(apiUrl);
    } on FormatException {
      throw InvalidUrlException(apiUrl);
    }
  }

  Map<String, dynamic> tryJsonDecode(String body) {
    try {
      return jsonDecode(body);
    } on FormatException catch (e) {
      throw IncorrectResponseException(e.message);
    }
  }

  BookInfoDTO tryFromJson(Map<String, dynamic> json) {
    try {
      return BookInfoDTO.fromJson(json);
    } catch (e) {
      throw InvalidJsonException(e);
    }
  }
}
