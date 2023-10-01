part of 'suggested_book_bloc.dart';

@immutable
abstract class SuggestedBookState {
  const SuggestedBookState({this.pickedBook});

  final BookEntity? pickedBook;
}

final class SuggestedBookInitial extends SuggestedBookState {
  const SuggestedBookInitial();
}

final class BookPickedState extends SuggestedBookState {
  const BookPickedState({super.pickedBook});
}
