import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/entities/tag.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/mappers/to_books.dart';
import '../repositories/books_repository.dart';

typedef AddBook = UseCase<Unit, AddParams>;

final class AddBookImpl implements AddBook {
  AddBookImpl(this.booksRepo);

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
