import 'package:isar/isar.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:path_provider/path_provider.dart';

import '../models/book_dto.dart';

abstract class BooksDataSource {
  Future<List<BookDTO>> getBooks();

  Future<Unit> add(BookDTO book);

  Future<Unit> replaceAll(List<BookDTO> books);

  Future<Unit> update(BookDTO book);

  Future<Unit> delete(List<BookDTO> bookDTOs);
}

final class IsarDataSource implements BooksDataSource {
  IsarDataSource._(this._isar);

  late final Isar _isar;

  static Future<IsarDataSource> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open([BookDTOSchema], directory: docsDir.path);
    return IsarDataSource._(isar);
  }

  @override
  Future<List<BookDTO>> getBooks() async {
    return await _isar.bookDTOs.where().findAll();
  }

  @override
  Future<Unit> add(BookDTO book) async {
    await _isar.writeTxn(() async {
      await _isar.bookDTOs.put(book);
    });
    return unit;
  }

  @override
  Future<Unit> replaceAll(List<BookDTO> books) async {
    await _isar.writeTxn(() async {
      await _isar.bookDTOs.where().deleteAll();
      await _isar.bookDTOs.putAll(books);
    });
    return unit;
  }

  @override
  Future<Unit> update(BookDTO book) async {
    await _isar.writeTxn(() async {
      await _isar.bookDTOs.put(book);
    });
    return unit;
  }

  @override
  Future<Unit> delete(List<BookDTO> bookDTOs) async {
    await _isar.writeTxn(() async {
      final bookIDs = bookDTOs.map((bookDTO) => bookDTO.id).toList();
      await _isar.bookDTOs
          .filter()
          .anyOf(bookIDs, (q, id) => q.idEqualTo(id))
          .deleteAll();
    });
    return unit;
  }
}
