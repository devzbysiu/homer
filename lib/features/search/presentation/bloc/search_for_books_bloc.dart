import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../books_listing/domain/entities/book_entity.dart';
import '../../../books_listing/domain/repositories/books_repository.dart';

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
    final searchResult = await booksRepo.search(event.query);
    final List<BookEntity> foundBooks = event.query.isEmpty
        ? List.empty()
        : searchResult.when(
            (success) => success,
            (error) => List.empty(),
          );
    emit(FoundBooks(foundBooks: foundBooks));
  }

  final BooksRepository booksRepo;
}
