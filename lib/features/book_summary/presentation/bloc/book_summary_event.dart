part of 'book_summary_bloc.dart';

@immutable
abstract class BookSummaryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class ShowSummary extends BookSummaryEvent {
  ShowSummary(this.book);

  final LocalBook book;

  @override
  List<Object> get props => [book];
}

final class SummaryModeDisabled extends BookSummaryEvent {}

final class SummaryModeToggled extends BookSummaryEvent {
  SummaryModeToggled(this.book);

  final LocalBook book;
}
