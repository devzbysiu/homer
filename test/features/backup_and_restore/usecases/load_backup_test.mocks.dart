// Mocks generated by Mockito 5.4.2 from annotations
// in homer/test/features/backup_and_restore/usecases/load_backup_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:homer/core/entities/book.dart' as _i5;
import 'package:homer/core/error/failures.dart' as _i6;
import 'package:homer/features/backup_and_restore/domain/repositories/backup_repository.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;
import 'package:multiple_result/multiple_result.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [BackupRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockBackupRepository extends _i1.Mock implements _i2.BackupRepository {
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
