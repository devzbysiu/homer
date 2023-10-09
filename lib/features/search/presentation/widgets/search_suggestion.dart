import 'package:banner_listtile/banner_listtile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/fallback_img.dart';
import '../../domain/entities/remote_book.dart';
import '../bloc/search_for_books_bloc.dart';

final class SearchSuggestion extends StatelessWidget {
  const SearchSuggestion({super.key, required this.book});

  final RemoteBook book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 3,
        child: BannerListTile(
          bannerTextColor: Colors.black,
          bannerColor: Colors.amber,
          bannerText: book.averageRating.toStringAsFixed(2),
          onTap: () => _onTap(context),
          backgroundColor: Colors.white,
          borderRadius: BorderRadius.circular(8),
          imageContainer: _ListTileThumbnail(book: book),
          title: Text(
            book.title,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.black,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          subtitle: Text(
            'by ${book.authors.join(', ')}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  void _onTap(BuildContext context) {
    context.emitSearchForBooksEvt(SuggestedBookPicked(book));
  }
}

class _ListTileThumbnail extends StatelessWidget {
  const _ListTileThumbnail({required this.book});

  final RemoteBook book;

  @override
  Widget build(BuildContext context) {
    return book.imageLinks.isEmpty
        ? fallbackThumbnail()
        : FadeInImage(
            image: CachedNetworkImageProvider(
              book.imageLinks.values.first.toString(),
            ),
            placeholder: thumbnailFallbackAssetImage(),
            fit: BoxFit.cover,
            imageErrorBuilder: (_, __, ___) => fallbackThumbnail(),
          );
  }
}
