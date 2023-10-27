import 'package:flutter/material.dart';

final class BookAuthors extends StatelessWidget {
  const BookAuthors({super.key, required this.authorNames});

  final List<String> authorNames;

  @override
  Widget build(BuildContext context) {
    return Text(
      authorNames.join(', '),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style:
          Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
    );
  }
}
