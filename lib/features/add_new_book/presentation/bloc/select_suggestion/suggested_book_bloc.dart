import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homer/core/usecase/usecase.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../../books_listing/domain/entities/book.dart';
import '../../../domain/usecases/close_search_bar.dart';

part 'suggested_book_event.dart';

part 'suggested_book_state.dart';

final class SuggestedBookBloc
    extends Bloc<SuggestedBookEvent, SuggestedBookState> {
  SuggestedBookBloc({required this.closeSearchBar}) : super(NoPickedBook()) {
    on<SuggestedBookPicked>(_onSuggestedBookPicked);
    on<ClearPickedBook>(_onClearPickedBook);
  }

  Future<void> _onSuggestedBookPicked(
    SuggestedBookPicked event,
    Emitter<SuggestedBookState> emit,
  ) async {
    emit(BookPickedState(pickedBook: event.pickedBook));
    closeSearchBar(NoParams());
  }

  Future<void> _onClearPickedBook(
    ClearPickedBook event,
    Emitter<SuggestedBookState> emit,
  ) async {
    emit(NoPickedBook());
  }

  final CloseSearchBar closeSearchBar;
}
