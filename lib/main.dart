import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:homer/core/book/data/repository/in_memory_books_repo.dart';
import 'package:homer/core/book/data/repository/in_memory_tags_repo.dart';
import 'package:homer/core/book/domain/repository/books_repository.dart';
import 'package:homer/core/book/domain/repository/tags_repository.dart';
import 'package:homer/core/book/domain/use_case/change_active_tab/app_tab_bloc.dart';
import 'package:homer/core/book/domain/use_case/change_book_tags/book_tags_bloc.dart';
import 'package:homer/core/book/domain/use_case/display_suggested_book/suggested_book_bloc.dart';
import 'package:homer/core/book/domain/use_case/list_books/books_bloc.dart';
import 'package:homer/core/book/domain/use_case/list_tags/tags_bloc.dart';
import 'package:homer/core/book/domain/use_case/search_for_books/search_for_books_bloc.dart';
import 'package:homer/feature/home/page/home.dart';

final getIt = GetIt.instance;

void setupDi() {
  getIt.registerSingleton<BooksRepository>(InMemoryBooksRepo());
  getIt.registerSingleton<TagsRepository>(InMemoryTagsRepo());
  getIt.registerSingleton(EventBus());
}

void main() {
  setupDi();
  final booksRepo = getIt<BooksRepository>();
  final tagsRepo = getIt<TagsRepository>();
  final eventBus = getIt<EventBus>();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => AppTabBloc()),
      BlocProvider(
        create: (_) => BooksBloc(
          booksRepo: booksRepo,
          eventBus: eventBus,
        ),
      ),
      BlocProvider(create: (_) => TagsBloc(tagsRepo: tagsRepo)),
      BlocProvider(create: (_) => SuggestedBookBloc(eventBus: eventBus)),
      BlocProvider(create: (_) => SearchForBooksBloc(booksRepo: booksRepo)),
      BlocProvider(create: (_) => BookTagsBloc()),
    ],
    child: const Homer(),
  ));
}

class Homer extends StatelessWidget {
  const Homer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Homer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Home(),
    );
  }
}
