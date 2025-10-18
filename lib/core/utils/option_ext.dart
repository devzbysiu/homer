import 'dart:async';

import 'package:dartz/dartz.dart';

extension OptionExt<T> on Option<T> {
  Future<void> ifSome(FutureOr<void> Function(T) fn) async {
    final v = toNullable();
    if (v != null) await fn(v);
  }
}
