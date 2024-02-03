part of 'stats_bloc.dart';

abstract class StatsEvent extends Equatable implements BusEvent {
  @override
  List<Object> get props => [];
}

final class LoadStats extends StatsEvent {}

final class BookFinished extends StatsEvent {
  BookFinished(this.book);

  final Book book;
}

final class BookUnfinished extends StatsEvent {
  BookUnfinished(this.book);

  final Book book;
}

final class BookStarted extends StatsEvent {}

final class BookUnstarted extends StatsEvent {}
