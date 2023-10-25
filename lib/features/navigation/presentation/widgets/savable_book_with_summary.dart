import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../add_new_book/presentation/widgets/book_with_summary.dart';
import '../../../add_new_book/presentation/widgets/save_buttons.dart';
import '../../../add_new_book/presentation/widgets/tags.dart';
import '../../../search/presentation/bloc/book_search_bloc.dart';

final class SavableBookWithSummary extends StatelessWidget {
  const SavableBookWithSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookSearchBloc, BookSearchState>(
      builder: (context, state) {
        if (state is! BookPicked && state is! BookShared) return Container();
        final book = state.pickedBook.toNullable()!;
        return Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Stack(
            children: [
              BookWithSummary(pickedBook: book),
              Positioned(
                width: MediaQuery.of(context).size.width,
                bottom: 60,
                child: const Padding(
                  padding: EdgeInsets.only(right: 18.0),
                  child: Tags(),
                ),
              ),
              Positioned(
                width: MediaQuery.of(context).size.width,
                bottom: 10,
                child: SaveButtons(pickedBook: book),
              )
            ],
          ),
        );
      },
    );
  }
}
