import 'package:flutter/material.dart';

import 'book_authors_theme.dart';

final class BookAuthors extends StatelessWidget {
  const BookAuthors({super.key, required this.authorNames});

  final List<String> authorNames;

  @override
  Widget build(BuildContext context) {
    final theme = context.bookAuthorsTheme;
    return Text(
      authorNames.join(', '),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      // style: context.bodyMedium.copyWith(color: theme.namesColor),
      style: theme.textStyle,
    );
  }
}
