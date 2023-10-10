import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';

import '../../../../core/utils/fallback_img.dart';
import '../../../../core/widgets/book_authors.dart';
import '../../../../core/widgets/book_title.dart';
import '../../../../core/widgets/card_footer.dart';
import '../../../search/domain/entities/remote_book.dart';

final class RemoteBookCard extends StatelessWidget {
  const RemoteBookCard({super.key, required this.book});

  final RemoteBook book;

  @override
  Widget build(BuildContext context) {
    return TransparentImageCard(
      contentMarginTop: 168,
      height: 280,
      imageProvider: _imageProvider() as ImageProvider<Object>,
      tags: const [],
      title: BookTitle(title: book.title),
      description: BookAuthors(authorNames: book.authors),
      footer: BookCardFooter(
        rating: book.averageRating,
        pageCount: book.pageCount,
      ),
    );
  }

  Object _imageProvider() {
    return book.thumbnail.fold(
      () => coverFallbackAssetImage(),
      (thumbnail) => CachedNetworkImageProvider(thumbnail.toString()),
    );
  }
}
