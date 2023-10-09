import 'package:event_bus/event_bus.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../presentation/bloc/search_for_books_bloc.dart';

final class CloseSearchBar extends UseCase<Unit, NoParams> {
  CloseSearchBar(this.eventBus);

  final EventBus eventBus;

  @override
  Future<Result<Unit, Failure>> call(NoParams params) {
    eventBus.fire(BookPicked());
    return Future.value(const Success(unit));
  }
}
