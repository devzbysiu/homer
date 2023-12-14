import 'dart:async';

import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../logger.dart';
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
      log.e('URL cannot be empty');
      return Future.value(
        Error(InvalidUrlSharedFailure(url)),
      );
    }

    try {
      log.i('Fetching info from: $url');
      final bookInfoDTO = await bookInfoDataSource.getFromWebsite(url);
      if (bookInfoDTO.isbn.isNone()) {
        return Future.value(Error(NoIsbnFailure(url)));
      }
      return Future.value(Success(toExternalBookInfo(bookInfoDTO)));
    } on InvalidUrlException catch (e) {
      log.e('The url $url is invalid: $e');
      return Future.value(Error(InvalidUrlSharedFailure(e.url)));
    } on NotJsonException {
      log.e('Response was not a JSON');
      return Future.value(Error(ServerFailure()));
    } on WrongJsonException catch (e) {
      log.e('Wrong JSON: $e');
      return Future.value(Error(ServerFailure()));
    } on TimeoutException {
      log.e('Waiting too long for book info response, timeout');
      return Future.value(const Error(TimeoutOnApiResponseFailure()));
    }
  }
}
