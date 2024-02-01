import 'package:equatable/equatable.dart';

import 'month_info.dart';

final class MostReadInfo extends Equatable {
  MostReadInfo(this.monthInfo, this.booksCount) {
    assert(booksCount >= 0);
  }

  final MonthInfo monthInfo;

  final int booksCount;

  @override
  List<Object> get props => [monthInfo, booksCount];
}
