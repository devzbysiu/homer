import 'package:multiple_result/multiple_result.dart';

import '../models/book_model.dart';

abstract class LocalDataSource {
  Future<List<BookModel>> getBooks();

  Future<Unit> saveBooks(List<BookModel> books);
}
