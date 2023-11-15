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
            return Blur(
              colorOpacity: isOnDeleteList ? 0.8 : 0.0,
              blur: 0.0,
              overlay: Center(
                child: isOnDeleteList
                    ? Icon(
                        Icons.done,
                        color: Theme.of(context).iconTheme.color,
                        size: 35,
                      )
                    : null,
              ),
              blurColor: Theme.of(context).colorScheme.error,
              child: _BookCover(book: book),
            );
          },
        ),
      ),
    );
  }
}
