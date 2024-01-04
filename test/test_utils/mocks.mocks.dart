// Mocks generated by Mockito 5.4.3 from annotations
// in homer/test/test_utils/mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:homer/core/entities/book.dart' as _i5;
import 'package:homer/core/error/failures.dart' as _i6;
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
    as _i17;
import 'package:homer/features/find_new_book/domain/repositories/external_book_info_repository.dart'
    as _i18;
import 'package:homer/features/find_new_book/domain/repositories/external_books_repository.dart'
    as _i16;
import 'package:homer/features/find_new_book/domain/usecases/fetch_shared_book.dart'
    as _i25;
import 'package:homer/features/find_new_book/domain/usecases/search_for_books.dart'
    as _i24;
import 'package:homer/features/manage_books/data/datasources/books_data_source.dart'
    as _i11;
import 'package:homer/features/manage_books/data/models/book_dto.dart' as _i12;
import 'package:homer/features/manage_books/domain/repositories/books_repository.dart'
    as _i2;
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
          _i15.ReplaceAllParams? params) =>
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
  _i3.Future<_i4.Result<_i5.Book, _i6.Failure>> fromBookInfo(
          _i17.ExternalBookInfo? bookInfo) =>
      (super.noSuchMethod(
        Invocation.method(
          #fromBookInfo,
          [bookInfo],
        ),
        returnValue: _i3.Future<_i4.Result<_i5.Book, _i6.Failure>>.value(
            _i7.dummyValue<_i4.Result<_i5.Book, _i6.Failure>>(
          this,
          Invocation.method(
            #fromBookInfo,
            [bookInfo],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i5.Book, _i6.Failure>>);
}

/// A class which mocks [ExternalBookInfoRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockExternalBookInfoRepository extends _i1.Mock
    implements _i18.ExternalBookInfoRepository {
  MockExternalBookInfoRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<_i17.ExternalBookInfo, _i6.Failure>> fromUrl(
          String? url) =>
      (super.noSuchMethod(
        Invocation.method(
          #fromUrl,
          [url],
        ),
        returnValue:
            _i3.Future<_i4.Result<_i17.ExternalBookInfo, _i6.Failure>>.value(
                _i7.dummyValue<_i4.Result<_i17.ExternalBookInfo, _i6.Failure>>(
          this,
          Invocation.method(
            #fromUrl,
            [url],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i17.ExternalBookInfo, _i6.Failure>>);
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
          _i25.SharedBookParams? params) =>
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
