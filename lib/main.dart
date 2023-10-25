import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'features/add_new_book/presentation/bloc/on_book_tags_bloc.dart';
import 'features/backup_and_restore/presentation/bloc/backup_bloc.dart';
import 'features/book_summary/presentation/bloc/book_summary_bloc.dart';
import 'features/books_listing/presentation/bloc/books_bloc.dart';
import 'features/delete_book/presentation/bloc/delete_books_bloc.dart';
import 'features/navigation/presentation/bloc/app_tab_bloc.dart';
import 'features/search/presentation/bloc/book_search_bloc.dart';
import 'features/settings/presentation/bloc/settings_bloc.dart';
import 'features/tags_manager/presentation/bloc/tags_bloc.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  await initDi();
  await _prepareForBackup();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => sl<AppTabBloc>()),
      BlocProvider(create: (_) => sl<BookSummaryBloc>()),
      BlocProvider(create: (_) => sl<BooksBloc>()),
      BlocProvider(create: (_) => sl<DeleteBooksBloc>()),
      BlocProvider(create: (_) => sl<TagsBloc>()),
      BlocProvider(create: (_) => sl<BookSearchBloc>()),
      BlocProvider(create: (_) => sl<OnBookTagsBloc>()),
      BlocProvider(create: (_) => sl<BackupBloc>()),
      BlocProvider(create: (_) => sl<SettingsBloc>()),
    ],
    child: const Homer(),
  ));
}

Future<void> _prepareForBackup() async {
  final directory = await getApplicationDocumentsDirectory();
  await _moveFile(directory, 'dante-backup.json');
  await _moveFile(directory, 'homer-backup.json');
  return Future.value();
}

Future<void> _moveFile(Directory directory, String filename) async {
  var content = await rootBundle.load('assets/$filename');
  var danteBackup = File('${directory.path}/$filename');
  danteBackup.writeAsBytesSync(content.buffer.asUint8List());
}
