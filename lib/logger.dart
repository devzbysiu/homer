import 'package:talker_flutter/talker_flutter.dart';

final log = TalkerFlutter.init();

extension LogExt on Talker {
  void i(String msg) => log.info(msg);
  void e(String msg) => log.error(msg);
  void w(String msg) => log.warning(msg);
}
