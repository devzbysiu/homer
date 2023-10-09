import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homer/features/books_listing/domain/repositories/local_books_repository.dart';

import 'core/utils/extensions.dart';
import 'features/add_new_book/presentation/bloc/add_tags/book_tags_bloc.dart';
import 'features/books_listing/domain/entities/local_book.dart';
import 'features/books_listing/presentation/bloc/books_bloc.dart';
import 'features/books_listing/presentation/widgets/books_list.dart';
import 'features/navigation/presentation/bloc/app_tab_bloc.dart';
import 'features/navigation/presentation/widgets/bottom_nav_bar.dart';
import 'features/search/presentation/bloc/search_for_books_bloc.dart';
import 'features/tags_manager/presentation/bloc/tags_bloc.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  await initDi();
  await initDbWithFakes();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => sl<AppTabBloc>()),
      BlocProvider(create: (_) => sl<BooksBloc>()),
      BlocProvider(create: (_) => sl<TagsBloc>()),
      BlocProvider(create: (_) => sl<SearchForBooksBloc>()),
      BlocProvider(create: (_) => sl<BookTagsBloc>()),
    ],
    child: const Homer(),
  ));
}

Future<void> initDbWithFakes() async {
  final booksRepo = sl<LocalBooksRepository>();
  await booksRepo.deleteAll();
  for (var i = 0; i < 17; i++) {
    await booksRepo.add(LocalBook.fake());
  }
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
