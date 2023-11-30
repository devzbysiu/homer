part of 'bottom_drawer_content.dart';

final class _PickedBookArea extends StatelessWidget {
  const _PickedBookArea();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookSearchBloc, BookSearchState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case FetchingSharedBookDetails:
            return const _SearchProgressIndicator();
          case FailedToLookUpSharedBook:
            return const _SearchError();
          default:
            return const _SavableBookWithSummary();
        }
      },
    );
  }
}

final class _SearchProgressIndicator extends StatelessWidget {
  const _SearchProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

final class _SearchError extends StatelessWidget {
  const _SearchError();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookSearchBloc, BookSearchState>(
        builder: (context, state) {
      if (state is! FailedToLookUpSharedBook) return const Placeholder();
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 80,
            color: Theme.of(context).colorScheme.error,
          ),
          Text(
            state.cause,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.error),
          )
        ],
      );
    });
  }
}
