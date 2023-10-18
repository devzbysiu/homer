import 'package:event_bus/event_bus.dart';
import 'package:get_it/get_it.dart';
import 'package:homer/features/backup_and_restore/domain/usecases/purge_repo.dart';
import 'package:homer/features/settings/presentation/bloc/settings_bloc.dart';

import 'features/add_new_book/presentation/bloc/book_tags_bloc.dart';
import 'features/backup_and_restore/data/datasources/dante_backup_data_source.dart';
import 'features/backup_and_restore/data/repositories/dante_backup_repo.dart';
import 'features/backup_and_restore/domain/repositories/backup_repository.dart';
import 'features/backup_and_restore/domain/usecases/add_all_books.dart';
import 'features/backup_and_restore/domain/usecases/restore_from_local.dart';
import 'features/backup_and_restore/presentation/bloc/backup_and_restore_bloc.dart';
import 'features/books_listing/data/datasources/local_books_data_source.dart';
import 'features/books_listing/data/repositories/local_books_repo.dart';
import 'features/books_listing/domain/repositories/local_books_repository.dart';
import 'features/books_listing/domain/usecases/add_book.dart';
import 'features/books_listing/domain/usecases/delete_picked_books.dart';
import 'features/books_listing/domain/usecases/list_books.dart';
import 'features/books_listing/domain/usecases/update_book_state.dart';
import 'features/books_listing/presentation/bloc/books_bloc.dart';
import 'features/navigation/presentation/bloc/app_tab_bloc.dart';
import 'features/search/data/datasources/remote_books_data_source.dart';
import 'features/search/data/repositories/remote_books_repo.dart';
import 'features/search/domain/repositories/remote_books_repository.dart';
import 'features/search/domain/usecases/close_search_bar.dart';
import 'features/search/domain/usecases/search_for_books.dart';
import 'features/search/presentation/bloc/search_for_books_bloc.dart';
import 'features/tags_manager/data/repositories/in_memory_tags_repo.dart';
import 'features/tags_manager/domain/repositories/tags_repository.dart';
import 'features/tags_manager/domain/usecases/list_tags.dart';
import 'features/tags_manager/presentation/bloc/tags_bloc.dart';

final sl = GetIt.instance;

Future<void> initDi() async {
  // Features
  sl.registerFactory(
    () => BooksBloc(
      addBook: sl(),
      listBooks: sl(),
      updateBookState: sl(),
      deleteBooks: sl(),
    ),
  );
  sl.registerFactory(() => AppTabBloc());
  sl.registerFactory(() => TagsBloc(listTags: sl()));
  sl.registerFactory(
    () => SearchForBooksBloc(
      searchForBooks: sl(),
      closeSearchBar: sl(),
    ),
  );
  sl.registerFactory(() => BookTagsBloc());
  sl.registerFactory(
    () => BackupAndRestoreBloc(
      loadFromLocalBackup: sl(),
      addAllBooks: sl(),
      purgeRepo: sl(),
    ),
  );
  sl.registerFactory(() => SettingsBloc());

  // Use cases
  // books
  sl.registerLazySingleton(() => ListBooks(sl()));
  sl.registerLazySingleton(() => AddBook(sl(), sl()));
  sl.registerLazySingleton(() => UpdateBookState(sl()));
  sl.registerLazySingleton(() => DeletePickedBooks(sl()));
  // tags
  sl.registerLazySingleton(() => ListTags(sl()));
  // search
  sl.registerLazySingleton(() => SearchForBooks(sl()));
  sl.registerLazySingleton(() => CloseSearchBar(sl()));
  // backup and restore
  sl.registerFactory(() => LoadFromLocalBackup(sl()));
  sl.registerFactory(() => AddAllBooks(sl()));
  sl.registerFactory(() => PurgeRepo(sl()));

  // Repositories
  sl.registerLazySingleton<LocalBooksRepository>(
    () => LocalBooksRepo(dataSource: sl()),
  );
  sl.registerLazySingleton<TagsRepository>(() => InMemoryTagsRepo());
  sl.registerLazySingleton<RemoteBooksRepository>(
    () => RemoteBooksRepo(dataSource: sl()),
  );
  sl.registerLazySingleton<BackupRepository>(
    () => LocalBackupRepo(localBackupDataSource: sl()),
  );

  // Data sources
  final isarDataSource = await IsarLocalDataSource.create();
  sl.registerLazySingleton<LocalBooksDataSource>(() => isarDataSource);
  sl.registerLazySingleton<RemoteBooksDataSource>(() => GoogleBooks());
  sl.registerLazySingleton<LocalBackupDataSource>(
    () => DanteBackupDataSource(),
  );

  // Core

  // External
  sl.registerSingleton(EventBus());
}
