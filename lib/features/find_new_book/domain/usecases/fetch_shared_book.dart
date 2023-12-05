import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/external_books_repository.dart';

final class FetchSharedBook extends UseCase<Book, SharedBookParams> {
  FetchSharedBook(this.booksRepo);

  final ExternalBooksRepository booksRepo;

  @override
  Future<Result<Book, Failure>> call(SharedBookParams params) async {
    return await booksRepo.fromUrl(params.url);
  }
}

final class SharedBookParams {
  SharedBookParams({required this.url});

  final String url;
}
