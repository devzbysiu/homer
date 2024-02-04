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

  // TODO: Add check if book is already saved
  @override
  Future<Result<Book, Failure>> call(FetchParams params) async {
    final result = await bookInfoRepo.fromUrl(params.url);
    return await result.when(
      (bookInfo) async => await booksRepo.fromBookInfo(bookInfo),
      (failure) async => Error(failure),
    );
  }
}

final class FetchParams extends Equatable {
  const FetchParams({required this.url});

  final String url;

  @override
  List<Object> get props => [url];
}
