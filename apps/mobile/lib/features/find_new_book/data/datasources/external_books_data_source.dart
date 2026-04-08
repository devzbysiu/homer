import 'package:dio/dio.dart';
import 'package:homer_api_client/homer_api_client.dart' as api;

import '../../../../core/error/exceptions.dart';
import '../mappers/to_external_book_dto.dart';
import '../models/external_book_dto.dart';

abstract class ExternalBooksDataSource {
  Future<List<ExternalBookDTO>> getFromQuery(String query);

  Future<ExternalBookDTO> getFromIsbn(String isbn);
}

final class ExternalBooks implements ExternalBooksDataSource {
  ExternalBooks({required this.booksApi});

  final api.BooksApi booksApi;

  @override
  Future<List<ExternalBookDTO>> getFromQuery(String query) async {
    try {
      final response = await booksApi.searchBooks(q: query);
      return (response.data ?? []).map(toExternalBookDTO).toList();
    } on DioException catch (e) {
      throw BooksQueryException('$e');
    }
  }

  @override
  Future<ExternalBookDTO> getFromIsbn(String isbn) async {
    try {
      final response = await booksApi.getBookByIsbn(isbn: isbn);
      return toExternalBookDTO(response.data!);
    } on DioException catch (e) {
      switch (e.response?.statusCode) {
        case 404:
          throw NoBookFoundException(isbn);
        case 422:
          throw TooManyBooksFoundException(isbn);
        default:
          throw BooksQueryException('$e');
      }
    }
  }
}
