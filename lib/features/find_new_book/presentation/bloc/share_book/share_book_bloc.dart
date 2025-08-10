import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/orchestrator/bus.dart';
import '../../../domain/usecases/fetch_shared_book.dart';
import '../../../domain/usecases/fetch_shared_book_info.dart';
import '../search/book_search_event.dart';
import 'share_book_event.dart';
import 'share_book_state.dart';

final class ShareBookBloc extends Bloc<ShareBookEvent, ShareBookState> {
  ShareBookBloc({
    required this.eventBus,
    required this.fetchSharedBook,
    required this.fetchSharedBookInfo,
  }) : super(const ShareBookState.initial()) {
    on<BookSharedFromOutside>(_onBookSharedFromOutside);
    on<ClearSharedBook>(_onClearSharedBook);
  }

  final Bus eventBus;

  final FetchSharedBook fetchSharedBook;

  final FetchSharedBookInfo fetchSharedBookInfo;

  Future<void> _onBookSharedFromOutside(
    BookSharedFromOutside event,
    Emitter<ShareBookState> emit,
  ) async {
    emit(const ShareBookState.fetchingSharedBookDetails());
    final infoRes = await fetchSharedBookInfo(FetchInfoParams(url: event.url));
    if (infoRes.isError()) {
      final errorMessage = infoRes.tryGetError()!.userMessage();
      emit(ShareBookState.fetchingDetailsFailed(cause: errorMessage));
      return;
    }
    final bookInfo = infoRes.tryGetSuccess()!;
    if (bookInfo.isbn.isNone()) {
      // We can't find shared book by ISBN so we try to find it by querying it's
      // title -> offload share to regular query search
      eventBus.fire(SearchEvent.shareOffloaded(query: bookInfo.title));
      emit(const ShareBookState.initial());
      return;
    }
    final isbn = bookInfo.isbn.toNullable()!;
    final bookRes = await fetchSharedBook(FetchBookParams(isbn: isbn));
    bookRes.when(
      (book) => emit(ShareBookState.bookShared(book: book)),
      (error) => emit(
        ShareBookState.fetchingDetailsFailed(cause: error.userMessage()),
      ),
    );
  }

  Future<void> _onClearSharedBook(
    ClearSharedBook event,
    Emitter<ShareBookState> emit,
  ) async {
    emit(const ShareBookState.bookNotShared());
  }
}
