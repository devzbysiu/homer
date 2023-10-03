import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../entity/book_entity.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'suggested_book_event.dart';

part 'suggested_book_state.dart';

final class SuggestedBookBloc
    extends Bloc<SuggestedBookEvent, SuggestedBookState> {
  SuggestedBookBloc({required this.eventBus})
      : super(const SuggestedBookInitial()) {
    on<SuggestedBookPicked>(_onSuggestedBookPicked);
    on<ClearPickedBook>(_onClearPickedBook);
  }

  Future<void> _onSuggestedBookPicked(
    SuggestedBookPicked event,
    Emitter<SuggestedBookState> emit,
  ) async {
    emit(BookPickedState(pickedBook: event.pickedBook));
    eventBus.fire(BookPicked());
  }

  Future<void> _onClearPickedBook(
    ClearPickedBook event,
    Emitter<SuggestedBookState> emit,
  ) async {
    emit(const BookPickedState(pickedBook: null));
  }

  final EventBus eventBus;
}
