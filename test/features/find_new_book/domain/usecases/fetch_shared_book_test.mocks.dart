// Mocks generated by Mockito 5.4.3 from annotations
// in homer/test/features/find_new_book/domain/usecases/fetch_shared_book_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:homer/core/entities/book.dart' as _i9;
import 'package:homer/core/error/failures.dart' as _i6;
import 'package:homer/features/find_new_book/domain/entities/external_book_info.dart'
    as _i5;
import 'package:homer/features/find_new_book/domain/repositories/external_book_info_repository.dart'
    as _i2;
import 'package:homer/features/find_new_book/domain/repositories/external_books_repository.dart'
    as _i8;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;
import 'package:multiple_result/multiple_result.dart' as _i4;

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

/// A class which mocks [ExternalBookInfoRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockExternalBookInfoRepository extends _i1.Mock
    implements _i2.ExternalBookInfoRepository {
  MockExternalBookInfoRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<_i5.ExternalBookInfo, _i6.Failure>> fromUrl(
          String? url) =>
      (super.noSuchMethod(
        Invocation.method(
          #fromUrl,
          [url],
        ),
        returnValue:
            _i3.Future<_i4.Result<_i5.ExternalBookInfo, _i6.Failure>>.value(
                _i7.dummyValue<_i4.Result<_i5.ExternalBookInfo, _i6.Failure>>(
          this,
          Invocation.method(
            #fromUrl,
            [url],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i5.ExternalBookInfo, _i6.Failure>>);
}

/// A class which mocks [ExternalBooksRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockExternalBooksRepository extends _i1.Mock
    implements _i8.ExternalBooksRepository {
  MockExternalBooksRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<List<_i9.Book>, _i6.Failure>> search(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #search,
          [query],
        ),
        returnValue: _i3.Future<_i4.Result<List<_i9.Book>, _i6.Failure>>.value(
            _i7.dummyValue<_i4.Result<List<_i9.Book>, _i6.Failure>>(
          this,
          Invocation.method(
            #search,
            [query],
          ),
        )),
      ) as _i3.Future<_i4.Result<List<_i9.Book>, _i6.Failure>>);

  @override
  _i3.Future<_i4.Result<_i9.Book, _i6.Failure>> fromBookInfo(
          _i5.ExternalBookInfo? bookInfo) =>
      (super.noSuchMethod(
        Invocation.method(
          #fromBookInfo,
          [bookInfo],
        ),
        returnValue: _i3.Future<_i4.Result<_i9.Book, _i6.Failure>>.value(
            _i7.dummyValue<_i4.Result<_i9.Book, _i6.Failure>>(
          this,
          Invocation.method(
            #fromBookInfo,
            [bookInfo],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i9.Book, _i6.Failure>>);
}
