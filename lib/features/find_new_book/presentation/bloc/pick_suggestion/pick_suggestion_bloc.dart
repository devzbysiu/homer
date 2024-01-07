import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/book.dart';

part 'pick_suggestion_event.dart';
part 'pick_suggestion_state.dart';

final class PickSuggestionBloc
    extends Bloc<PickSuggestionEvent, PickSuggestionState> {
  PickSuggestionBloc() : super(const PickSuggestionState.initial()) {
    on<SuggestedBookPicked>(_onSuggestedBookPicked);
    on<ClearPickedBook>(_onClearPickedBook);
  }

  void _onSuggestedBookPicked(
    SuggestedBookPicked event,
    Emitter<PickSuggestionState> emit,
  ) {
    emit(PickSuggestionState.suggestionPicked(event.pickedBook));
  }

  void _onClearPickedBook(
    ClearPickedBook event,
    Emitter<PickSuggestionState> emit,
  ) {
    emit(const PickSuggestionState.suggestionNotPicked());
  }
}

extension PickSuggestionContextExt on BuildContext {
  void clearPickedBook() {
    _emitSearchForBooksEvt(ClearPickedBook());
  }

  void pickSuggestedBook(Book book) {
    _emitSearchForBooksEvt(SuggestedBookPicked(book));
  }

  void _emitSearchForBooksEvt(PickSuggestionEvent event) {
    read<PickSuggestionBloc>().add(event);
  }
}
