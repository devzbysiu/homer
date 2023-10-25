import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../search/presentation/bloc/book_search_bloc.dart';
import 'savable_book_with_summary.dart';
import 'search_error.dart';
import 'search_progress_indicator.dart';

final class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookSearchBloc, BookSearchState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case FetchingSharedBookDetails:
            return const SearchProgressIndicator();
          case FailedToLookUpSharedBook:
            return const SearchError();
          default:
            return const SavableBookWithSummary();
        }
      },
    );
  }
}
