part of 'books_list.dart';

const _noSummaryText = 'No summary.';

final class _AnimatedSummaryCard extends StatelessWidget {
  const _AnimatedSummaryCard({required this.book});

  final Book book;

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
            child: _ScrollPropagationStopper(
              child: SingleChildScrollView(
                child: Text(
                  book.summary.fold(
                    () => _noSummaryText,
                    (summary) => summary.isEmpty ? _noSummaryText : summary,
                  ),
                  style: context.bodyLarge,
                ),
              ),
            ),
          ),
          blurColor: context.background,
          child: _BookCover(book: book),
        ),
      ),
    );
  }
}

/// This widget prevents scroll events propagation.
///
/// It's needed because [_AnimatedSummaryCard] is a scrollable and the scroll
/// event on it, interacts with [FloatingSearchBar] which gets hidden on scroll.
///
/// This behavior of hiding search bar is needed when the parent [GridView]
/// (listing all the  books) is scrolled, but it should not happen when
/// [_AnimatedSummaryCard] is scrolled. This widget "swallows"
/// [ScrollNotification]s to prevent that behaviour.
final class _ScrollPropagationStopper extends StatelessWidget {
  const _ScrollPropagationStopper({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        // Stop propagating notification further.
        return true;
      },
      child: child,
    );
  }
}
