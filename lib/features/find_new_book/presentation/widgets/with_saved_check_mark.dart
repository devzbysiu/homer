import '../../../../core/entities/book.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/theme.dart';

const _bookStateToIcon = {
  BookState.readLater: Icons.bookmark_outline,
  BookState.reading: Icons.book_outlined,
  BookState.read: Icons.done_outline,
};

class WithSavedCheckMark extends StatelessWidget {
  const WithSavedCheckMark({
    super.key,
    required this.child,
    required this.book,
    this.width = 19.0,
    this.height = 25.0,
    this.iconSize = 25.0,
  });

  final Widget child;

  final Book book;

  final double width;

  final double height;

  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (book.alreadySaved)
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(color: context.background),
            ),
          ),
        if (book.alreadySaved)
          Positioned(
            top: 0,
            left: -3,
            child: Tooltip(
              message: 'Looks like this book is already saved',
              showDuration: const Duration(seconds: 4),
              child: Icon(
                _bookStateToIcon[book.state],
                size: iconSize,
                color: context.primary,
              ),
            ),
          ),
      ],
    );
  }
}
