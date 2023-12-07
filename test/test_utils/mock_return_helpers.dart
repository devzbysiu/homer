import 'package:homer/core/error/failures.dart';
import 'package:multiple_result/multiple_result.dart';

Future<T> withIt<T>(T value) {
  return Future.value(value);
}

Future<Unit> withUnit() {
  return Future.value(unit);
}

Future<Result<T, Failure>> withSuccess<T>(T value) {
  return Future.value(Success(value));
}

Future<Result<T, Failure>> withFailure<T>(Failure failure) {
  return Future.value(Error(failure));
}
