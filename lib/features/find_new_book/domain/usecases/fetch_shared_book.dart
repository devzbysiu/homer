import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/remote_book.dart';
import '../repositories/remote_books_repository.dart';

final class FetchSharedBook extends UseCase<RemoteBook, SharedBookParams> {
  FetchSharedBook(this.booksRepo);

  final RemoteBooksRepository booksRepo;

  @override
  Future<Result<RemoteBook, Failure>> call(SharedBookParams params) async {
    return await booksRepo.fromUrl(params.url);
  }
}

final class SharedBookParams {
  SharedBookParams({required this.url});

  final String url;
}
