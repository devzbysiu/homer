import 'package:dartz/dartz.dart';

extension DateOptionExt on Option<DateTime> {
  int millisSinceEpoch() {
    return fold(() => 0, (date) => date.millisecondsSinceEpoch);
  }
}
