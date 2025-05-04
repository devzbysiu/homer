part of 'books_list.dart';

final class _RegularCard extends StatelessWidget {
  const _RegularCard({required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return _SwipeableCard(book: book, child: _BookCover(book: book));
  }
}
