import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:homer/core/book/domain/repository/book_repository.dart';
import 'package:homer/core/utils/bloc_extensions.dart';
import 'package:homer/feature/book/widget/books_list.dart';
import 'package:homer/feature/navigation/bloc/app_tab_bloc.dart';
import 'package:homer/feature/navigation/widget/bottom_nav_bar.dart';

import 'core/book/data/repository/in_memory_repo.dart';

final getIt = GetIt.instance;

void setupDi() {
  getIt.registerSingleton<BookRepository>(InMemoryRepo());
}

void main() {
  setupDi();
  runApp(
    BlocProvider(
      create: (_) => AppTabBloc(),
      child: const Homer(),
    ),
  );
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

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        color: context.figureOutColor(),
        child: BooksList(),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
