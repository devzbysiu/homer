part of 'suggested_book_bloc.dart';

@immutable
abstract class SuggestedBookState {
  const SuggestedBookState({this.pickedBook});

  final BookEntity? pickedBook;
}

class SuggestedBookInitial extends SuggestedBookState {
  const SuggestedBookInitial();
}

class BookPickedState extends SuggestedBookState {
  const BookPickedState({super.pickedBook});
}
