import 'package:flutter/material.dart';

final class BookTitle extends StatelessWidget {
  const BookTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        title,
        maxLines: 1,
        style: const TextStyle(color: Colors.white),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
