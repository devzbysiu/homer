import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homer/core/error/exceptions.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/features/find_new_book/data/repositories/external_book_info_repo.dart';
import 'package:mockito/mockito.dart';

import '../../../../test_utils/assertion_helpers.dart';
import '../../../../test_utils/copy_with_extensions.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_factories.dart';
import '../../../../test_utils/mock_return_helpers.dart';

void main() {
  group('fromUrl', () {
    test('should return failure when url is empty', () async {
      // given
      final bookInfoDataSource = makeMockBookInfoDatasource();

      final repo = ExternalBookInfoRepo(dataSource: bookInfoDataSource);

      const emptyUrl = '';

      // when
      final result = await repo.fromUrl(emptyUrl);

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, const InvalidUrlSharedFailure(emptyUrl));
    });

    test('should return failure when url is broken', () async {
      // given
      const brokenUrl = 'ht//\\#';
      final bookInfoDataSource = makeMockBookInfoDatasource();
      when(bookInfoDataSource.getFromWebsite(brokenUrl)).thenThrow(
        const InvalidUrlException(brokenUrl),
      );

      final repo = ExternalBookInfoRepo(dataSource: bookInfoDataSource);

      // when
      final result = await repo.fromUrl(brokenUrl);

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, const InvalidUrlSharedFailure(brokenUrl));
    });

    test('should return failure when response is not json', () async {
      // given
      final url = fakeUrl();
      final bookInfoDataSource = makeMockBookInfoDatasource();
      when(bookInfoDataSource.getFromWebsite(url)).thenThrow(
        const NotJsonException('not important'),
      );

      final repo = ExternalBookInfoRepo(dataSource: bookInfoDataSource);

      // when
      final result = await repo.fromUrl(url);

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, ServerFailure());
    });

    test('should return failure when wrong json was returned', () async {
      // given
      final url = fakeUrl();
      final bookInfoDataSource = makeMockBookInfoDatasource();
      when(bookInfoDataSource.getFromWebsite(url)).thenThrow(
        const WrongJsonException('not important'),
      );

      final repo = ExternalBookInfoRepo(dataSource: bookInfoDataSource);

      // when
      final result = await repo.fromUrl(url);

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, ServerFailure());
    });

    test('should return failure when request timed out', () async {
      // given
      final url = fakeUrl();
      final bookInfoDataSource = makeMockBookInfoDatasource();
      when(bookInfoDataSource.getFromWebsite(url)).thenThrow(
        TimeoutException('not important'),
      );

      final repo = ExternalBookInfoRepo(dataSource: bookInfoDataSource);

      // when
      final result = await repo.fromUrl(url);

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, const TimeoutOnApiResponseFailure());
    });

    test('should return failure when no isbn was found', () async {
      // given
      final url = fakeUrl();
      final bookInfoDataSource = makeMockBookInfoDatasource();
      when(bookInfoDataSource.getFromWebsite(url)).thenAnswer(
        (_) => withIt(fakeExternalBookInfoDTO().copyWith(
          isbn10: none(),
          isbn13: none(),
        )),
      );

      final repo = ExternalBookInfoRepo(dataSource: bookInfoDataSource);

      // when
      final result = await repo.fromUrl(url);

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, NoIsbnFailure(url));
    });

    test('should return success', () async {
      // given
      final url = fakeUrl();
      final bookInfoDTO = fakeExternalBookInfoDTO();
      final bookInfoDataSource = makeMockBookInfoDatasource();
      when(bookInfoDataSource.getFromWebsite(url)).thenAnswer(
        (_) => withIt(bookInfoDTO),
      );

      final repo = ExternalBookInfoRepo(dataSource: bookInfoDataSource);

      // when
      final result = await repo.fromUrl(url);

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!, externalBookInfoFromDTO(bookInfoDTO));
    });
  });
}
