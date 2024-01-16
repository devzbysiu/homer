part of 'books_list.dart';

final class _DeletableCard extends StatelessWidget {
  const _DeletableCard({required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Animate(
      onPlay: (controller) => controller.repeat(),
      effects: const [ShakeEffect(rotation: 0.01, hz: 2.5)],
      child: _SwipeableCard(
        book: book,
        child: BlocSelector<DeleteBooksBloc, DeleteBooksState, bool>(
          selector: (state) => state.deletionList.contains(book),
          builder: (context, isOnDeleteList) {
            return isOnDeleteList
                ? _WithRedOverlay(child: _BookCover(book: book))
                : _BookCover(book: book);
          },
        ),
      ),
    );
  }
}

final class _WithRedOverlay extends StatelessWidget {
  const _WithRedOverlay({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Blur(
      colorOpacity: 0.8,
      blur: 0.0,
      overlay: Center(
        child: Icon(
          Icons.done,
          color: context.icon,
          size: 35,
        ),
      ),
      blurColor: context.error,
      child: child,
    );
  }
}
