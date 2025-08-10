import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:homer/features/manage_books/presentation/bloc/summary/book_summary_bloc.dart';
import 'package:homer/features/manage_books/presentation/bloc/summary/book_summary_event.dart';
import 'package:homer/features/manage_books/presentation/bloc/summary/book_summary_state.dart';
import 'package:test/test.dart';

import '../../../../../test_utils/fakes.dart';

void main() {
  group('_onSummaryModeDisabling', () {
    final book = fakeBook();

    blocTest<BookSummaryBloc, BookSummaryState>(
      'should emit disabling with None() as previous book in summary',
      build: () => BookSummaryBloc(),
      act: (bloc) => bloc.add(SummaryModeClosing()),
      expect: () => [const BookSummaryState.disabling(None())],
    );

    blocTest<BookSummaryBloc, BookSummaryState>(
      'should emit disabling with last book in summary',
      seed: () => BookSummaryState.enabled(book),
      build: () => BookSummaryBloc(),
      act: (bloc) => bloc.add(SummaryModeClosing()),
      expect: () => [BookSummaryState.disabling(Some(book))],
    );
  });

  group('_onSummaryModeToggled', () {
    final book = fakeBook();

    blocTest<BookSummaryBloc, BookSummaryState>(
      'should emit enabled when book is not in summary mode',
      build: () => BookSummaryBloc(),
      act: (bloc) => bloc.add(SummaryModeToggled(book)),
      expect: () => [BookSummaryState.enabled(book)],
    );

    blocTest<BookSummaryBloc, BookSummaryState>(
      'should emit disabling when this book is already in summary mode',
      seed: () => BookSummaryState.enabled(book),
      build: () => BookSummaryBloc(),
      act: (bloc) => bloc.add(SummaryModeToggled(book)),
      expect: () => [BookSummaryState.disabling(some(book))],
    );
  });

  group('_onSummaryModeDisabled', () {
    blocTest<BookSummaryBloc, BookSummaryState>(
      'should emit disabled',
      build: () => BookSummaryBloc(),
      act: (bloc) => bloc.add(SummaryModeClosed()),
      expect: () => [const BookSummaryState.disabled()],
    );
  });
}
