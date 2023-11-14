import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../tags_manager/domain/entities/tag.dart';
import '../../data/mappers/to_local_books.dart';
import '../entities/local_book.dart';
import '../repositories/local_books_repository.dart';

final class AddBook extends UseCase<Unit, AddParams> {
  AddBook(this.booksRepo);

  final LocalBooksRepository booksRepo;

  @override
  Future<Result<Unit, Failure>> call(AddParams params) async {
    final book = toLocalBook(
      params.localBook,
      params.bookState,
      params.selectedTags,
    );
    return await booksRepo.add(book);
  }
}

final class AddParams {
  AddParams({
    required this.localBook,
    required this.bookState,
    required this.selectedTags,
  });

  final LocalBook localBook;

  final BookState bookState;

  final List<Tag> selectedTags;
}
