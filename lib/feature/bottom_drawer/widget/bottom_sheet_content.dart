import 'package:flutter/material.dart';

import '../../../core/utils/extensions.dart';
import 'book_with_summary.dart';
import 'save_buttons.dart';
import 'tags.dart';

final class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    final pickedBook = context.pickedSuggestedBook();
    return pickedBook == null
        ? Container()
        : Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Stack(
              children: [
                BookWithSummary(pickedBook: pickedBook),
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
                  child: SaveButtons(pickedBook: pickedBook),
                )
              ],
            ),
          );
  }
}
