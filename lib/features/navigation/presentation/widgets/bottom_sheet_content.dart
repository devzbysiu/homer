import 'package:flutter/material.dart';

import '../../../../core/utils/extensions/book_search_context_ext.dart';
import '../../../add_new_book/presentation/widgets/book_with_summary.dart';
import '../../../add_new_book/presentation/widgets/save_buttons.dart';
import '../../../add_new_book/presentation/widgets/tags.dart';

final class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    final pickedBook = context.pickedBook();
    return pickedBook.fold(
      () => Container(),
      (book) => Padding(
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
      ),
    );
  }
}
