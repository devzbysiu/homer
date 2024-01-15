part of 'bottom_drawer_content.dart';

final class _PickedBookArea extends StatelessWidget {
  const _PickedBookArea();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ShareBookBloc, ShareBookState, ShareState>(
      selector: (state) => state.value,
      builder: (context, shareState) {
        switch (shareState) {
          case ShareState.fetchingBookDetails:
            return const _SearchProgressIndicator();
          case ShareState.fetchingDetailsFailed:
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
    return BlocSelector<BookSearchBloc, BookSearchState, dartz.Option<String>>(
      selector: (state) => state.searchFailureCause,
      builder: (context, failureCause) {
        return failureCause.fold(
          () => const Placeholder(),
          (cause) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.error,
                  size: 80,
                  color: context.error,
                ),
                Text(
                  cause,
                  style: context.errorStyle,
                )
              ],
            );
          },
        );
      },
    );
  }
}
