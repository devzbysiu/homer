part of 'books_list.dart';

final class _AnimatedRegularCard extends StatelessBusWidget {
  // ignore: unused_element
  _AnimatedRegularCard({required this.book, super.bus});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [
        FlipEffect(
          direction: Axis.horizontal,
          begin: -0.6,
          end: 0,
        ),
      ],
      child: _RegularCard(book: book),
      onComplete: (_) => fire(SummaryModeClosed()),
    );
  }
}
