import 'package:books_finder/books_finder.dart' as bf;
import 'package:dartz/dartz.dart';
import 'package:homer/core/entities/book.dart';
import 'package:homer/core/entities/tag.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/features/backup_and_restore/data/models/backup_book_dto.dart';
import 'package:homer/features/backup_and_restore/data/models/backup_tag_dto.dart';
import 'package:homer/features/find_new_book/data/models/external_book_dto.dart';
import 'package:homer/features/find_new_book/data/models/external_book_info_dto.dart';
import 'package:multiple_result/multiple_result.dart' as mr;

Future<T> withIt<T>(T books) {
  return Future.value(books);
}

Future<mr.Unit> withUnit() {
  return Future.value(mr.unit);
}

Future<mr.Result<T, Failure>> withSuccess<T>(T books) {
  return Future.value(mr.Success(books));
}

Future<mr.Result<T, Failure>> withFailure<T>(Failure failure) {
  return Future.value(mr.Error(failure));
}
