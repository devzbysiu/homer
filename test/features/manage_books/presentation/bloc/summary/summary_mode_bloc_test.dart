import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:homer/features/manage_books/presentation/bloc/summary/book_summary_bloc.dart';
import 'package:test/test.dart';

import '../../../../../test_utils/fakes.dart';

void main() {
  group('_onSummaryModeDisabling', () {
    final book = fakeBook();

    blocTest<BookSummaryBloc, BookSummaryState>(
      'should emit DisablingSummaryMode with wasInSummaryMode set to None()',
      build: () => BookSummaryBloc(),
      act: (bloc) => bloc.add(SummaryModeDisabling()),
      expect: () => [BookSummaryState.disabling(const None())],
    );

    blocTest<BookSummaryBloc, BookSummaryState>(
      'should emit DisablingSummaryMode with wasInSummaryMode set to last book',
      build: () => BookSummaryBloc(),
      act: (bloc) => bloc
        ..add(SummaryModeToggled(book))
        ..add(SummaryModeDisabling()),
      expect: () => [
        BookSummaryState.enabled(book),
        BookSummaryState.disabling(some(book)),
      ],
    );
  });

  group('_onSummaryModeToggled', () {
    final book = fakeBook();

    blocTest<BookSummaryBloc, BookSummaryState>(
      'should emit EnableSummaryMode when this book is not in summary mode',
      build: () => BookSummaryBloc(),
      act: (bloc) => bloc.add(SummaryModeToggled(book)),
      expect: () => [BookSummaryState.enabled(book)],
    );

    blocTest<BookSummaryBloc, BookSummaryState>(
      'should emit DisablingSummaryMode when this book is already in summary mode',
      seed: () => BookSummaryState.enabled(book),
      build: () => BookSummaryBloc(),
      act: (bloc) => bloc.add(SummaryModeToggled(book)),
      expect: () => [BookSummaryState.disabling(some(book))],
    );
  });

  group('_onSummaryModeDisabled', () {
    blocTest<BookSummaryBloc, BookSummaryState>(
      'should emit DisabledSummaryMode',
      build: () => BookSummaryBloc(),
      act: (bloc) => bloc.add(SummaryModeDisabled()),
      expect: () => [const BookSummaryState.disabled()],
    );
  });
}
