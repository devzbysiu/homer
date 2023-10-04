import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/add_new_book/presentation/bloc/add_tags/book_tags_bloc.dart';
import 'core/utils/extensions.dart';
import 'features/add_new_book/presentation/bloc/select_suggestion/suggested_book_bloc.dart';
import 'features/books_listing/data/repositories/in_memory_books_repo.dart';
import 'features/books_listing/domain/repositories/books_repository.dart';
import 'features/books_listing/presentation/bloc/books_bloc.dart';
import 'features/books_listing/presentation/widgets/books_list.dart';
import 'features/bottom_drawer/presentation/bloc/app_tab_bloc.dart';
import 'features/bottom_drawer/presentation/widgets/bottom_nav_bar.dart';
import 'features/search/presentation/bloc/search_for_books_bloc.dart';
import 'features/tags_manager/data/repositories/in_memory_tags_repo.dart';
import 'features/tags_manager/domain/repositories/tags_repository.dart';
import 'features/tags_manager/presentation/bloc/tags_bloc.dart';

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

final class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        color: context.figureOutColor(),
        child: const BooksList(),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
