import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/book/domain/entities/local_book.dart';
import '../../../features/book/presentation/bloc/book_summary_bloc.dart';

extension BookContextExt on BuildContext {
  bool isInSummaryMode(LocalBook book) {
    return select((BookSummaryBloc bloc) {
      return bloc.state.book.fold(
        () => false,
        (bookInSummaryMode) => bookInSummaryMode == book,
      );
    });
  }

  void disableSummaryMode() {
    _emitBookEvt(SummaryModeDisabled());
  }

  void showSummary(LocalBook book) {
    _emitBookEvt(ShowSummary(book));
  }

  void _emitBookEvt(BookSummaryEvent event) {
    read<BookSummaryBloc>().add(event);
  }
}
