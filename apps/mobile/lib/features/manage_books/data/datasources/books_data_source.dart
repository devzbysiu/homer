import 'package:multiple_result/multiple_result.dart';

import '../models/book_dto.dart';

abstract class BooksDataSource {
  Future<List<BookDTO>> getBooks();

  Future<Unit> add(BookDTO book);

  Future<Unit> replaceAll(List<BookDTO> books);

  Future<Unit> update(BookDTO book);

  Future<Unit> delete(List<BookDTO> bookDTOs);
}
