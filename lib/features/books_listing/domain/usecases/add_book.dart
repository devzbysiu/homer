import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/mappers/remote_books_mapper.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../book_summary/domain/entities/local_book.dart';
import '../../../search/domain/entities/remote_book.dart';
import '../../../tags_manager/domain/entities/tag.dart';
import '../repositories/local_books_repository.dart';

final class AddBook extends UseCase<Unit, AddParams> {
  AddBook(this.booksRepo);

  final LocalBooksRepository booksRepo;

  @override
  Future<Result<Unit, Failure>> call(AddParams params) async {
    final book = toLocalBook(
      params.remoteBook,
      params.bookState,
      params.selectedTags,
    );
    return await booksRepo.add(book);
  }
}

final class AddParams {
  AddParams({
    required this.remoteBook,
    required this.bookState,
    required this.selectedTags,
  });

  final RemoteBook remoteBook;

  final LocalBookState bookState;

  final Set<Tag> selectedTags;
}
