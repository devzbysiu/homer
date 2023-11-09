part of 'books_list.dart';

const _noSummaryText = 'No summary.';

final class _AnimatedSummaryCard extends StatelessWidget {
  const _AnimatedSummaryCard({required this.book});

  final LocalBook book;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [
        FlipEffect(
          direction: Axis.horizontal,
          begin: 0.6,
          end: 0,
        ),
      ],
      child: _SwipeableCard(
        book: book,
        child: Blur(
          colorOpacity: 1.0,
          blur: 0.0,
          overlay: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Text(
                book.summary.fold(
                  () => _noSummaryText,
                  (summary) => summary.isEmpty ? _noSummaryText : summary,
                ),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          blurColor: Theme.of(context).colorScheme.background,
          child: _BookCover(book: book),
        ),
      ),
    );
  }
}
