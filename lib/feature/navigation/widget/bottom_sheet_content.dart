import 'package:flutter/material.dart';
import 'package:homer/core/utils/extensions.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    final pickedBook = context.pickedSuggestedBook();
    return pickedBook == null ? Container() : Padding(
      padding: const EdgeInsets.only(left: 15, top: 80.0),
      child: Text(pickedBook.title),
    );
  }
}
