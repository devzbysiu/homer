import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../../books_listing/domain/entities/book.dart';
import '../../../domain/usecases/close_search_bar.dart';

part 'suggested_book_event.dart';

part 'suggested_book_state.dart';

final class SuggestedBookBloc
    extends Bloc<SuggestedBookEvent, SuggestedBookState> {
  SuggestedBookBloc({required this.closeSearchBar}) : super(NoPickedBook()) {
    on<SuggestedBookPicked>(_onSuggestedBookPicked);
    on<NoBookPicked>(_onClearPickedBook);
  }

  final CloseSearchBar closeSearchBar;

  Future<void> _onSuggestedBookPicked(
    SuggestedBookPicked event,
    Emitter<SuggestedBookState> emit,
  ) async {
    emit(BookPickedState(pickedBook: event.pickedBook));
    closeSearchBar(NoParams());
    return Future.value();
  }

  Future<void> _onClearPickedBook(
    NoBookPicked event,
    Emitter<SuggestedBookState> emit,
  ) async {
    emit(NoPickedBook());
    return Future.value();
  }
}
