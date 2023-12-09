import 'dart:async';

import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/external_book_info.dart';
import '../../domain/repositories/external_book_info_repository.dart';
import '../datasources/external_book_info_data_source.dart';
import '../mappers/to_external_book_info.dart';

final class ExternalBookInfoRepo implements ExternalBookInfoRepository {
  ExternalBookInfoRepo({required this.bookInfoDataSource});

  final ExternalBookInfoDataSource bookInfoDataSource;

  @override
  Future<Result<ExternalBookInfo, Failure>> fromUrl(String url) async {
    if (url.trim().isEmpty) {
      return Future.value(
        Error(InvalidUrlSharedFailure(url)),
      );
    }

    try {
      final bookInfoDTO = await bookInfoDataSource.getFromUrl(url);
      if (bookInfoDTO.isbn.isNone()) {
        return Future.value(Error(NoIsbnFailure(url)));
      }
      return Future.value(Success(toExternalBookInfo(bookInfoDTO)));
    } on InvalidUrlException catch (e) {
      return Future.value(Error(InvalidUrlSharedFailure(e.url)));
    } on NotJsonException {
      return Future.value(Error(ServerFailure()));
    } on WrongJsonException catch (_) {
      return Future.value(Error(ServerFailure()));
    } on TimeoutException {
      return Future.value(const Error(TimeoutOnApiResponseFailure()));
    }
  }
}
