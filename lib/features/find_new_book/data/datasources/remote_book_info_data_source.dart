import 'dart:convert';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../models/remote_book_info_dto.dart';

abstract class RemoteBookInfoDataSource {
  Future<RemoteBookInfoDTO> getFromUrl(String url);
}

final class ScraperDataSource implements RemoteBookInfoDataSource {
  @override
  Future<RemoteBookInfoDTO> getFromUrl(String url) async {
    final apiUrl = 'https://dante-backend.shuttleapp.rs?url=$url';
    final resp = await http.get(tryParse(apiUrl)).timeout(30.seconds);
    final json = tryJsonDecode(utf8.decode(resp.bodyBytes));
    final remoteBookInfoDTO = tryFromJson(json);
    return Future.value(remoteBookInfoDTO);
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

  RemoteBookInfoDTO tryFromJson(Map<String, dynamic> json) {
    try {
      return RemoteBookInfoDTO.fromJson(json);
    } catch (e) {
      throw InvalidJsonException(e);
    }
  }
}
