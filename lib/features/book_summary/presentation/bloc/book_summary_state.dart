part of 'book_summary_bloc.dart';

@immutable
abstract class BookSummaryState extends Equatable {
  const BookSummaryState({
    this.book = const None(),
  });

  final Option<LocalBook> book;

  @override
  List<Object> get props => [book];
}

final class Empty extends BookSummaryState {}

final class EnableSummaryMode extends BookSummaryState {
  const EnableSummaryMode({required super.book});
}

final class DisableSummaryMode extends BookSummaryState {}
