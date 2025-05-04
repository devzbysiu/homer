part of 'bottom_drawer_content.dart';

final class _PickedBookArea extends StatelessWidget {
  const _PickedBookArea();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShareBookBloc, ShareBookState>(
      builder: (context, state) {
        switch (state.value) {
          case ShareState.fetchingBookDetails:
            return const _SearchProgressIndicator();
          case ShareState.fetchingDetailsFailed:
            return _SearchError(cause: state.failureCause);
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
  const _SearchError({required this.cause});

  final String cause;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.error, size: 80, color: context.error),
        SelectableText(cause, style: context.errorStyle),
      ],
    );
  }
}
