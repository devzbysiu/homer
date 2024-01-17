part of 'share_book_bloc.dart';

@immutable
final class ShareBookState extends Equatable {
  const ShareBookState({
    required this.sharedBook,
    required this.value,
    required this.cause,
  });

  const ShareBookState.initial()
      : sharedBook = const None(),
        value = ShareState.initial,
        cause = const None();

  ShareBookState.bookShared(Book book)
      : sharedBook = some(book),
        value = ShareState.bookShared,
        cause = const None();

  const ShareBookState.bookNotShared()
      : sharedBook = const None(),
        value = ShareState.bookShared,
        cause = const None();

  const ShareBookState.fetchingSharedBookDetails()
      : sharedBook = const None(),
        value = ShareState.fetchingBookDetails,
        cause = const None();

  ShareBookState.fetchingDetailsFailed(String cause)
      : sharedBook = const None(),
        value = ShareState.fetchingDetailsFailed,
        cause = some(cause);

  bool get isFetchingBookDetails => value == ShareState.fetchingBookDetails;

  bool get failedToLookUpSharedBook =>
      value == ShareState.fetchingDetailsFailed;

  Option<String> get failureCause => cause;

  final Option<Book> sharedBook;

  final ShareState value;

  final Option<String> cause;

  @override
  List<Object> get props => [sharedBook, value];
}

enum ShareState {
  initial,
  fetchingBookDetails,
  fetchingDetailsFailed,
  bookShared,
}
