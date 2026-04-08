import '../../../../core/entities/book.dart';
import 'package:flutter/material.dart';

import 'with_saved_check_mark_theme.dart';

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
    this.width,
    this.height,
    this.iconSize,
  });

  final Widget child;

  final Book book;

  final double? width;

  final double? height;

  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    final t = context.withSavedCheckMarkTheme;
    return Stack(
      children: [
        child,
        if (book.alreadySaved)
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: width ?? t.overlayWidth,
              height: height ?? t.overlayHeight,
              decoration: BoxDecoration(color: t.overlayColor),
            ),
          ),
        if (book.alreadySaved)
          Positioned(
            top: 0,
            left: t.iconLeftOffset,
            child: Tooltip(
              message: 'Looks like this book is already saved',
              showDuration: const Duration(seconds: 4),
              child: Icon(
                _bookStateToIcon[book.state],
                size: iconSize ?? t.iconSize,
                color: t.iconColor,
              ),
            ),
          ),
      ],
    );
  }
}
