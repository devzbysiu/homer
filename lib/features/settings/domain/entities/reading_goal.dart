import 'package:equatable/equatable.dart';

final class ReadingGoal extends Equatable {
  const ReadingGoal({required this.books}): assert(books >= 0);

  final int books;

  @override
  List<Object> get props => [books];
}