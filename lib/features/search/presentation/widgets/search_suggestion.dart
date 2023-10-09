import 'package:banner_listtile/banner_listtile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/extensions.dart';
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
            'by ${book.authors.join(' ')}',
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
    final bookThumbnail = book.imageLinks.values.first;
    return FadeInImage(
      image: CachedNetworkImageProvider(bookThumbnail.toString()),
      placeholder: const AssetImage('assets/book-thumbnail-fallback.png'),
      fit: BoxFit.cover,
      imageErrorBuilder: _onError,
    );
  }

  Widget _onError(BuildContext _, Object __, StackTrace? ___) {
    return const Image(image: AssetImage('assets/book-thumbnail-fallback.png'));
  }
}
