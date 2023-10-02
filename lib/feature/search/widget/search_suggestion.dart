import 'package:banner_listtile/banner_listtile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:homer/core/book/domain/entity/book_entity.dart';
import 'package:homer/core/book/domain/use_case/display_suggested_book/suggested_book_bloc.dart';
import 'package:homer/core/utils/extensions.dart';

final class SearchSuggestion extends StatelessWidget {
  const SearchSuggestion({super.key, required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 3,
        child: BannerListTile(
          bannerTextColor: Colors.black,
          bannerColor: Colors.amber,
          bannerText: book.rating.toStringAsFixed(2),
          onTap: () => _onTap(context),
          backgroundColor: Colors.white,
          borderRadius: BorderRadius.circular(8),
          imageContainer: ListTileThumbnail(book: book),
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
            'by ${book.author}',
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
    context.emitSuggestedBookEvt(SuggestedBookPicked(book));
  }
}

class ListTileThumbnail extends StatelessWidget {
  const ListTileThumbnail({super.key, required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return book.thumbnailAddress == null
        ? const Image(image: AssetImage('assets/book-thumbnail-fallback.png'))
        : FadeInImage(
            image: CachedNetworkImageProvider(book.thumbnailAddress!),
            placeholder: const AssetImage('assets/book-thumbnail-fallback.png'),
            fit: BoxFit.cover,
            imageErrorBuilder: _onError,
          );
  }

  Widget _onError(BuildContext _, Object __, StackTrace? ___) {
    return const Image(image: AssetImage('assets/book-thumbnail-fallback.png'));
  }
}
