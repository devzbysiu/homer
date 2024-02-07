import 'package:event_bus/event_bus.dart';
import 'package:get_it/get_it.dart';
import 'package:share_handler/share_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_config.dart';
import 'core/orchestrator/bus.dart';
import 'core/orchestrator/orchestrator.dart';
import 'features/backup_and_restore/data/datasources/backup_data_source.dart';
import 'features/backup_and_restore/data/repositories/backup_repo.dart';
import 'features/backup_and_restore/domain/repositories/backup_repository.dart';
import 'features/backup_and_restore/domain/usecases/load_backup.dart';
import 'features/backup_and_restore/domain/usecases/make_backup.dart';
import 'features/backup_and_restore/domain/usecases/replace_all_books.dart';
import 'features/backup_and_restore/presentation/bloc/backup_bloc.dart';
import 'features/find_new_book/data/datasources/external_book_info_data_source.dart';
import 'features/find_new_book/data/datasources/external_books_data_source.dart';
import 'features/find_new_book/data/repositories/external_book_info_repo.dart';
import 'features/find_new_book/data/repositories/external_books_repo.dart';
import 'features/find_new_book/domain/repositories/external_book_info_repository.dart';
import 'features/find_new_book/domain/repositories/external_books_repository.dart';
import 'features/find_new_book/domain/usecases/fetch_shared_book.dart';
import 'features/find_new_book/domain/usecases/fetch_shared_book_info.dart';
import 'features/find_new_book/domain/usecases/search_and_check_saved.dart';
import 'features/find_new_book/presentation/bloc/search/book_search_bloc.dart';
import 'features/find_new_book/presentation/bloc/share_book/share_book_bloc.dart';
import 'features/find_new_book/presentation/bloc/toggle_tags/on_book_tags_bloc.dart';
import 'features/manage_books/data/datasources/books_data_source.dart';
import 'features/manage_books/data/repositories/books_repo.dart';
import 'features/manage_books/domain/repositories/books_repository.dart';
import 'features/manage_books/domain/usecases/add_book.dart';
import 'features/manage_books/domain/usecases/delete_books.dart';
import 'features/manage_books/domain/usecases/filter_books.dart';
import 'features/manage_books/domain/usecases/list_books.dart';
import 'features/manage_books/domain/usecases/update_book.dart';
import 'features/manage_books/presentation/bloc/delete/delete_books_bloc.dart';
import 'features/manage_books/presentation/bloc/listing/books_bloc.dart';
import 'features/manage_books/presentation/bloc/navigation/app_tab_bloc.dart';
import 'features/manage_books/presentation/bloc/summary/book_summary_bloc.dart';
import 'features/settings/data/datasources/settings_data_source.dart';
import 'features/settings/data/repositories/settings_repo.dart';
import 'features/settings/domain/repositories/settings_repository.dart';
import 'features/settings/domain/usecases/load_settings.dart';
import 'features/settings/domain/usecases/save_settings.dart';
import 'features/settings/presentation/bloc/settings_bloc.dart';
import 'features/stats/domain/usecases/load_books_per_month.dart';
import 'features/stats/domain/usecases/load_books_per_state.dart';
import 'features/stats/domain/usecases/load_books_per_year.dart';
import 'features/stats/domain/usecases/load_other_stats.dart';
import 'features/stats/presentation/bloc/stats_bloc.dart';
import 'features/tags_manager/data/repositories/in_memory_tags_repo.dart';
import 'features/tags_manager/domain/repositories/tags_repository.dart';
import 'features/tags_manager/domain/usecases/list_tags.dart';
import 'features/tags_manager/presentation/bloc/tags_bloc.dart';

final sl = GetIt.instance;

