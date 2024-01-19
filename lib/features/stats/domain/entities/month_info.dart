import 'package:equatable/equatable.dart';

typedef Year = int;

typedef Month = int;

const Map<Month, String> _monthShortNames = {
  1: 'Jan',
  2: 'Feb',
  3: 'Mar',
  4: 'Apr',
  5: 'May',
  6: 'Jun',
  7: 'Jul',
  8: 'Aug',
  9: 'Sep',
  10: 'Oct',
  11: 'Nov',
  12: 'Dec',
};

final class MonthInfo extends Equatable implements Comparable<MonthInfo> {
  MonthInfo(this.year, this.month) {
    assert(month >= 1 && month <= 12);
  }

  final Year year;

  final Month month;

  MonthInfo.current()
      : year = DateTime.now().year,
        month = DateTime.now().month;

  MonthInfo previous() {
    final previousMonth = month - 1;
    if (previousMonth < 1) {
      return MonthInfo(year - 1, 12);
    }
    return MonthInfo(year, previousMonth);
  }

  MonthInfo next() {
    final nextMonth = month + 1;
    if (nextMonth > 12) {
      return MonthInfo(year + 1, 1);
    }
    return MonthInfo(year, nextMonth);
  }

  MonthInfo operator -(int howMuch) {
    var result = this;
    while (howMuch > 1) {
      howMuch--;
      result = result.previous();
    }
    return result;
  }

  @override
  List<Object> get props => [year, month];

  @override
  int compareTo(MonthInfo other) {
    if (year < other.year) {
      return -1;
    } else if (year > other.year) {
      return 1;
    } else {
      return month.compareTo(other.month);
    }
  }

  @override
  String toString() {
    final monthShort = _monthShortNames[month];
    final yearShort = year.toString().substring(2);
    return '$monthShort $yearShort';
  }
}
