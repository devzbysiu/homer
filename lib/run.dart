import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'app_config.dart';
import 'features/backup_and_restore/presentation/bloc/backup_bloc.dart';
import 'features/find_new_book/presentation/bloc/search/book_search_bloc.dart';
import 'features/find_new_book/presentation/bloc/toggle_tags/on_book_tags_bloc.dart';
import 'features/manage_books/presentation/bloc/delete/delete_books_bloc.dart';
import 'features/manage_books/presentation/bloc/listing/books_bloc.dart';
import 'features/manage_books/presentation/bloc/summary/book_summary_bloc.dart';
import 'features/navigation/presentation/bloc/app_tab_bloc.dart';
import 'features/settings/presentation/bloc/settings_bloc.dart';
import 'features/tags_manager/presentation/bloc/tags_bloc.dart';
import 'injection_container.dart';

void run({required Env env}) async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  await initDi(env: env);
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
  await _moveFile(directory, 'homer-backup.json');
  return Future.value();
}

Future<void> _moveFile(Directory directory, String filename) async {
  final content = await rootBundle.load('assets/$filename');
  final backupFile = File('${directory.path}/$filename');
  backupFile.writeAsBytesSync(content.buffer.asUint8List());
}
