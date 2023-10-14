import 'dart:io';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/add_new_book/presentation/bloc/book_tags_bloc.dart';
import 'features/backup_and_restore/presentation/bloc/backup_and_restore_bloc.dart';
import 'features/books_listing/domain/entities/local_book.dart';
import 'features/books_listing/domain/repositories/local_books_repository.dart';
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
  // await _initDbWithFakes(); // TODO: Remove this and line below
  await _prepareForBackup();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => sl<AppTabBloc>()),
      BlocProvider(create: (_) => sl<BooksBloc>()),
      BlocProvider(create: (_) => sl<TagsBloc>()),
      BlocProvider(create: (_) => sl<SearchForBooksBloc>()),
      BlocProvider(create: (_) => sl<BookTagsBloc>()),
      BlocProvider(create: (_) => sl<BackupAndRestoreBloc>()),
    ],
    child: const Homer(),
  ));
}

Future<void> _initDbWithFakes() async {
  final booksRepo = sl<LocalBooksRepository>();
  await booksRepo.deleteAll();
  for (var i = 0; i < 16; i++) {
    await booksRepo.add(LocalBook.fake());
  }
  return Future.value();
}

Future<void> _prepareForBackup() async {
  final prefs = await SharedPreferences.getInstance();
  // if (prefs.getBool('books-restored') ?? false) {
  //   return Future.value();
  // }
  final booksRepo = sl<LocalBooksRepository>();
  await booksRepo.deleteAll();
  var content = await rootBundle.load('assets/backup.json');
  final directory = await getApplicationDocumentsDirectory();
  var file = File('${directory.path}/backup.json');
  file.writeAsBytesSync(content.buffer.asUint8List());
  return Future.value();
}

final class Homer extends StatelessWidget {
  const Homer({super.key});

  @override
  Widget build(BuildContext context) {
    const scheme = FlexScheme.amber;
    const themeMode = ThemeMode.dark;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Homer',
      theme: FlexThemeData.light(scheme: scheme),
      darkTheme: FlexThemeData.dark(scheme: scheme),
      themeMode: themeMode,
      home: const Home(),
    );
  }
}

final class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      body: BooksList(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
