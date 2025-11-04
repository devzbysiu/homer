part of 'books_list.dart';

final class _BookCover extends StatelessWidget {
  const _BookCover({required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    final t = context.booksListTheme;
    return TransparentImageCard(
      height: t.coverHeight,
      tagRunSpacing: t.coverTagRunSpacing,
      imageProvider: _imageProvider() as ImageProvider<Object>,
      tags: _tags(),
      endColor: t.coverEndColor,
      title: BookTitleAndTagTile(book: book),
      description: BookAuthors(authorNames: book.authors),
      footer: BookCardFooter(
        shareText: dartz.some('${book.title} by ${book.authors.join(',')}'),
        rating: book.rating,
        pageCount: book.pageCount,
      ),
    );
  }

  Object _imageProvider() {
    return book.thumbnailAddress.fold(
      () => coverFallbackAssetImage(),
      (thumbnailAddress) => CachedNetworkImageProvider(thumbnailAddress),
    );
  }

  List<Widget> _tags() => book.tags.map((tag) => _Tag(tag: tag)).toList();
}

final class _Tag extends StatelessWidget {
  const _Tag({required this.tag});

  final Tag tag;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            context.booksListTheme.tagChipBorderRadius,
          ),
          color: HexColor(tag.hexColor),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: context.booksListTheme.tagChipHorizontalPadding,
          vertical: context.booksListTheme.tagChipVerticalPadding,
        ),
        child: Text(
          tag.name,
          style: TextStyle(color: context.booksListTheme.tagChipTextColor),
        ),
      ),
    );
  }
}
