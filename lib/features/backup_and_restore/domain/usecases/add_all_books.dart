import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../books_listing/domain/repositories/local_books_repository.dart';
import '../../data/mappers/restored_book_mapper.dart';
import '../entities/restored_book.dart';

final class AddAllBooks extends UseCase<Unit, AddAllParams> {
  AddAllBooks(this.booksRepo, this.bookMapper);

  final LocalBooksRepository booksRepo;

  final RestoredBookMapper bookMapper;

  @override
  Future<Result<Unit, Failure>> call(AddAllParams params) async {
    final localBooks = bookMapper.toLocalBooks(params.books);
    await booksRepo.addAll(localBooks);
    return Future.value(const Success(unit));
  }
}

final class AddAllParams {
  AddAllParams({required this.books});

  final List<RestoredBook> books;
}
