import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

final class BookCardFooter extends StatelessWidget {
  const BookCardFooter({
    super.key,
    required this.rating,
    required this.pageCount,
    this.shareText = const None(),
  });

  final double rating;

  final int pageCount;

  final Option<String> shareText;

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
        shareText.fold(
          () => const SizedBox.shrink(),
          (text) => Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              child: const Icon(
                Icons.share,
                size: 20,
              ),
              onTap: () => Share.share(text),
            ),
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
