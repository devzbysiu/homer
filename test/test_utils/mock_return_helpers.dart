import 'package:homer/core/error/failures.dart';
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
