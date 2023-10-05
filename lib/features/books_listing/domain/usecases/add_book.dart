import 'package:event_bus/event_bus.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../presentation/bloc/books_bloc.dart';
import '../entities/book.dart';
import '../repositories/books_repository.dart';

final class AddBook extends UseCase<Unit, AddParams> {
  AddBook(this.booksRepo, this.eventBus);

  @override
  Future<Result<Unit, Failure>> call(AddParams params) async {
    eventBus.fire(BookSaved());
    return await booksRepo.add(params.book);
  }

  final BooksRepository booksRepo;

  final EventBus eventBus;
}

final class AddParams {
  AddParams({required this.book});

  final Book book;
}
