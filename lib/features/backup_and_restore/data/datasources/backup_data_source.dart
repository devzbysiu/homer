import 'dart:convert';
import 'dart:io';

import '../models/restored_book_dto.dart';

abstract class LocalBackupDataSource {
  Future<List<RestoredBookDTO>> loadAll(String path);
}

// TODO: This should be removed after successful move from dante
final class DanteBackupDataSource implements LocalBackupDataSource {
  @override
  Future<List<RestoredBookDTO>> loadAll(String path) async {
    final backupFile = File(path);
    final backupContent = await backupFile.readAsString();
    final json = jsonDecode(backupContent);
    final jsonBooks = json['books'] as List;
    final restoredBookDTOs = jsonBooks
        .map((jsonBook) => RestoredBookDTO.fromJson(jsonBook))
        .toList();
    return Future.value(restoredBookDTOs);
  }
}
