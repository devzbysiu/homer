part of 'suggested_book_bloc.dart';

@immutable
abstract class SuggestedBookState {
  const SuggestedBookState({this.pickedBook});

  final Book? pickedBook;
}

final class BookPickedState extends SuggestedBookState {
  const BookPickedState({super.pickedBook});
}

final class NoPickedBook extends SuggestedBookState {}
