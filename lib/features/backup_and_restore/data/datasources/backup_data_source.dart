import 'dart:convert';
import 'dart:io';

import 'package:multiple_result/multiple_result.dart';

import '../models/backup_book_dto.dart';

abstract class BackupDataSource {
  Future<List<BackupBookDTO>> loadAll(String path);

  Future<Unit> saveAll(String path, List<BackupBookDTO> books);
}

final class JsonFileBackupDataSource implements BackupDataSource {
  @override
  Future<List<BackupBookDTO>> loadAll(String path) async {
    final backupFile = File(path);
    final backupContent = await backupFile.readAsString();
    final jsonBooks = jsonDecode(backupContent) as List;
    return jsonBooks
        .map((jsonBook) => BackupBookDTO.fromJson(jsonBook))
        .toList();
  }

  @override
  Future<Unit> saveAll(String path, List<BackupBookDTO> books) async {
    final jsonBooks = books.map((book) => book.toJson()).toList();
    final backupContent = jsonEncode(jsonBooks);
    final backupFile = File(path);
    await backupFile.writeAsString(backupContent);
    return unit;
  }
}
