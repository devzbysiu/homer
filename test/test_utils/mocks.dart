import 'package:homer/features/backup_and_restore/data/datasources/backup_data_source.dart';
import 'package:homer/features/backup_and_restore/domain/repositories/backup_repository.dart';
import 'package:homer/features/backup_and_restore/domain/usecases/load_backup.dart';
import 'package:homer/features/backup_and_restore/domain/usecases/make_backup.dart';
import 'package:homer/features/backup_and_restore/domain/usecases/replace_all_books.dart';
import 'package:homer/features/find_new_book/data/datasources/external_book_info_data_source.dart';
import 'package:homer/features/find_new_book/data/datasources/external_books_data_source.dart';
import 'package:homer/features/find_new_book/domain/repositories/external_book_info_repository.dart';
import 'package:homer/features/find_new_book/domain/repositories/external_books_repository.dart';
import 'package:homer/features/manage_books/data/datasources/books_data_source.dart';
import 'package:homer/features/manage_books/domain/repositories/books_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  BooksRepository,
  BackupDataSource,
  BackupRepository,
  BooksDataSource,
  LoadBackup,
  MakeBackup,
  ReplaceAllBooks,
  ExternalBooksRepository,
  ExternalBookInfoRepository,
  ExternalBookInfoDataSource,
  ExternalBooksDataSource,
])
void main() {}
