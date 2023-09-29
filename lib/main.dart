import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:homer/core/book/data/repository/in_memory_repo.dart';
import 'package:homer/core/book/domain/use_case/change_active_tab/app_tab_bloc.dart';
import 'package:homer/core/book/domain/use_case/display_suggested_book/suggested_book_bloc.dart';
import 'package:homer/core/book/domain/use_case/list_books/books_bloc.dart';
import 'package:homer/feature/home/page/home.dart';

final getIt = GetIt.instance;

void setupDi() {}

void main() {
  setupDi();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => AppTabBloc()),
    BlocProvider(create: (_) => BooksBloc(InMemoryRepo())),
    BlocProvider(create: (_) => SuggestedBookBloc()),
  ], child: const Homer()));
}

class Homer extends StatelessWidget {
  const Homer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Home(),
    );
  }
}
