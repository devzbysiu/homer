import 'package:isar/isar.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:path_provider/path_provider.dart';

import '../models/book_dto.dart';

abstract class LocalDataSource {
  Future<List<BookDTO>> getBooks();

  Future<Unit> addBook(BookDTO book);

  Future<Unit> update(BookDTO book);
}

final class IsarLocalDataSource extends LocalDataSource {
  IsarLocalDataSource._(this._isar);

  late final Isar _isar;

  static Future<IsarLocalDataSource> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open([BookDTOSchema], directory: docsDir.path);
    return Future.value(IsarLocalDataSource._(isar));
  }

  @override
  Future<List<BookDTO>> getBooks() async {
    final bookModels = await _isar.bookDTOs.where().findAll();
    return Future.value(bookModels);
  }

  @override
  Future<Unit> addBook(BookDTO book) async {
    await _isar.writeTxn(() async {
      await _isar.bookDTOs.put(book);
    });
    return Future.value(unit);
  }

  @override
  Future<Unit> update(BookDTO book) async {
    await _isar.writeTxn(() async {
      await _isar.bookDTOs.filter().isbnEqualTo(book.isbn).deleteAll();
      await _isar.bookDTOs.put(book);
    });
    return Future.value(unit);
  }
}
