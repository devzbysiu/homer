part of 'bottom_drawer_content.dart';

final class _SearchSuggestions extends StatelessWidget {
  const _SearchSuggestions();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 470 - MediaQuery.of(context).viewInsets.bottom,
      child: SingleChildScrollView(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: context.lightBackground,
            elevation: 4.0,
            child: const _SuggestionsList(),
          ),
        ),
      ),
    );
  }
}

final class _SuggestionsList extends StatelessWidget {
  const _SuggestionsList();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BookSearchBloc, BookSearchState, List<Book>>(
      selector: (state) => state.foundBooks,
      builder: (context, foundBooks) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: _searchSuggestions(foundBooks),
        );
      },
    );
  }

  List<Widget> _searchSuggestions(List<Book> foundBooks) {
    return foundBooks.map((book) {
      return _SearchSuggestion(book: book);
    }).toList();
  }
}

final class _SearchSuggestion extends StatelessBusWidget {
  // ignore: unused_element
  _SearchSuggestion({required this.book, super.bus});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 3,
        child: WithSavedCheckMark(
          book: book,
          child: BannerListTile(
            bannerTextColor: context.background,
            bannerColor: context.primary,
            bannerText: book.rating.toStringAsFixed(2),
            onTap: () => fire(SuggestionPicked(book)),
            backgroundColor: context.background,
            borderRadius: BorderRadius.circular(8),
            imageContainer: _ListTileThumbnail(book: book),
            title: Text(
              book.title,
              style: context.titleMedium,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            subtitle: Text(
              'by ${book.authors.join(', ')}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.titleSmall,
            ),
          ),
        ),
      ),
    );
  }
}

final class _ListTileThumbnail extends StatelessWidget {
  const _ListTileThumbnail({required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return book.thumbnailAddress.fold(
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
