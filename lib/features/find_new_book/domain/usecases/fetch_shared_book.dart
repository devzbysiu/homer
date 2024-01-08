import 'package:equatable/equatable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/external_book_info_repository.dart';
import '../repositories/external_books_repository.dart';

typedef FetchSharedBook = UseCase<Book, FetchParams>;

final class FetchSharedBookImpl implements FetchSharedBook {
  FetchSharedBookImpl(this.bookInfoRepo, this.booksRepo);

  final ExternalBookInfoRepository bookInfoRepo;

  final ExternalBooksRepository booksRepo;

  @override
  Future<Result<Book, Failure>> call(FetchParams params) async {
    final result = await bookInfoRepo.fromUrl(params.url);
    if (result.isError()) return Error(result.tryGetError()!);
    final bookInfo = result.tryGetSuccess()!;
    return await booksRepo.fromBookInfo(bookInfo);
  }
}

final class FetchParams extends Equatable {
  const FetchParams({required this.url});

  final String url;

  @override
  List<Object> get props => [url];
}
