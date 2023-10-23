import 'package:isar/isar.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:path_provider/path_provider.dart';

import '../models/local_book_dto.dart';

abstract class LocalBooksDataSource {
  Future<List<LocalBookDTO>> getBooks();

  Future<Unit> add(LocalBookDTO book);

  Future<Unit> addAll(List<LocalBookDTO> books);

  Future<Unit> update(LocalBookDTO book);

  Future<Unit> delete(List<LocalBookDTO> bookDTOs);

  Future<Unit> deleteAll();
}

final class IsarLocalDataSource implements LocalBooksDataSource {
  IsarLocalDataSource._(this._isar);

  late final Isar _isar;

  static Future<IsarLocalDataSource> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open([LocalBookDTOSchema], directory: docsDir.path);
    return Future.value(IsarLocalDataSource._(isar));
  }

  @override
  Future<List<LocalBookDTO>> getBooks() async {
    final bookModels = await _isar.localBookDTOs.where().findAll();
    return Future.value(bookModels);
  }

  @override
  Future<Unit> add(LocalBookDTO book) async {
    await _isar.writeTxn(() async {
      await _isar.localBookDTOs.put(book);
    });
    return Future.value(unit);
  }

  @override
  Future<Unit> addAll(List<LocalBookDTO> books) async {
    await _isar.writeTxn(() async {
      await _isar.localBookDTOs.putAll(books);
    });
    return Future.value(unit);
  }

  @override
  Future<Unit> update(LocalBookDTO book) async {
    await _isar.writeTxn(() async {
      await _isar.localBookDTOs.put(book);
    });
    return Future.value(unit);
  }

  @override
  Future<Unit> delete(List<LocalBookDTO> bookDTOs) async {
    await _isar.writeTxn(() async {
      final bookIDs = bookDTOs.map((bookDTO) => bookDTO.id).toList();
      await _isar.localBookDTOs
          .filter()
          .anyOf(bookIDs, (q, id) => q.idEqualTo(id))
          .deleteAll();
    });
    return Future.value(unit);
  }

  @override
  Future<Unit> deleteAll() async {
    await _isar.writeTxn(() async {
      await _isar.localBookDTOs.where().deleteAll();
    });
    return Future.value(unit);
  }
}
