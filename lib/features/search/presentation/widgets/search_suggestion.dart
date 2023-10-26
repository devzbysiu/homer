import 'package:banner_listtile/banner_listtile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/fallback_img.dart';
import '../../domain/entities/remote_book.dart';
import '../bloc/book_search_bloc.dart';

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
          bannerTextColor: Theme.of(context).colorScheme.background,
          bannerColor: Theme.of(context).primaryColor,
          bannerText: book.averageRating.toStringAsFixed(2),
          onTap: () => context.pickSuggestedBook(book),
          backgroundColor: Theme.of(context).listTileTheme.tileColor,
          borderRadius: BorderRadius.circular(8),
          imageContainer: _ListTileThumbnail(book: book),
          title: Text(
            book.title,
            style: Theme.of(context).textTheme.titleMedium,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          subtitle: Text(
            'by ${book.authors.join(', ')}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ),
    );
  }
}

final class _ListTileThumbnail extends StatelessWidget {
  const _ListTileThumbnail({required this.book});

  final RemoteBook book;

  @override
  Widget build(BuildContext context) {
    return book.thumbnail.fold(
      () => fallbackThumbnail(),
      (thumbnail) => FadeInImage(
        image: CachedNetworkImageProvider(
          thumbnail.toString(),
        ),
        placeholder: thumbnailFallbackAssetImage(),
        fit: BoxFit.cover,
        imageErrorBuilder: (_, __, ___) => fallbackThumbnail(),
      ),
    );
  }
}
