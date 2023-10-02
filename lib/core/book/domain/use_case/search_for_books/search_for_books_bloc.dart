import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homer/core/book/domain/entity/book_entity.dart';
import 'package:homer/core/book/domain/repository/books_repository.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'search_for_books_event.dart';

part 'search_for_books_state.dart';

final class SearchForBooksBloc
    extends Bloc<SearchForBooksEvent, SearchForBooksState> {
  SearchForBooksBloc({required this.booksRepo})
      : super(SearchForBooksInitial()) {
    on<SearchInitiated>(_onSearchInitiated);
  }

  Future<void> _onSearchInitiated(
    SearchInitiated event,
    Emitter<SearchForBooksState> emit,
  ) async {
    final List<BookEntity> foundBooks =
        event.query.isEmpty ? List.empty() : booksRepo.search(event.query);
    emit(FoundBooks(foundBooks: foundBooks));
  }

  final BooksRepository booksRepo;
}
