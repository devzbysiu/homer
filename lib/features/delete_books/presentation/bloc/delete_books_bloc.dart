import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../books_listing/domain/entities/book.dart';
import '../../domain/usecases/delete_picked_books.dart';

part 'delete_books_event.dart';

part 'delete_books_state.dart';

class DeleteBooksBloc extends Bloc<DeleteBooksEvent, DeleteBooksState> {
  DeleteBooksBloc({required this.deleteBooks}) : super(const Empty()) {
    on<PickedForDeletion>(_onPickedForDeletion);
    on<DeleteBooks>(_onDeleteBooks);
  }

  final DeletePickedBooks deleteBooks;

  final List<Book> _deletionList = [];

  Future<void> _onPickedForDeletion(
    PickedForDeletion event,
    Emitter<DeleteBooksState> emit,
  ) async {
    _deletionList.add(event.book);
    emit(DeletionList(books: List.of(_deletionList)));
    return Future.value();
  }

  Future<void> _onDeleteBooks(
    DeleteBooks event,
    Emitter<DeleteBooksState> emit,
  ) async {
    _deletionList.clear();
    emit(const DeletionList(books: []));
    await deleteBooks(DeleteParams(books: event.books));
    return Future.value();
  }
}
