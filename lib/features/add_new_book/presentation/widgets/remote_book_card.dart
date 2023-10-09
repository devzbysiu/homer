import 'package:flutter/material.dart';
import 'package:homer/core/widgets/image_card.dart';

import '../../../search/domain/entities/remote_book.dart';

final class RemoteBookCard extends StatelessWidget {
  const RemoteBookCard({super.key, required this.book});

  final RemoteBook book;

  @override
  Widget build(BuildContext context) {
    return ImageCard(
      title: book.title,
      authors: book.authors,
      rating: book.averageRating,
      pageCount: book.pageCount,
    );
  }
}
