import 'package:equatable/equatable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/books_repository.dart';

typedef UpdateBook = UseCase<Unit, UpdateParams>;

final class UpdateBookImpl implements UpdateBook {
  UpdateBookImpl(this.booksRepo);

  final BooksRepository booksRepo;

  @override
  Future<Result<Unit, Failure>> call(UpdateParams params) async {
    return await booksRepo.update(params.modified);
  }
}

final class UpdateParams extends Equatable {
  const UpdateParams({required this.modified});

  final Book modified;

  @override
  List<Object> get props => [modified];
}
