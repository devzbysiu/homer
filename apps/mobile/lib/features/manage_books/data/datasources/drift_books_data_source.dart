import '../models/book_dto.dart';
import 'app_database.dart';
import 'books_data_source.dart';
import 'package:multiple_result/multiple_result.dart';

final class DriftDataSource implements BooksDataSource {
  DriftDataSource._(this._db);

  late final AppDatabase _db;

  static Future<DriftDataSource> create() async {
    final db = AppDatabase();
    return DriftDataSource._(db);
  }

  @override
  Future<List<BookDTO>> getBooks() async {
    return _db.getAllBookDTOs();
  }

  @override
  Future<Unit> add(BookDTO book) async {
    await _db.insertBookDTO(book);
    return unit;
  }

  @override
  Future<Unit> replaceAll(List<BookDTO> books) async {
    await _db.transaction(() async {
      await _db.delete(_db.bookAuthors).go();
      await _db.delete(_db.bookTags).go();

      await _db.delete(_db.books).go();
      await _db.delete(_db.authors).go();
      await _db.delete(_db.tags).go();

      for (final b in books) {
        await _db.insertBookDTO(b);
      }
    });
    return unit;
  }

  @override
  Future<Unit> update(BookDTO book) async {
    if (book.id == null) {
      throw ArgumentError('update() requires book.id to be non-null');
    }
    await _db.updateBookDTO(book);
    return unit;
  }

  @override
  Future<Unit> delete(List<BookDTO> bookDTOs) async {
    if (bookDTOs.isEmpty) return unit;

    final ids = bookDTOs
        .map((b) => b.id)
        .whereType<int>()
        .toList(growable: false);

    if (ids.isEmpty) return unit;

    await _db.transaction(() async {
      await (_db.delete(_db.books)..where((t) => t.id.isIn(ids))).go();
    });

    return unit;
  }
}
