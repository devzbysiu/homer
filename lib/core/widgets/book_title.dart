import 'package:flutter/material.dart';

final class BookTitle extends StatelessWidget {
  const BookTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        // Adding `'\n'` to have at least two lines
        // (but max lines is 2 so it's always 2 lines)
        '$title\n',
        maxLines: 2,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: Colors.white),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
