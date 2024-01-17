import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:homer/features/manage_books/presentation/bloc/summary/book_summary_bloc.dart';
import 'package:test/test.dart';

import '../../../../../test_utils/fakes.dart';

void main() {
  group('_onSummaryModeDisabling', () {
    final book = fakeBook();

    blocTest<BookSummaryBloc, BookSummaryState>(
      'should emit disabling with None() as previous book in summary',
      build: () => BookSummaryBloc(),
      act: (bloc) => bloc.add(SummaryModeDisabling()),
      expect: () => [
        const BookSummaryState(
          current: None(),
          previous: None(),
          value: SummaryMode.disabling,
        ),
      ],
    );

    blocTest<BookSummaryBloc, BookSummaryState>(
      'should emit disabling with last book in summary',
      seed: () => BookSummaryState.enabled(book),
      build: () => BookSummaryBloc(),
      act: (bloc) => bloc.add(SummaryModeDisabling()),
      expect: () => [
        BookSummaryState(
          current: const None(),
          previous: some(book),
          value: SummaryMode.disabling,
        ),
      ],
    );
  });

  group('_onSummaryModeToggled', () {
    final book = fakeBook();

    blocTest<BookSummaryBloc, BookSummaryState>(
      'should emit enabled when book is not in summary mode',
      build: () => BookSummaryBloc(),
      act: (bloc) => bloc.add(SummaryModeToggled(book)),
      expect: () => [
        BookSummaryState(
          current: some(book),
          previous: const None(),
          value: SummaryMode.enabled,
        ),
      ],
    );

    blocTest<BookSummaryBloc, BookSummaryState>(
      'should emit disabling when this book is already in summary mode',
      seed: () => BookSummaryState.enabled(book),
      build: () => BookSummaryBloc(),
      act: (bloc) => bloc.add(SummaryModeToggled(book)),
      expect: () => [
        BookSummaryState(
          current: const None(),
          previous: some(book),
          value: SummaryMode.disabling,
        ),
      ],
    );
  });

  group('_onSummaryModeDisabled', () {
    blocTest<BookSummaryBloc, BookSummaryState>(
      'should emit disabled',
      build: () => BookSummaryBloc(),
      act: (bloc) => bloc.add(SummaryModeDisabled()),
      expect: () => [
        const BookSummaryState(
          current: None(),
          previous: None(),
          value: SummaryMode.disabled,
        ),
      ],
    );
  });
}
