import 'package:homer/core/entities/book.dart';
import 'package:homer/core/entities/tag.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/features/find_new_book/data/models/external_book_dto.dart';
import 'package:homer/features/find_new_book/data/models/external_book_info_dto.dart';
import 'package:homer/features/find_new_book/domain/entities/external_book_info.dart';
import 'package:homer/features/settings/data/models/settings_dto.dart';
import 'package:homer/features/settings/domain/entities/settings.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';

import 'fakes.dart';
import 'mocks.mocks.dart';

MockBooksRepository makeMockBooksRepo() {
  final mockRepo = MockBooksRepository();
  provideDummy<Result<List<Book>, Failure>>(const Success([]));
  // NOTE: BooksRepo does not return `Unit`, but some tests need this dummy
  provideDummy<Result<Unit, Failure>>(const Success(unit));
  return mockRepo;
}

MockBackupRepository makeMockBackupRepo() {
  final mockRepo = MockBackupRepository();
  provideDummy<Result<List<Book>, Failure>>(const Success([]));
  // NOTE: BackupRepo does not return `Unit`, but some tests need this dummy
  provideDummy<Result<Unit, Failure>>(const Success(unit));
  return mockRepo;
}

MockTagsRepository makeMockTagsRepo() {
  final mockRepo = MockTagsRepository();
  provideDummy<Result<List<Tag>, Failure>>(const Success([]));
  return mockRepo;
}

MockSettingsRepository makeMockSettingsRepo() {
  final mockRepo = MockSettingsRepository();
  provideDummy<Result<Settings, Failure>>(Success(Settings.makeDefault()));
  // NOTE: SettingsRepo does not return `Unit`, but some tests need this dummy
  provideDummy<Result<Unit, Failure>>(const Success(unit));
  return mockRepo;
}

MockExternalBooksRepository makeMockExternalBooksRepo() {
  final mockRepo = MockExternalBooksRepository();
  provideDummy<Result<List<Book>, Failure>>(Success([fakeBook()]));
  provideDummy<Result<Book, Failure>>(Success(fakeBook()));
  return mockRepo;
}

MockExternalBookInfoRepository makeMockExternalBookInfoRepo() {
  final mockRepo = MockExternalBookInfoRepository();
  provideDummy<Result<ExternalBookInfo, Failure>>(
    Success(fakeExternalBookInfo()),
  );
  // NOTE: ExternalBookInfoRepo does not return `Book`, but some tests need this dummy
  provideDummy<Result<Book, Failure>>(Success(fakeBook()));
  return mockRepo;
}

MockBackupDataSource makeMockBackupDataSource() {
  final mockDataSource = MockBackupDataSource();
  provideDummy<Unit>(unit);
  return mockDataSource;
}

MockExternalBookInfoDataSource makeMockBookInfoDataSource() {
  final mock = MockExternalBookInfoDataSource();
  provideDummy<ExternalBookInfoDTO>(fakeExternalBookInfoDTO());
  return mock;
}

MockSettingsDataSource makeMockSettingsDataSource() {
  final mock = MockSettingsDataSource();
  provideDummy<SettingsDTO>(fakeSettingsDTO());
  // NOTE: SettingsDatasource does not return `Unit`, but some tests need this dummy
  provideDummy<Unit>(unit);
  return mock;
}

MockBooksDataSource makeMockBooksDataSource() {
  final mock = MockBooksDataSource();
  provideDummy<Unit>(unit);
  return mock;
}

MockExternalBooksDataSource makeMockExternalBooksDataSource() {
  final mock = MockExternalBooksDataSource();
  provideDummy<ExternalBookDTO>(fakeExternalBookDTO());
  return mock;
}
