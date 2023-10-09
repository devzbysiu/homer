import 'package:event_bus/event_bus.dart';
import 'package:get_it/get_it.dart';

import 'features/add_new_book/presentation/bloc/book_tags_bloc.dart';
import 'features/books_listing/data/datasources/local_books_data_source.dart';
import 'features/books_listing/data/mappers/local_book_mapper.dart';
import 'features/books_listing/data/repositories/local_books_repo.dart';
import 'features/books_listing/domain/repositories/local_books_repository.dart';
import 'features/books_listing/domain/usecases/add_book.dart';
import 'features/books_listing/domain/usecases/delete_picked_books.dart';
import 'features/books_listing/domain/usecases/list_books.dart';
import 'features/books_listing/domain/usecases/update_book_state.dart';
import 'features/books_listing/presentation/bloc/books_bloc.dart';
import 'features/navigation/presentation/bloc/app_tab_bloc.dart';
import 'features/search/data/datasources/remote_books_data_source.dart';
import 'features/search/data/mappers/remote_book_mapper.dart';
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

  // Use cases
  // books
  sl.registerLazySingleton(() => ListBooks(sl()));
  sl.registerLazySingleton(() => AddBook(sl(), sl(), sl()));
  sl.registerLazySingleton(() => UpdateBookState(sl()));
  sl.registerLazySingleton(() => DeletePickedBooks(sl()));
  // tags
  sl.registerLazySingleton(() => ListTags(sl()));
  // search
  sl.registerLazySingleton(() => SearchForBooks(sl()));
  sl.registerLazySingleton(() => CloseSearchBar(sl()));
  // bottom nav

  // Repositories
  sl.registerLazySingleton<LocalBooksRepository>(
    () => LocalBooksRepo(
      dataSource: sl(),
      bookMapper: sl(),
    ),
  );
  sl.registerLazySingleton<TagsRepository>(() => InMemoryTagsRepo());
  sl.registerLazySingleton<RemoteBooksRepository>(
    () => RemoteBooksRepo(
      dataSource: sl(),
      booksMapper: sl(),
    ),
  );

  // Data sources
  final isarDataSource = await IsarLocalDataSource.create();
  sl.registerLazySingleton<LocalBooksDataSource>(() => isarDataSource);
  sl.registerLazySingleton<RemoteBooksDataSource>(() => GoogleBooks());

  // Mappers
  sl.registerLazySingleton(() => LocalBookMapper());
  sl.registerLazySingleton(() => RemoteBookMapper());

  // Core

  // External
  sl.registerSingleton(EventBus());
}
