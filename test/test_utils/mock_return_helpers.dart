import 'package:homer/core/error/failures.dart';
import 'package:multiple_result/multiple_result.dart';

Future<T> withIt<T>(T value) async => value;

Future<Unit> withUnit() async => unit;

Future<Result<T, Failure>> withSuccess<T>(T value) async => Success(value);

Future<Result<T, Failure>> withFailure<T>(Failure f) async => Error(f);
