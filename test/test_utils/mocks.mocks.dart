// Mocks generated by Mockito 5.4.5 from annotations
// in homer/test/test_utils/mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:homer/core/entities/book.dart' as _i5;
import 'package:homer/core/entities/tag.dart' as _i39;
import 'package:homer/core/error/failures.dart' as _i6;
import 'package:homer/core/orchestrator/bus.dart' as _i49;
import 'package:homer/core/orchestrator/events.dart' as _i50;
import 'package:homer/core/usecase/usecase.dart' as _i29;
import 'package:homer/features/backup_and_restore/data/datasources/backup_data_source.dart'
    as _i8;
import 'package:homer/features/backup_and_restore/data/models/backup_book_dto.dart'
    as _i9;
import 'package:homer/features/backup_and_restore/domain/repositories/backup_repository.dart'
    as _i10;
import 'package:homer/features/backup_and_restore/domain/usecases/load_backup.dart'
    as _i13;
import 'package:homer/features/backup_and_restore/domain/usecases/make_backup.dart'
    as _i14;
import 'package:homer/features/backup_and_restore/domain/usecases/replace_all_books.dart'
    as _i15;
import 'package:homer/features/find_new_book/data/datasources/external_book_info_data_source.dart'
    as _i19;
import 'package:homer/features/find_new_book/data/datasources/external_books_data_source.dart'
    as _i21;
import 'package:homer/features/find_new_book/data/models/external_book_dto.dart'
    as _i22;
import 'package:homer/features/find_new_book/data/models/external_book_info_dto.dart'
    as _i20;
import 'package:homer/features/find_new_book/domain/entities/external_book_info.dart'
    as _i18;
import 'package:homer/features/find_new_book/domain/repositories/external_book_info_repository.dart'
    as _i17;
import 'package:homer/features/find_new_book/domain/repositories/external_books_repository.dart'
    as _i16;
import 'package:homer/features/find_new_book/domain/usecases/fetch_shared_book.dart'
    as _i25;
import 'package:homer/features/find_new_book/domain/usecases/fetch_shared_book_info.dart'
    as _i51;
import 'package:homer/features/find_new_book/domain/usecases/search_and_check_saved.dart'
    as _i24;
import 'package:homer/features/manage_books/data/datasources/books_data_source.dart'
    as _i11;
import 'package:homer/features/manage_books/data/models/book_dto.dart' as _i12;
import 'package:homer/features/manage_books/domain/repositories/books_repository.dart'
    as _i2;
import 'package:homer/features/manage_books/domain/usecases/add_book.dart'
    as _i27;
import 'package:homer/features/manage_books/domain/usecases/delete_books.dart'
    as _i26;
import 'package:homer/features/manage_books/domain/usecases/filter_books.dart'
    as _i31;
import 'package:homer/features/manage_books/domain/usecases/list_books.dart'
    as _i28;
import 'package:homer/features/manage_books/domain/usecases/update_book.dart'
    as _i30;
import 'package:homer/features/settings/data/datasources/settings_data_source.dart'
    as _i32;
import 'package:homer/features/settings/data/models/settings_dto.dart' as _i33;
import 'package:homer/features/settings/domain/entities/settings.dart' as _i35;
import 'package:homer/features/settings/domain/repositories/settings_repository.dart'
    as _i34;
import 'package:homer/features/settings/domain/usecases/load_settings.dart'
    as _i37;
import 'package:homer/features/settings/domain/usecases/save_settings.dart'
    as _i36;
import 'package:homer/features/stats/domain/entities/books_per_month_data.dart'
    as _i44;
import 'package:homer/features/stats/domain/entities/books_per_state_data.dart'
    as _i46;
import 'package:homer/features/stats/domain/entities/books_per_year_data.dart'
    as _i42;
import 'package:homer/features/stats/domain/entities/other_stats_data.dart'
    as _i48;
