import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homer/core/book/domain/entity/book_entity.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'suggested_book_event.dart';
part 'suggested_book_state.dart';

class SuggestedBookBloc extends Bloc<SuggestedBookEvent, SuggestedBookState> {
  SuggestedBookBloc() : super(const SuggestedBookInitial()) {
    on<SuggestedBookPicked>(_onSuggestedBookPicked);
  }

  FutureOr<void> _onSuggestedBookPicked(
    SuggestedBookPicked event,
    Emitter<SuggestedBookState> emit,
  ) {
    emit(BookPickedState(pickedBook: event.pickedBook));
  }
}
