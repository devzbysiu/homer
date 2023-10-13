import 'package:flutter/material.dart';

final class BookCardFooter extends StatelessWidget {
  const BookCardFooter({
    super.key,
    required this.rating,
    required this.pageCount,
  });

  final double rating;

  final int pageCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(
          width: 4,
        ),
        Expanded(
          child: Text(
            rating.toStringAsFixed(2),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        Text(
          pageCount.toString(),
          style: const TextStyle(color: Colors.white),
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 10,
          ),
        ),
        const Icon(
          Icons.menu_book_outlined,
          color: Colors.white,
        )
      ],
    );
  }
}