import 'package:homer/features/stats/domain/usecases/load_books_per_month.dart'
    as _i43;
import 'package:homer/features/stats/domain/usecases/load_books_per_state.dart'
    as _i45;
import 'package:homer/features/stats/domain/usecases/load_books_per_year.dart'
    as _i41;
import 'package:homer/features/stats/domain/usecases/load_other_stats.dart'
    as _i47;
import 'package:homer/features/tags_manager/domain/repositories/tags_repository.dart'
    as _i38;
import 'package:homer/features/tags_manager/domain/usecases/list_tags.dart'
    as _i40;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;
import 'package:multiple_result/multiple_result.dart' as _i4;
import 'package:share_handler_platform_interface/share_handler_platform_interface.dart'
    as _i23;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [BooksRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockBooksRepository extends _i1.Mock implements _i2.BooksRepository {
  MockBooksRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<List<_i5.Book>, _i6.Failure>> listAll() =>
      (super.noSuchMethod(
        Invocation.method(
          #listAll,
          [],
        ),
        returnValue: _i3.Future<_i4.Result<List<_i5.Book>, _i6.Failure>>.value(
            _i7.dummyValue<_i4.Result<List<_i5.Book>, _i6.Failure>>(
          this,
          Invocation.method(
            #listAll,
            [],
          ),
        )),
      ) as _i3.Future<_i4.Result<List<_i5.Book>, _i6.Failure>>);

  @override
  _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>> add(_i5.Book? book) =>
      (super.noSuchMethod(
        Invocation.method(
          #add,
          [book],
        ),
        returnValue: _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>>.value(
            _i7.dummyValue<_i4.Result<_i4.Unit, _i6.Failure>>(
          this,
          Invocation.method(
            #add,
            [book],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>>);

  @override
  _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>> replaceAll(
          List<_i5.Book>? books) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceAll,
          [books],
        ),
        returnValue: _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>>.value(
            _i7.dummyValue<_i4.Result<_i4.Unit, _i6.Failure>>(
          this,
          Invocation.method(
            #replaceAll,
            [books],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>>);

  @override
  _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>> update(_i5.Book? modified) =>
      (super.noSuchMethod(
        Invocation.method(
          #update,
          [modified],
        ),
        returnValue: _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>>.value(
            _i7.dummyValue<_i4.Result<_i4.Unit, _i6.Failure>>(
          this,
          Invocation.method(
            #update,
            [modified],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>>);

  @override
  _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>> delete(List<_i5.Book>? books) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [books],
        ),
        returnValue: _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>>.value(
            _i7.dummyValue<_i4.Result<_i4.Unit, _i6.Failure>>(
          this,
          Invocation.method(
            #delete,
            [books],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>>);
}

/// A class which mocks [BackupDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockBackupDataSource extends _i1.Mock implements _i8.BackupDataSource {
  MockBackupDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i9.BackupBookDTO>> loadAll(String? path) =>
      (super.noSuchMethod(
        Invocation.method(
          #loadAll,
          [path],
        ),
        returnValue:
            _i3.Future<List<_i9.BackupBookDTO>>.value(<_i9.BackupBookDTO>[]),
      ) as _i3.Future<List<_i9.BackupBookDTO>>);

  @override
  _i3.Future<_i4.Unit> saveAll(
    String? path,
    List<_i9.BackupBookDTO>? books,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveAll,
          [
            path,
            books,
          ],
        ),
        returnValue: _i3.Future<_i4.Unit>.value(_i7.dummyValue<_i4.Unit>(
          this,
          Invocation.method(
            #saveAll,
            [
              path,
              books,
            ],
          ),
        )),
      ) as _i3.Future<_i4.Unit>);
}

/// A class which mocks [BackupRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockBackupRepository extends _i1.Mock implements _i10.BackupRepository {
  MockBackupRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<List<_i5.Book>, _i6.Failure>> loadAll(String? path) =>
      (super.noSuchMethod(
        Invocation.method(
          #loadAll,
          [path],
        ),
        returnValue: _i3.Future<_i4.Result<List<_i5.Book>, _i6.Failure>>.value(
            _i7.dummyValue<_i4.Result<List<_i5.Book>, _i6.Failure>>(
          this,
          Invocation.method(
            #loadAll,
            [path],
          ),
        )),
      ) as _i3.Future<_i4.Result<List<_i5.Book>, _i6.Failure>>);

  @override
  _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>> saveAll(
    String? path,
    List<_i5.Book>? books,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveAll,
          [
            path,
            books,
          ],
        ),
        returnValue: _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>>.value(
            _i7.dummyValue<_i4.Result<_i4.Unit, _i6.Failure>>(
          this,
          Invocation.method(
            #saveAll,
            [
              path,
              books,
            ],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>>);
}

/// A class which mocks [BooksDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockBooksDataSource extends _i1.Mock implements _i11.BooksDataSource {
  MockBooksDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i12.BookDTO>> getBooks() => (super.noSuchMethod(
        Invocation.method(
          #getBooks,
          [],
        ),
        returnValue: _i3.Future<List<_i12.BookDTO>>.value(<_i12.BookDTO>[]),
      ) as _i3.Future<List<_i12.BookDTO>>);

  @override
  _i3.Future<_i4.Unit> add(_i12.BookDTO? book) => (super.noSuchMethod(
        Invocation.method(
          #add,
          [book],
        ),
        returnValue: _i3.Future<_i4.Unit>.value(_i7.dummyValue<_i4.Unit>(
          this,
          Invocation.method(
            #add,
            [book],
          ),
        )),
      ) as _i3.Future<_i4.Unit>);

  @override
  _i3.Future<_i4.Unit> replaceAll(List<_i12.BookDTO>? books) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceAll,
          [books],
        ),
        returnValue: _i3.Future<_i4.Unit>.value(_i7.dummyValue<_i4.Unit>(
          this,
          Invocation.method(
            #replaceAll,
            [books],
          ),
        )),
      ) as _i3.Future<_i4.Unit>);

  @override
  _i3.Future<_i4.Unit> update(_i12.BookDTO? book) => (super.noSuchMethod(
        Invocation.method(
          #update,
          [book],
        ),
        returnValue: _i3.Future<_i4.Unit>.value(_i7.dummyValue<_i4.Unit>(
          this,
          Invocation.method(
            #update,
            [book],
          ),
        )),
      ) as _i3.Future<_i4.Unit>);

  @override
  _i3.Future<_i4.Unit> delete(List<_i12.BookDTO>? bookDTOs) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [bookDTOs],
        ),
        returnValue: _i3.Future<_i4.Unit>.value(_i7.dummyValue<_i4.Unit>(
          this,
          Invocation.method(
            #delete,
            [bookDTOs],
          ),
        )),
      ) as _i3.Future<_i4.Unit>);
}

/// A class which mocks [LoadBackup].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoadBackup extends _i1.Mock implements _i13.LoadBackup {
  MockLoadBackup() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<List<_i5.Book>, _i6.Failure>> call(
          _i13.RestoreParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i3.Future<_i4.Result<List<_i5.Book>, _i6.Failure>>.value(
            _i7.dummyValue<_i4.Result<List<_i5.Book>, _i6.Failure>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i3.Future<_i4.Result<List<_i5.Book>, _i6.Failure>>);
}

/// A class which mocks [MakeBackup].
///
/// See the documentation for Mockito's code generation for more information.
class MockMakeBackup extends _i1.Mock implements _i14.MakeBackup {
  MockMakeBackup() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>> call(
          _i14.BackupParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>>.value(
            _i7.dummyValue<_i4.Result<_i4.Unit, _i6.Failure>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>>);
}

/// A class which mocks [ReplaceAllBooks].
///
/// See the documentation for Mockito's code generation for more information.
class MockReplaceAllBooks extends _i1.Mock implements _i15.ReplaceAllBooks {
  MockReplaceAllBooks() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>> call(
          _i15.ReplaceParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>>.value(
            _i7.dummyValue<_i4.Result<_i4.Unit, _i6.Failure>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>>);
}

/// A class which mocks [ExternalBooksRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockExternalBooksRepository extends _i1.Mock
    implements _i16.ExternalBooksRepository {
  MockExternalBooksRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<List<_i5.Book>, _i6.Failure>> search(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #search,
          [query],
        ),
        returnValue: _i3.Future<_i4.Result<List<_i5.Book>, _i6.Failure>>.value(
            _i7.dummyValue<_i4.Result<List<_i5.Book>, _i6.Failure>>(
          this,
          Invocation.method(
            #search,
            [query],
          ),
        )),
      ) as _i3.Future<_i4.Result<List<_i5.Book>, _i6.Failure>>);

  @override
  _i3.Future<_i4.Result<_i5.Book, _i6.Failure>> fromIsbn(String? isbn) =>
      (super.noSuchMethod(
        Invocation.method(
          #fromIsbn,
          [isbn],
        ),
        returnValue: _i3.Future<_i4.Result<_i5.Book, _i6.Failure>>.value(
            _i7.dummyValue<_i4.Result<_i5.Book, _i6.Failure>>(
          this,
          Invocation.method(
            #fromIsbn,
            [isbn],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i5.Book, _i6.Failure>>);
}

/// A class which mocks [ExternalBookInfoRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockExternalBookInfoRepository extends _i1.Mock
    implements _i17.ExternalBookInfoRepository {
  MockExternalBookInfoRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<_i18.ExternalBookInfo, _i6.Failure>> fromUrl(
          String? url) =>
      (super.noSuchMethod(
        Invocation.method(
          #fromUrl,
          [url],
        ),
        returnValue:
            _i3.Future<_i4.Result<_i18.ExternalBookInfo, _i6.Failure>>.value(
                _i7.dummyValue<_i4.Result<_i18.ExternalBookInfo, _i6.Failure>>(
          this,
          Invocation.method(
            #fromUrl,
            [url],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i18.ExternalBookInfo, _i6.Failure>>);
}

/// A class which mocks [ExternalBookInfoDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockExternalBookInfoDataSource extends _i1.Mock
    implements _i19.ExternalBookInfoDataSource {
  MockExternalBookInfoDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i20.ExternalBookInfoDTO> getFromWebsite(String? url) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFromWebsite,
          [url],
        ),
        returnValue: _i3.Future<_i20.ExternalBookInfoDTO>.value(
            _i7.dummyValue<_i20.ExternalBookInfoDTO>(
          this,
          Invocation.method(
            #getFromWebsite,
            [url],
          ),
        )),
      ) as _i3.Future<_i20.ExternalBookInfoDTO>);
}

/// A class which mocks [ExternalBooksDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockExternalBooksDataSource extends _i1.Mock
    implements _i21.ExternalBooksDataSource {
  MockExternalBooksDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i22.ExternalBookDTO>> getFromQuery(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFromQuery,
          [query],
        ),
        returnValue: _i3.Future<List<_i22.ExternalBookDTO>>.value(
            <_i22.ExternalBookDTO>[]),
      ) as _i3.Future<List<_i22.ExternalBookDTO>>);

  @override
  _i3.Future<_i22.ExternalBookDTO> getFromIsbn(String? url) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFromIsbn,
          [url],
        ),
        returnValue: _i3.Future<_i22.ExternalBookDTO>.value(
            _i7.dummyValue<_i22.ExternalBookDTO>(
          this,
          Invocation.method(
            #getFromIsbn,
            [url],
          ),
        )),
      ) as _i3.Future<_i22.ExternalBookDTO>);
}

/// A class which mocks [ShareHandlerPlatform].
///
/// See the documentation for Mockito's code generation for more information.
class MockShareHandlerPlatform extends _i1.Mock
    implements _i23.ShareHandlerPlatform {
  MockShareHandlerPlatform() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Stream<_i23.SharedMedia> get sharedMediaStream => (super.noSuchMethod(
        Invocation.getter(#sharedMediaStream),
        returnValue: _i3.Stream<_i23.SharedMedia>.empty(),
      ) as _i3.Stream<_i23.SharedMedia>);

  @override
  _i3.Future<_i23.SharedMedia?> getInitialSharedMedia() => (super.noSuchMethod(
        Invocation.method(
          #getInitialSharedMedia,
          [],
        ),
        returnValue: _i3.Future<_i23.SharedMedia?>.value(),
      ) as _i3.Future<_i23.SharedMedia?>);

  @override
  _i3.Future<void> recordSentMessage({
    required String? conversationIdentifier,
    required String? conversationName,
    String? conversationImageFilePath,
    String? serviceName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #recordSentMessage,
          [],
          {
            #conversationIdentifier: conversationIdentifier,
            #conversationName: conversationName,
            #conversationImageFilePath: conversationImageFilePath,
            #serviceName: serviceName,
          },
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> resetInitialSharedMedia() => (super.noSuchMethod(
        Invocation.method(
          #resetInitialSharedMedia,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

/// A class which mocks [SearchForBooks].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchForBooks extends _i1.Mock implements _i24.SearchForBooks {
  MockSearchForBooks() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<List<_i5.Book>, _i6.Failure>> call(
          _i24.SearchParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i3.Future<_i4.Result<List<_i5.Book>, _i6.Failure>>.value(
            _i7.dummyValue<_i4.Result<List<_i5.Book>, _i6.Failure>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i3.Future<_i4.Result<List<_i5.Book>, _i6.Failure>>);
}

/// A class which mocks [FetchSharedBook].
///
/// See the documentation for Mockito's code generation for more information.
class MockFetchSharedBook extends _i1.Mock implements _i25.FetchSharedBook {
  MockFetchSharedBook() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<_i5.Book, _i6.Failure>> call(
          _i25.FetchBookParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i3.Future<_i4.Result<_i5.Book, _i6.Failure>>.value(
            _i7.dummyValue<_i4.Result<_i5.Book, _i6.Failure>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i5.Book, _i6.Failure>>);
}

/// A class which mocks [DeleteBooks].
///
/// See the documentation for Mockito's code generation for more information.
class MockDeleteBooks extends _i1.Mock implements _i26.DeleteBooks {
  MockDeleteBooks() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>> call(
          _i26.DeleteParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>>.value(
            _i7.dummyValue<_i4.Result<_i4.Unit, _i6.Failure>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>>);
}

/// A class which mocks [AddBook].
///
/// See the documentation for Mockito's code generation for more information.
class MockAddBook extends _i1.Mock implements _i27.AddBook {
  MockAddBook() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>> call(_i27.AddParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>>.value(
            _i7.dummyValue<_i4.Result<_i4.Unit, _i6.Failure>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>>);
}

/// A class which mocks [ListSortedBooks].
///
/// See the documentation for Mockito's code generation for more information.
class MockListSortedBooks extends _i1.Mock implements _i28.ListSortedBooks {
  MockListSortedBooks() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<List<_i5.Book>, _i6.Failure>> call(
          _i29.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i3.Future<_i4.Result<List<_i5.Book>, _i6.Failure>>.value(
            _i7.dummyValue<_i4.Result<List<_i5.Book>, _i6.Failure>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i3.Future<_i4.Result<List<_i5.Book>, _i6.Failure>>);
}

/// A class which mocks [UpdateBook].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpdateBook extends _i1.Mock implements _i30.UpdateBook {
  MockUpdateBook() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>> call(
          _i30.UpdateParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>>.value(
            _i7.dummyValue<_i4.Result<_i4.Unit, _i6.Failure>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>>);
}

/// A class which mocks [FilterBooks].
///
/// See the documentation for Mockito's code generation for more information.
class MockFilterBooks extends _i1.Mock implements _i31.FilterBooks {
  MockFilterBooks() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<List<_i5.Book>, _i6.Failure>> call(
          _i31.FilterParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i3.Future<_i4.Result<List<_i5.Book>, _i6.Failure>>.value(
            _i7.dummyValue<_i4.Result<List<_i5.Book>, _i6.Failure>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i3.Future<_i4.Result<List<_i5.Book>, _i6.Failure>>);
}

/// A class which mocks [SettingsDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockSettingsDataSource extends _i1.Mock
    implements _i32.SettingsDataSource {
  MockSettingsDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Unit> save(_i33.SettingsDTO? settingsDTO) =>
      (super.noSuchMethod(
        Invocation.method(
          #save,
          [settingsDTO],
        ),
        returnValue: _i3.Future<_i4.Unit>.value(_i7.dummyValue<_i4.Unit>(
          this,
          Invocation.method(
            #save,
            [settingsDTO],
          ),
        )),
      ) as _i3.Future<_i4.Unit>);

  @override
  _i3.Future<_i33.SettingsDTO> load() => (super.noSuchMethod(
        Invocation.method(
          #load,
          [],
        ),
        returnValue:
            _i3.Future<_i33.SettingsDTO>.value(_i7.dummyValue<_i33.SettingsDTO>(
          this,
          Invocation.method(
            #load,
            [],
          ),
        )),
      ) as _i3.Future<_i33.SettingsDTO>);
}

/// A class which mocks [SettingsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockSettingsRepository extends _i1.Mock
    implements _i34.SettingsRepository {
  MockSettingsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>> save(_i35.Settings? settings) =>
      (super.noSuchMethod(
        Invocation.method(
          #save,
          [settings],
        ),
        returnValue: _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>>.value(
            _i7.dummyValue<_i4.Result<_i4.Unit, _i6.Failure>>(
          this,
          Invocation.method(
            #save,
            [settings],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>>);

  @override
  _i3.Future<_i4.Result<_i35.Settings, _i6.Failure>> load() =>
      (super.noSuchMethod(
        Invocation.method(
          #load,
          [],
        ),
        returnValue: _i3.Future<_i4.Result<_i35.Settings, _i6.Failure>>.value(
            _i7.dummyValue<_i4.Result<_i35.Settings, _i6.Failure>>(
          this,
          Invocation.method(
            #load,
            [],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i35.Settings, _i6.Failure>>);
}

/// A class which mocks [SaveSettings].
///
/// See the documentation for Mockito's code generation for more information.
class MockSaveSettings extends _i1.Mock implements _i36.SaveSettings {
  MockSaveSettings() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>> call(
          _i36.SettingsParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>>.value(
            _i7.dummyValue<_i4.Result<_i4.Unit, _i6.Failure>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i4.Unit, _i6.Failure>>);
}

/// A class which mocks [LoadSettings].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoadSettings extends _i1.Mock implements _i37.LoadSettings {
  MockLoadSettings() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<_i35.Settings, _i6.Failure>> call(
          _i29.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i3.Future<_i4.Result<_i35.Settings, _i6.Failure>>.value(
            _i7.dummyValue<_i4.Result<_i35.Settings, _i6.Failure>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i35.Settings, _i6.Failure>>);
}

/// A class which mocks [TagsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTagsRepository extends _i1.Mock implements _i38.TagsRepository {
  MockTagsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<List<_i39.Tag>, _i6.Failure>> listAll() =>
      (super.noSuchMethod(
        Invocation.method(
          #listAll,
          [],
        ),
        returnValue: _i3.Future<_i4.Result<List<_i39.Tag>, _i6.Failure>>.value(
            _i7.dummyValue<_i4.Result<List<_i39.Tag>, _i6.Failure>>(
          this,
          Invocation.method(
            #listAll,
            [],
          ),
        )),
      ) as _i3.Future<_i4.Result<List<_i39.Tag>, _i6.Failure>>);
}

/// A class which mocks [ListTags].
///
/// See the documentation for Mockito's code generation for more information.
class MockListTags extends _i1.Mock implements _i40.ListTags {
  MockListTags() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<List<_i39.Tag>, _i6.Failure>> call(
          _i29.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i3.Future<_i4.Result<List<_i39.Tag>, _i6.Failure>>.value(
            _i7.dummyValue<_i4.Result<List<_i39.Tag>, _i6.Failure>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i3.Future<_i4.Result<List<_i39.Tag>, _i6.Failure>>);
}

/// A class which mocks [LoadBooksPerYear].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoadBooksPerYear extends _i1.Mock implements _i41.LoadBooksPerYear {
  MockLoadBooksPerYear() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<_i42.BooksPerYearData, _i6.Failure>> call(
          _i29.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue:
            _i3.Future<_i4.Result<_i42.BooksPerYearData, _i6.Failure>>.value(
                _i7.dummyValue<_i4.Result<_i42.BooksPerYearData, _i6.Failure>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i42.BooksPerYearData, _i6.Failure>>);
}

/// A class which mocks [LoadBooksPerMonth].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoadBooksPerMonth extends _i1.Mock implements _i43.LoadBooksPerMonth {
  MockLoadBooksPerMonth() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<_i44.BooksPerMonthData, _i6.Failure>> call(
          _i29.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue:
            _i3.Future<_i4.Result<_i44.BooksPerMonthData, _i6.Failure>>.value(
                _i7.dummyValue<_i4.Result<_i44.BooksPerMonthData, _i6.Failure>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i44.BooksPerMonthData, _i6.Failure>>);
}

/// A class which mocks [LoadBooksPerState].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoadBooksPerState extends _i1.Mock implements _i45.LoadBooksPerState {
  MockLoadBooksPerState() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<_i46.BooksPerStateData, _i6.Failure>> call(
          _i29.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue:
            _i3.Future<_i4.Result<_i46.BooksPerStateData, _i6.Failure>>.value(
                _i7.dummyValue<_i4.Result<_i46.BooksPerStateData, _i6.Failure>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i46.BooksPerStateData, _i6.Failure>>);
}

/// A class which mocks [LoadOtherStats].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoadOtherStats extends _i1.Mock implements _i47.LoadOtherStats {
  MockLoadOtherStats() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<_i48.OtherStatsData, _i6.Failure>> call(
          _i29.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue:
            _i3.Future<_i4.Result<_i48.OtherStatsData, _i6.Failure>>.value(
                _i7.dummyValue<_i4.Result<_i48.OtherStatsData, _i6.Failure>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i48.OtherStatsData, _i6.Failure>>);
}

/// A class which mocks [Bus].
///
/// See the documentation for Mockito's code generation for more information.
class MockBus extends _i1.Mock implements _i49.Bus {
  MockBus() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void fire<T extends _i50.BusEvent>(T? event) => super.noSuchMethod(
        Invocation.method(
          #fire,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void on<T extends _i50.BusEvent>(void Function(T)? onEvent) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [onEvent],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [FetchSharedBookInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockFetchSharedBookInfo extends _i1.Mock
    implements _i51.FetchSharedBookInfo {
  MockFetchSharedBookInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<_i18.ExternalBookInfo, _i6.Failure>> call(
          _i51.FetchInfoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue:
            _i3.Future<_i4.Result<_i18.ExternalBookInfo, _i6.Failure>>.value(
                _i7.dummyValue<_i4.Result<_i18.ExternalBookInfo, _i6.Failure>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i18.ExternalBookInfo, _i6.Failure>>);
}
