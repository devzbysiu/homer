import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/mappers/remote_books_mapper.dart';
import '../../domain/entities/remote_book.dart';
import '../../domain/repositories/remote_books_repository.dart';
import '../datasources/remote_books_data_source.dart';

final class RemoteBooksRepo implements RemoteBooksRepository {
  RemoteBooksRepo({required this.dataSource});

  final RemoteBooksDataSource dataSource;

  @override
  Future<Result<List<RemoteBook>, Failure>> search(String query) async {
    final bookDTOs = await dataSource.getBooks(query);
    final remoteBooks = toRemoteBooks(bookDTOs);
    return Future.value(Success(remoteBooks));
  }
}
