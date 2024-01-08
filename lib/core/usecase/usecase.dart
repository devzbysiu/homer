import 'package:equatable/equatable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Result<Type, Failure>> call(Params params);
}

final class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
