import 'package:event_bus/event_bus.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../presentation/bloc/select_suggestion/suggested_book_bloc.dart';

final class CloseSearchBar extends UseCase<Unit, NoParams> {
  CloseSearchBar(this.eventBus);

  @override
  Future<Result<Unit, Failure>> call(NoParams params) {
    eventBus.fire(BookPicked());
    return Future.value(const Success(unit));
  }

  final EventBus eventBus;
}
