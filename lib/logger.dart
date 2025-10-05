import 'dart:io';
import 'package:talker_flutter/talker_flutter.dart';

final bool _inTest = Platform.environment['FLUTTER_TEST'] == 'true';

class _BufferingObserver extends TalkerObserver {
  final _buf = StringBuffer();

  String take() {
    final s = _buf.toString();
    _buf.clear();
    return s;
  }

  @override
  void onLog(TalkerData log) {
    _buf.writeln(log.generateTextMessage());
  }

  @override
  void onError(TalkerError err) {
    _buf.writeln(err.generateTextMessage());
  }

  @override
  void onException(TalkerException exception) {
    _buf.writeln(exception.generateTextMessage());
  }
}

final _observer = _BufferingObserver();

// Use TalkerFlutter.init() in normal runs (pretty, OS-aware console output).
// In tests, disable console output and buffer everything via the observer.
final log = _inTest
    ? Talker(
        settings: TalkerSettings(useConsoleLogs: false),
        observer: _observer,
      )
    : TalkerFlutter.init();

String takeTestLogs() => _observer.take();

extension LogExt on Talker {
  void i(String msg) => info(msg);
  void e(String msg) => error(msg);
  void w(String msg) => warning(msg);
}
