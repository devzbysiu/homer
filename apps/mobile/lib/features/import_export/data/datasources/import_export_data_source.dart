import 'dart:convert';
import 'dart:io';

import 'package:multiple_result/multiple_result.dart';

import '../models/exported_book_dto.dart';

abstract class ImportExportDataSource {
  Future<List<ExportedBookDTO>> loadAll(String path);

  Future<Unit> saveAll(String path, List<ExportedBookDTO> books);
}

// TODO: This should catch library exception and rethrow application exception
final class JsonFileImportExportDataSource implements ImportExportDataSource {
  @override
  Future<List<ExportedBookDTO>> loadAll(String path) async {
    final importFile = File(path);
    final importContent = await importFile.readAsString();
    final jsonBooks = jsonDecode(importContent) as List;
    return jsonBooks
        .map((jsonBook) => ExportedBookDTO.fromJson(jsonBook))
        .toList();
  }

  @override
  Future<Unit> saveAll(String path, List<ExportedBookDTO> books) async {
    final jsonBooks = books.map((book) => book.toJson()).toList();
    final exportContent = jsonEncode(jsonBooks);
    final exportFile = File(path);
    await exportFile.writeAsString(exportContent);
    return unit;
  }
}