Future<void> initDi({required Env env}) async {
  // Config
  final config = await AppConfig.forEnvironment(env);
  sl.registerFactory(() => config);

  sl.registerSingleton<Bus>(BusImpl(EventBus()));

  // External
  sl.registerLazySingleton<ShareHandlerPlatform>(() {
    return ShareHandlerPlatform.instance;
  });

  // Data sources
  final isarDataSource = await IsarDataSource.create();
  sl.registerLazySingleton<BooksDataSource>(() => isarDataSource);
  sl.registerLazySingleton<ExternalBooksDataSource>(() => ExternalBooks());
  sl.registerLazySingleton<ExternalBookInfoDataSource>(
    () => ScraperDataSource(config: sl()),
  );
  sl.registerLazySingleton<BackupDataSource>(() => JsonFileBackupDataSource());

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SettingsDataSource>(() {
    return SharedPrefsSettingsDataSource(
      sharedPreferences: sharedPreferences,
    );
  });

  // Repositories
  sl.registerLazySingleton<BooksRepository>(() => BooksRepo(dataSource: sl()));
  sl.registerLazySingleton<TagsRepository>(() => InMemoryTagsRepo());
  sl.registerLazySingleton<ExternalBooksRepository>(() {
    return ExternalBooksRepo(dataSource: sl());
  });
  sl.registerLazySingleton<ExternalBookInfoRepository>(() {
    return ExternalBookInfoRepo(dataSource: sl());
  });
  sl.registerLazySingleton<BackupRepository>(() {
    return BackupRepo(dataSource: sl());
  });
  sl.registerLazySingleton<SettingsRepository>(() {
    return SettingsRepo(dataSource: sl());
  });

  // Use cases
  // books
  sl.registerLazySingleton<ListSortedBooks>(() => ListSortedBooksImpl(sl()));
  sl.registerLazySingleton<AddBook>(() => AddBookImpl(sl()));
  sl.registerLazySingleton<UpdateBook>(() => UpdateBookImpl(sl()));
  sl.registerLazySingleton<DeleteBooks>(() => DeleteBooksImpl(sl()));
  sl.registerLazySingleton<FilterBooks>(() => FilterBooksImpl(sl()));
  // tags
  sl.registerLazySingleton<ListTags>(() => ListTagsImpl(sl()));
  // search
  sl.registerLazySingleton<SearchForBooks>(
    () => SearchAndCheckSaved(sl(), sl()),
  );
  sl.registerLazySingleton<FetchSharedBook>(
    () => FetchSharedBookImpl(sl()),
  );
  sl.registerLazySingleton<FetchSharedBookInfo>(
    () => FetchSharedBookInfoImpl(sl()),
  );
  // backup and restore
  sl.registerLazySingleton<LoadBackup>(() => LoadBackupImpl(sl()));
  sl.registerLazySingleton<ReplaceAllBooks>(() => ReplaceAllBooksImpl(sl()));
  sl.registerLazySingleton<MakeBackup>(() => MakeBackupImpl(sl(), sl()));
  // settings
  sl.registerLazySingleton<SaveSettings>(() => SaveSettingsImpl(sl()));
  sl.registerLazySingleton<LoadSettings>(() => LoadSettingsImpl(sl()));
  // stats
  sl.registerLazySingleton<LoadBooksPerYear>(() => LoadBooksPerYearImpl(sl()));
  sl.registerLazySingleton<LoadBooksPerMonth>(
      () => LoadBooksPerMonthImpl(sl()));
  sl.registerLazySingleton<LoadBooksPerState>(
      () => LoadBooksPerStateImpl(sl()));
  sl.registerLazySingleton<LoadOtherStats>(() => LoadOtherStatsImpl(sl()));

  // Features
  sl.registerLazySingleton(() => AppTabBloc());
  sl.registerLazySingleton(() => BookSummaryBloc());
  sl.registerLazySingleton(() {
    return BooksBloc(
      addBook: sl(),
      listBooks: sl(),
      updateBook: sl(),
      filterBooks: sl(),
    );
  });
  sl.registerLazySingleton(() {
    return DeleteBooksBloc(
      deleteBooks: sl(),
      eventBus: sl(),
    );
  });
  sl.registerLazySingleton(() => TagsBloc(listTags: sl()));
  sl.registerLazySingleton(() => BookSearchBloc(searchForBooks: sl()));
  sl.registerLazySingleton(() {
    return ShareBookBloc(
      eventBus: sl(),
      shareHandler: sl(),
      fetchSharedBook: sl(),
      fetchSharedBookInfo: sl(),
    );
  });
  sl.registerLazySingleton(() => OnBookTagsBloc());
  sl.registerLazySingleton(
    () => BackupBloc(
      eventBus: sl(),
      loadBackup: sl(),
      replaceAllBooks: sl(),
      makeBackup: sl(),
    ),
  );
  sl.registerLazySingleton(() {
    return SettingsBloc(
      saveSettings: sl(),
      loadSettings: sl(),
    );
  });
  sl.registerLazySingleton(() {
    return StatsBloc(
      loadBooksPerYear: sl(),
      loadBooksPerMonth: sl(),
      loadBooksPerState: sl(),
      loadOtherStats: sl(),
    );
  });

  // Core
  sl.registerSingleton<Orchestrator>(Orchestrator(
    eventBus: sl(),
    appTab: sl(),
    backup: sl(),
    stats: sl(),
    books: sl(),
    search: sl(),
    share: sl(),
    onBookTags: sl(),
    delete: sl(),
    summary: sl(),
    settings: sl(),
  ));
}
