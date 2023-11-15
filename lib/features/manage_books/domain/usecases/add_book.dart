import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../tags_manager/domain/entities/tag.dart';
import '../../data/mappers/to_books.dart';
import '../entities/book.dart';
import '../repositories/books_repository.dart';

final class AddBook extends UseCase<Unit, AddParams> {
  AddBook(this.booksRepo);

  final BooksRepository booksRepo;

  @override
  Future<Result<Unit, Failure>> call(AddParams params) async {
    final book = toBook(
      params.book,
      params.bookState,
      params.selectedTags,
    );
    return await booksRepo.add(book);
  }
}

final class AddParams {
  AddParams({
    required this.book,
    required this.bookState,
    required this.selectedTags,
  });

  final Book book;

  final BookState bookState;

  final List<Tag> selectedTags;
}
