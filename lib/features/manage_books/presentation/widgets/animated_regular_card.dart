part of 'books_list.dart';

final class _AnimatedRegularCard extends StatelessWidget {
  _AnimatedRegularCard({required this.book, Bus? eventBus})
      : _eventBus = eventBus ?? sl<Bus>();

  final Book book;

  final Bus _eventBus;

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
      onComplete: (_) => _eventBus.fire(SummaryModeClosed()),
    );
  }
}
