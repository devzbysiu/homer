import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../books_listing/domain/entities/book.dart';
import '../../domain/usecases/search_books.dart';

part 'search_for_books_event.dart';

part 'search_for_books_state.dart';

final class SearchForBooksBloc
    extends Bloc<SearchForBooksEvent, SearchForBooksState> {
  SearchForBooksBloc({required this.searchBooks}) : super(const Empty()) {
    on<SearchInitiated>(_onSearchInitiated);
  }

  final SearchBooks searchBooks;

  Future<void> _onSearchInitiated(
    SearchInitiated event,
    Emitter<SearchForBooksState> emit,
  ) async {
    if (event.query.isEmpty) {
      return;
    }
    final searchResult = await searchBooks(SearchParams(query: event.query));
    searchResult.when(
      (success) => emit(FoundBooks(foundBooks: success)),
      (error) => emit(const FailedToSearchBooks()),
    );
  }
}
