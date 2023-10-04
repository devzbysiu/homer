import 'package:event_bus/event_bus.dart';
import 'package:homer/core/error/failure.dart';
import 'package:homer/core/usecase/usecase.dart';
import 'package:homer/features/add_new_book/presentation/bloc/select_suggestion/suggested_book_bloc.dart';
import 'package:multiple_result/multiple_result.dart';

final class CloseSearchBar extends UseCase<Unit, NoParams> {
  CloseSearchBar(this.eventBus);

  @override
  Future<Result<Unit, Failure>> call(NoParams params) {
    eventBus.fire(BookPicked());
    return Future.value(const Success(unit));
  }

  final EventBus eventBus;
}