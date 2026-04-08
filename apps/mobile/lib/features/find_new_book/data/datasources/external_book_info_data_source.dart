import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:homer_api_client/homer_api_client.dart' as api;

import '../../../../core/error/exceptions.dart';
import '../../../../logger.dart';
import '../models/external_book_info_dto.dart';

abstract class ExternalBookInfoDataSource {
  Future<ExternalBookInfoDTO> getFromWebsite(String url);
}

final class ScraperDataSource implements ExternalBookInfoDataSource {
  ScraperDataSource({required this.bookInfoApi});

  final api.BookInfoApi bookInfoApi;

  @override
  Future<ExternalBookInfoDTO> getFromWebsite(String websiteUrl) async {
    log.i('Fetching book info from: $websiteUrl');
    try {
      final response = await bookInfoApi.getBookInfoFromUrl(url: websiteUrl);
      final bookInfo = response.data!;
      return ExternalBookInfoDTO(
        title: bookInfo.title,
        isbn10: _toOption(bookInfo.isbn10),
        isbn13: _toOption(bookInfo.isbn13),
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.response?.statusCode == 504) {
        throw TimeoutException(null, const Duration(seconds: 30));
      }
      if (e.response?.statusCode == 400) {
        throw InvalidUrlException(websiteUrl);
      }
      throw WrongJsonException(e);
    }
  }
}

Option<String> _toOption(String? value) {
  return (value == null || value.isEmpty) ? none() : some(value);
}
