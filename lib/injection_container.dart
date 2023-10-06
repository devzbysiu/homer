import 'package:event_bus/event_bus.dart';
import 'package:get_it/get_it.dart';
import 'package:homer/features/books_listing/data/datasources/local_data_source.dart';
import 'package:homer/features/books_listing/data/mappers/book_mapper.dart';
import 'package:homer/features/books_listing/data/repositories/local_book_repo.dart';
import 'package:homer/features/bottom_drawer/presentation/bloc/app_tab_bloc.dart';
import 'package:homer/features/delete_books/domain/usecases/delete_picked_books.dart';
import 'package:homer/features/delete_books/presentation/bloc/delete_books_bloc.dart';

import 'features/add_new_book/domain/usecases/close_search_bar.dart';
import 'features/add_new_book/presentation/bloc/add_tags/book_tags_bloc.dart';
import 'features/add_new_book/presentation/bloc/select_suggestion/suggested_book_bloc.dart';
import 'features/books_listing/domain/repositories/books_repository.dart';
import 'features/books_listing/domain/usecases/add_book.dart';
import 'features/books_listing/domain/usecases/list_books.dart';
import 'features/books_listing/domain/usecases/update_book_state.dart';
import 'features/books_listing/presentation/bloc/books_bloc.dart';
import 'features/search/domain/usecases/search_books.dart';
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
    ),
  );
  sl.registerFactory(() => AppTabBloc());
  sl.registerFactory(() => TagsBloc(listTags: sl()));
  sl.registerFactory(() => SuggestedBookBloc(closeSearchBar: sl()));
  sl.registerFactory(() => SearchForBooksBloc(searchBooks: sl()));
  sl.registerFactory(() => BookTagsBloc());
  sl.registerFactory(() => DeleteBooksBloc(deleteBooks: sl()));

  // Use cases
  // books
  sl.registerLazySingleton(() => ListBooks(sl()));
  sl.registerLazySingleton(() => AddBook(sl(), sl()));
  sl.registerLazySingleton(() => UpdateBookState(sl()));
  sl.registerLazySingleton(() => DeletePickedBooks(sl()));
  // tags
  sl.registerLazySingleton(() => ListTags(sl()));
  // search
  sl.registerLazySingleton(() => SearchBooks(sl()));
  // bottom nav
  sl.registerLazySingleton(() => CloseSearchBar(sl()));

  // Repositories
  sl.registerLazySingleton<BooksRepository>(
    () => LocalBooksRepo(
      dataSource: sl(),
      bookMapper: sl(),
    ),
  );
  sl.registerLazySingleton<TagsRepository>(() => InMemoryTagsRepo());

  // Data sources
  final isarDataSource = await IsarLocalDataSource.create();
  sl.registerLazySingleton<LocalDataSource>(() => isarDataSource);

  // Mappers
  sl.registerLazySingleton(() => BookMapper());

  // Core

  // External
  sl.registerSingleton(EventBus());
}
