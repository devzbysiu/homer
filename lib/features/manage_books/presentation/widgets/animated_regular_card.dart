part of 'books_list.dart';

class _AnimatedRegularCard extends StatelessWidget {
  const _AnimatedRegularCard({required this.book, required this.context});

  final Book book;

  final BuildContext context;

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
      onComplete: (_) => context.summaryModeDisabled(),
    );
  }
}
