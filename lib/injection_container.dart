import 'package:get_it/get_it.dart';
import 'package:share_handler/share_handler.dart';

import 'features/backup_and_restore/data/datasources/dante_backup_data_source.dart';
import 'features/backup_and_restore/data/repositories/local_backup_repo.dart';
import 'features/backup_and_restore/domain/repositories/backup_repository.dart';
import 'features/backup_and_restore/domain/usecases/add_all_books.dart';
import 'features/backup_and_restore/domain/usecases/purge_repo.dart';
import 'features/backup_and_restore/domain/usecases/restore_from_local.dart';
import 'features/backup_and_restore/domain/usecases/save_to_local.dart';
import 'features/backup_and_restore/presentation/bloc/backup_bloc.dart';
import 'features/find_new_book/data/datasources/remote_book_info_data_source.dart';
import 'features/find_new_book/data/datasources/remote_books_data_source.dart';
import 'features/find_new_book/data/repositories/remote_books_repo.dart';
import 'features/find_new_book/domain/repositories/remote_books_repository.dart';
import 'features/find_new_book/domain/usecases/fetch_shared_book.dart';
import 'features/find_new_book/domain/usecases/search_for_books.dart';
import 'features/find_new_book/presentation/bloc/search/book_search_bloc.dart';
import 'features/find_new_book/presentation/bloc/toggle_tags/on_book_tags_bloc.dart';
import 'features/manage_books/data/datasources/local_books_data_source.dart';
import 'features/manage_books/data/repositories/local_books_repo.dart';
import 'features/manage_books/domain/repositories/local_books_repository.dart';
import 'features/manage_books/domain/usecases/add_book.dart';
import 'features/manage_books/domain/usecases/delete_books.dart';
import 'features/manage_books/domain/usecases/filter_books.dart';
import 'features/manage_books/domain/usecases/list_books.dart';
import 'features/manage_books/domain/usecases/update_book.dart';
import 'features/manage_books/presentation/bloc/delete/delete_books_bloc.dart';
import 'features/manage_books/presentation/bloc/listing/books_bloc.dart';
import 'features/manage_books/presentation/bloc/summary/book_summary_bloc.dart';
import 'features/navigation/presentation/bloc/app_tab_bloc.dart';
import 'features/settings/presentation/bloc/settings_bloc.dart';
import 'features/tags_manager/data/repositories/in_memory_tags_repo.dart';
import 'features/tags_manager/domain/repositories/tags_repository.dart';
import 'features/tags_manager/domain/usecases/list_tags.dart';
import 'features/tags_manager/presentation/bloc/tags_bloc.dart';

final sl = GetIt.instance;

Future<void> initDi() async {
  // Features
  sl.registerFactory(() => AppTabBloc());
  sl.registerFactory(() => BookSummaryBloc());
  sl.registerFactory(
    () => BooksBloc(
      addBook: sl(),
      listBooks: sl(),
      updateBook: sl(),
      filterBooks: sl(),
    ),
  );
  sl.registerFactory(() => DeleteBooksBloc(deleteBooks: sl()));
  sl.registerFactory(() => TagsBloc(listTags: sl()));
  sl.registerFactory(() => BookSearchBloc(
        shareHandler: sl(),
        searchForBooks: sl(),
        fetchSharedBook: sl(),
      ));
  sl.registerFactory(() => OnBookTagsBloc());
  sl.registerFactory(
    () => BackupBloc(
      loadFromLocalBackup: sl(),
      addAllBooks: sl(),
      purgeRepo: sl(),
      saveToLocalBackup: sl(),
    ),
  );
  sl.registerFactory(() => SettingsBloc());

  // Use cases
  // books
  sl.registerLazySingleton(() => ListBooks(sl()));
  sl.registerLazySingleton(() => AddBook(sl()));
  sl.registerLazySingleton(() => UpdateBook(sl()));
  sl.registerLazySingleton(() => DeleteBooks(sl()));
  sl.registerLazySingleton(() => FilterBooks(sl()));
  // tags
  sl.registerLazySingleton(() => ListTags(sl()));
  // search
  sl.registerLazySingleton(() => SearchForBooks(sl()));
  sl.registerLazySingleton(() => FetchSharedBook(sl()));
  // backup and restore
  sl.registerFactory(() => LoadFromLocalBackup(sl()));
  sl.registerFactory(() => AddAllBooks(sl()));
  sl.registerFactory(() => PurgeRepo(sl()));
  sl.registerFactory(() => SaveToLocalBackup(sl(), sl()));

  // Repositories
  sl.registerLazySingleton<LocalBooksRepository>(
    () => LocalBooksRepo(dataSource: sl()),
  );
  sl.registerLazySingleton<TagsRepository>(() => InMemoryTagsRepo());
  sl.registerLazySingleton<RemoteBooksRepository>(
    () => RemoteBooksRepo(
      booksDataSource: sl(),
      booksInfoDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<BackupRepository>(
    () => LocalBackupRepo(dataSource: sl()),
  );

  // Data sources
  final isarDataSource = await IsarLocalDataSource.create();
  sl.registerLazySingleton<LocalBooksDataSource>(() => isarDataSource);
  sl.registerLazySingleton<RemoteBooksDataSource>(() => ExternalBooks());
  sl.registerLazySingleton<RemoteBookInfoDataSource>(() => ScraperDataSource());
  sl.registerLazySingleton<LocalBackupDataSource>(() => BackupDataSource());

  // Core

  // External
  sl.registerLazySingleton<ShareHandlerPlatform>(
    () => ShareHandlerPlatform.instance,
  );
}
