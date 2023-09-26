import 'package:flutter/material.dart';

class BookAuthor extends StatelessWidget {
  const BookAuthor({super.key, required this.authorName});

  final String authorName;

  @override
  Widget build(BuildContext context) {
    return Text(
      authorName,
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
