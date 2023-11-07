import 'package:equatable/equatable.dart';

final class BookSizeLimits extends Equatable {
  BookSizeLimits({required int shortMax, required int mediumMax}) {
    short = SizeLimit(shortMax);
    medium = SizeLimit(mediumMax);
  }

  late final SizeLimit short;

  late final SizeLimit medium;

  List<double> asDoubleList() {
    return [
      short.maxPages.toDouble(),
      medium.maxPages.toDouble(),
    ];
  }

  List<int> asIntList() {
    return [
      short.maxPages,
      medium.maxPages,
    ];
  }

  static fromDoubleList(List<double> value) {
    return BookSizeLimits(
      shortMax: value[0].toInt(),
      mediumMax: value[1].toInt(),
    );
  }

  bool isShort(int pageCount) {
    return pageCount <= short.maxPages;
  }

  bool isMedium(int pageCount) {
    return short.maxPages < pageCount && pageCount <= medium.maxPages;
  }

  @override
  List<Object> get props => [short, medium];
}

final class SizeLimit extends Equatable {
  const SizeLimit(this.maxPages);

  final int maxPages;

  @override
  List<Object> get props => [maxPages];
}
