import 'package:event_bus/event_bus.dart';
import 'package:get_it/get_it.dart';
import 'package:homer/features/books_listing/data/repositories/in_memory_books_repo.dart';
import 'package:homer/features/books_listing/domain/repositories/books_repository.dart';
import 'package:homer/features/books_listing/domain/usecases/list_books.dart';
import 'package:homer/features/books_listing/domain/usecases/update_book_state.dart';
import 'package:homer/features/books_listing/presentation/bloc/books_bloc.dart';
import 'package:homer/features/tags_manager/data/repositories/in_memory_tags_repo.dart';
import 'package:homer/features/tags_manager/domain/repositories/tags_repository.dart';
import 'package:homer/features/tags_manager/domain/usecases/list_tags.dart';

import 'features/add_new_book/presentation/bloc/add_tags/book_tags_bloc.dart';
import 'features/add_new_book/presentation/bloc/select_suggestion/suggested_book_bloc.dart';
import 'features/books_listing/domain/usecases/add_book.dart';
import 'features/search/presentation/bloc/search_for_books_bloc.dart';
import 'features/tags_manager/presentation/bloc/tags_bloc.dart';

final sl = GetIt.instance;

void init() {
  // Features
  sl.registerFactory(
    () => BooksBloc(
      addBook: sl(),
      listBooks: sl(),
      updateBookState: sl(),
      eventBus: sl(),
    ),
  );

  sl.registerFactory(() => TagsBloc(listTags: sl()));
  sl.registerFactory(() => SuggestedBookBloc(eventBus: sl()));
  sl.registerFactory(() => SearchForBooksBloc(booksRepo: sl()));
  sl.registerFactory(() => BookTagsBloc());

  // Use cases
  // books
  sl.registerLazySingleton(() => ListBooks(sl()));
  sl.registerLazySingleton(() => AddBook(sl()));
  sl.registerLazySingleton(() => UpdateBookState(sl()));
  // tags
  sl.registerLazySingleton(() => ListTags(sl()));

  // Repositories
  sl.registerLazySingleton<BooksRepository>(() => InMemoryBooksRepo());
  sl.registerLazySingleton<TagsRepository>(() => InMemoryTagsRepo());

  // Data sources

  // Core

  // External
  sl.registerSingleton(EventBus());
}
