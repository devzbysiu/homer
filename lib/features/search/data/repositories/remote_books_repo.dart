import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/remote_book.dart';
import '../../domain/repositories/remote_books_repository.dart';
import '../datasources/remote_books_data_source.dart';
import '../mappers/remote_book_mapper.dart';

final class RemoteBooksRepo implements RemoteBooksRepository {
  RemoteBooksRepo({required this.dataSource, required this.booksMapper});

  final RemoteBooksDataSource dataSource;

  final RemoteBookMapper booksMapper;

  @override
  Future<Result<List<RemoteBook>, Failure>> search(String query) async {
    final bookDTOs = await dataSource.getBooks(query);
    final remoteBooks = booksMapper.toBooks(bookDTOs);
    return Future.value(Success(remoteBooks));
  }
}
