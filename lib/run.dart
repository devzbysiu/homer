import 'dart:io';

import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';

import 'app.dart';
import 'app_config.dart';
import 'features/backup_and_restore/presentation/bloc/backup_bloc.dart';
import 'features/find_new_book/presentation/bloc/search/book_search_bloc.dart';
import 'features/find_new_book/presentation/bloc/share_book/share_book_bloc.dart';
import 'features/find_new_book/presentation/bloc/toggle_tags/on_book_tags_bloc.dart';
import 'features/manage_books/presentation/bloc/delete/delete_books_bloc.dart';
import 'features/manage_books/presentation/bloc/listing/books_bloc.dart';
import 'features/manage_books/presentation/bloc/navigation/app_tab_bloc.dart';
import 'features/manage_books/presentation/bloc/summary/book_summary_bloc.dart';
import 'features/settings/presentation/bloc/settings_bloc.dart';
import 'features/stats/presentation/bloc/stats_bloc.dart';
import 'features/stats/presentation/bloc/stats_event.dart';
import 'features/tags_manager/presentation/bloc/tags_bloc.dart';
import 'injection_container.dart';
import 'logger.dart';

void run({required Env env}) async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = TalkerBlocObserver(talker: log);
  log.i('starting the app');
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await initDi(env: env);
  await _prepareForBackup();

  await SentryFlutter.init(
    (options) {
      options.tracesSampleRate = env == Env.prod ? 0.1 : 1.0;
      options.environment = envString(env);
    },
    appRunner:
        () => runApp(
          MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => sl<AppTabBloc>()),
              BlocProvider(create: (_) => sl<BookSummaryBloc>()),
              BlocProvider(create: (_) => sl<BooksBloc>()),
              BlocProvider(create: (_) => sl<DeleteBooksBloc>()),
              BlocProvider(create: (_) => sl<TagsBloc>()),
              BlocProvider(create: (_) => sl<BookSearchBloc>()),
              BlocProvider(create: (_) => sl<ShareBookBloc>()),
              BlocProvider(create: (_) => sl<OnBookTagsBloc>()),
              BlocProvider(create: (_) => sl<BackupBloc>()),
              BlocProvider(create: (_) => sl<SettingsBloc>()),
              BlocProvider(create: (_) => sl<StatsBloc>()..add(LoadStats())),
            ],
            child: const BetterFeedback(child: Homer()),
          ),
        ),
  );
}

Future<void> _prepareForBackup() async {
  final directory = await getApplicationDocumentsDirectory();
  await _moveFile(directory, 'homer-backup.json');
}

Future<void> _moveFile(Directory directory, String filename) async {
  final content = await rootBundle.load('assets/$filename');
  final backupFile = File('${directory.path}/$filename');
  backupFile.writeAsBytesSync(content.buffer.asUint8List());
}
