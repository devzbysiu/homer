part of 'book_summary_bloc.dart';

@immutable
abstract class BookSummaryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class SummaryModeDisabling extends BookSummaryEvent {}

final class SummaryModeToggled extends BookSummaryEvent {
  SummaryModeToggled(this.book);

  final Book book;
}

final class SummaryModeDisabled extends BookSummaryEvent {}
