import 'package:flutter/material.dart';
import 'package:homer/core/utils/extensions.dart';
import 'package:homer/feature/bottom_drawer/widget/book_with_summary.dart';
import 'package:homer/feature/bottom_drawer/widget/save_buttons.dart';
import 'package:homer/feature/bottom_drawer/widget/tags.dart';

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
                  child: const Tags(),
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
