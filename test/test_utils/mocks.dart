import 'package:homer/core/orchestrator/bus.dart';
import 'package:homer/features/backup_and_restore/data/datasources/backup_data_source.dart';
import 'package:homer/features/backup_and_restore/domain/repositories/backup_repository.dart';
import 'package:homer/features/backup_and_restore/domain/usecases/load_backup.dart';
import 'package:homer/features/backup_and_restore/domain/usecases/make_backup.dart';
import 'package:homer/features/backup_and_restore/domain/usecases/replace_all_books.dart';
import 'package:homer/features/find_new_book/data/datasources/external_book_info_data_source.dart';
import 'package:homer/features/find_new_book/data/datasources/external_books_data_source.dart';
import 'package:homer/features/find_new_book/domain/repositories/external_book_info_repository.dart';
import 'package:homer/features/find_new_book/domain/repositories/external_books_repository.dart';
import 'package:homer/features/find_new_book/domain/usecases/fetch_shared_book.dart';
import 'package:homer/features/find_new_book/domain/usecases/fetch_shared_book_info.dart';
import 'package:homer/features/find_new_book/domain/usecases/search_and_check_saved.dart';
import 'package:homer/features/manage_books/data/datasources/books_data_source.dart';
import 'package:homer/features/manage_books/domain/repositories/books_repository.dart';
import 'package:homer/features/manage_books/domain/usecases/add_book.dart';
import 'package:homer/features/manage_books/domain/usecases/delete_books.dart';
import 'package:homer/features/manage_books/domain/usecases/filter_books.dart';
import 'package:homer/features/manage_books/domain/usecases/list_books.dart';
import 'package:homer/features/manage_books/domain/usecases/update_book.dart';
import 'package:homer/features/settings/data/datasources/settings_data_source.dart';
import 'package:homer/features/settings/domain/repositories/settings_repository.dart';
import 'package:homer/features/settings/domain/usecases/load_settings.dart';
import 'package:homer/features/settings/domain/usecases/save_settings.dart';
import 'package:homer/features/stats/domain/usecases/load_books_per_month.dart';
import 'package:homer/features/stats/domain/usecases/load_books_per_state.dart';
import 'package:homer/features/stats/domain/usecases/load_books_per_year.dart';
import 'package:homer/features/stats/domain/usecases/load_other_stats.dart';
import 'package:homer/features/tags_manager/domain/repositories/tags_repository.dart';
import 'package:homer/features/tags_manager/domain/usecases/list_tags.dart';
import 'package:mockito/annotations.dart';
import 'package:share_handler/share_handler.dart';

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
  ShareHandlerPlatform,
  SearchForBooks,
  FetchSharedBook,
  DeleteBooks,
  AddBook,
  ListSortedBooks,
  UpdateBook,
  FilterBooks,
  SettingsDataSource,
  SettingsRepository,
  SaveSettings,
  LoadSettings,
  TagsRepository,
  ListTags,
  LoadBooksPerYear,
  LoadBooksPerMonth,
  LoadBooksPerState,
  LoadOtherStats,
  Bus,
  FetchSharedBookInfo,
])
void main() {}
