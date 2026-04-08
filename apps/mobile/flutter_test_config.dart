import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:homer/logger.dart' as app_log;

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  setUp(() => app_log.takeTestLogs());

  tearDown(() {
    final logs = app_log.takeTestLogs();
    if (logs.isNotEmpty) {
      printOnFailure(logs); // only appears if the test failed
    }
  });

  await testMain();
}
