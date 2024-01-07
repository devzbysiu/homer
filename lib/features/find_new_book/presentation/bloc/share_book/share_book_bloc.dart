import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_handler/share_handler.dart';

import '../../../../../core/entities/book.dart';
import '../../../domain/usecases/fetch_shared_book.dart';

part 'share_book_event.dart';
part 'share_book_state.dart';

final class ShareBookBloc extends Bloc<ShareBookEvent, ShareBookState> {
  ShareBookBloc({
    required this.shareHandler,
    required this.fetchSharedBook,
  }) : super(const ShareBookState.initial()) {
    // This happens when user shares URL, but the app is not running.
    // TODO: Make sure it's working
    shareHandler.getInitialSharedMedia().then((media) {
      if (media?.content == null) return;
      add(BookSharedFromOutside(media!.content!));
    });

    // This happens when the app is already running.
    shareHandler.sharedMediaStream.listen((media) {
      if (media.content == null) return;
      add(BookSharedFromOutside(media.content!));
    });
    on<BookSharedFromOutside>(_onBookSharedFromOutside);
    on<ClearSharedBook>(_onClearSharedBook);
  }

  final ShareHandlerPlatform shareHandler;

  final FetchSharedBook fetchSharedBook;

  Future<void> _onBookSharedFromOutside(
    BookSharedFromOutside event,
    Emitter<ShareBookState> emit,
  ) async {
    emit(const ShareBookState.fetchingSharedBookDetails());
    final result = await fetchSharedBook(SharedBookParams(url: event.url));
    result.when(
      (book) => emit(ShareBookState.bookShared(book)),
      (error) => emit(ShareBookState.fetchingDetailsFailed(
        error.userMessage(),
      )),
    );
    return Future.value();
  }

  Future<void> _onClearSharedBook(
    ClearSharedBook event,
    Emitter<ShareBookState> emit,
  ) async {
    emit(const ShareBookState.bookNotShared());
    return Future.value();
  }
}

extension ShareBookContextExt on BuildContext {
  void clearSharedBook() {
    _emitShareBookEvt(ClearSharedBook());
  }

  void _emitShareBookEvt(ShareBookEvent event) {
    read<ShareBookBloc>().add(event);
  }
}
