part of 'bottom_drawer_content.dart';

final class _SaveButtons extends StatelessWidget {
  const _SaveButtons({required this.pickedBook});

  final RemoteBook pickedBook;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _SaveForLaterButton(pickedBook: pickedBook),
        _SaveToReadingButton(pickedBook: pickedBook),
        _SaveToReadButton(pickedBook: pickedBook),
      ],
    );
  }
}

class _SaveToReadButton extends StatelessWidget {
  const _SaveToReadButton({required this.pickedBook});

  final RemoteBook pickedBook;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _addBook(
        context,
        pickedBook,
        LocalBookState.read,
      ),
      color: Theme.of(context).colorScheme.secondary,
      icon: const Icon(Icons.done),
    );
  }
}

class _SaveToReadingButton extends StatelessWidget {
  const _SaveToReadingButton({required this.pickedBook});

  final RemoteBook pickedBook;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _addBook(
        context,
        pickedBook,
        LocalBookState.reading,
      ),
      color: Theme.of(context).colorScheme.secondary,
      icon: const Icon(Icons.book),
    );
  }
}

class _SaveForLaterButton extends StatelessWidget {
  const _SaveForLaterButton({required this.pickedBook});

  final RemoteBook pickedBook;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _addBook(
        context,
        pickedBook,
        LocalBookState.readLater,
      ),
      color: Theme.of(context).colorScheme.secondary,
      icon: const Icon(Icons.bookmark),
    );
  }
}

void _addBook(
  BuildContext context,
  RemoteBook pickedBook,
  LocalBookState bookState,
) {
  final selectedTags = context.selectedTags();
  context.addBook(pickedBook, bookState, selectedTags);
  context.clearPickedBook();
  context.clearSelectedTags();
}
