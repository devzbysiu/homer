import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';

import '../models/local_backup_book_dto.dart';

abstract class LocalBackupDataSource {
  Future<List<LocalBackupBookDTO>> loadAll(String path);

  Future<Unit> saveAll(String path, List<LocalBackupBookDTO> books);
}

final class BackupDataSource implements LocalBackupDataSource {
  @override
  Future<List<LocalBackupBookDTO>> loadAll(String path) async {
    final backupFile = File(path);
    final backupContent = await backupFile.readAsString();
    final jsonBooks = jsonDecode(backupContent) as List;
    final localBackupBookDTOs = jsonBooks
        .map((jsonBook) => LocalBackupBookDTO.fromJson(jsonBook))
        .toList();
    return Future.value(localBackupBookDTOs);
  }

  @override
  Future<Unit> saveAll(String path, List<LocalBackupBookDTO> books) async {
    final jsonBooks = books.map((book) => book.toJson()).toList();
    final backupContent = jsonEncode(jsonBooks);
    final backupFile = File(path);
    await backupFile.writeAsString(backupContent);
    return Future.value(unit);
  }
}
