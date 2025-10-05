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
    // Wipe and reinsert (simple + predictable).
    // Because we set onDelete: cascade on joins, deleting books clears link rows.
    await _db.transaction(() async {
      // Clear link tables explicitly (optional since cascade also handles them)
      await _db.delete(_db.bookAuthors).go();
      await _db.delete(_db.bookTags).go();

      // Clear main tables
      await _db.delete(_db.books).go();
      await _db.delete(_db.authors).go();
      await _db.delete(_db.tags).go();

      // Re-insert everything
      for (final b in books) {
        await _db.insertBookDTO(b);
      }
    });
    return unit;
  }

  @override
  Future<Unit> update(BookDTO book) async {
    // Requires id
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
      // Delete books by id; join rows removed via cascade.
      await (_db.delete(_db.books)..where((t) => t.id.isIn(ids))).go();

      // (Optional) prune orphan authors/tags with no remaining links.
      // You can keep this simple and skip pruning, or enable it using custom deletes:
      //
      // await _db.customStatement('''
      //   DELETE FROM authors
      //   WHERE id NOT IN (SELECT author_id FROM book_authors)
      // ''');
      // await _db.customStatement('''
      //   DELETE FROM tags
      //   WHERE id NOT IN (SELECT tag_id FROM book_tags)
      // ''');
    });

    return unit;
  }
}
