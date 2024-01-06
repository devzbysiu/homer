part of 'share_book_bloc.dart';

@immutable
final class ShareBookState extends Equatable {
  const ShareBookState.initial()
      : sharedBook = const None(),
        value = ShareState.initial,
        _cause = const None();

  ShareBookState.bookShared(Book book)
      : sharedBook = some(book),
        value = ShareState.bookShared,
        _cause = const None();

  const ShareBookState.bookNotShared()
      : sharedBook = const None(),
        value = ShareState.bookShared,
        _cause = const None();

  const ShareBookState.fetchingSharedBookDetails()
      : sharedBook = const None(),
        value = ShareState.fetchingBookDetails,
        _cause = const None();

  ShareBookState.fetchingDetailsFailed(String cause)
      : sharedBook = const None(),
        value = ShareState.fetchingDetailsFailed,
        _cause = some(cause);

  bool get isFetchingBookDetails => value == ShareState.fetchingBookDetails;

  bool get failedToLookUpSharedBook =>
      value == ShareState.fetchingDetailsFailed;

  Option<String> get failureCause => _cause;

  final Option<Book> sharedBook;

  final ShareState value;

  final Option<String> _cause;

  @override
  List<Object?> get props => [sharedBook, value];
}

enum ShareState {
  initial,
  fetchingBookDetails,
  fetchingDetailsFailed,
  bookShared,
}
