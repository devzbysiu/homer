part of 'books_list.dart';

class _RegularCard extends StatelessWidget {
  const _RegularCard({required this.book});

  final LocalBook book;

  @override
  Widget build(BuildContext context) {
    return _SwipeableCard(
      book: book,
      child: _BookCover(book: book),
    );
  }
}
