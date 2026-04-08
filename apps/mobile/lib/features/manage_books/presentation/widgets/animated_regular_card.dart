part of 'books_list.dart';

final class _AnimatedRegularCard extends StatelessBusWidget {
  _AnimatedRegularCard({required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [
        FlipEffect(direction: Axis.horizontal, begin: -0.6, end: 0),
      ],
      child: _RegularCard(book: book),
      onComplete: (_) => fire($SummaryModeClosed()),
    );
  }
}
