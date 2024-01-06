part of 'bottom_drawer_content.dart';

final class _SaveButtons extends StatelessWidget {
  const _SaveButtons({required this.pickedBook});

  final Book pickedBook;

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

  final Book pickedBook;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _addBook(
        context,
        pickedBook,
        BookState.read,
      ),
      color: Theme.of(context).colorScheme.secondary,
      icon: const Icon(Icons.done),
    );
  }
}

class _SaveToReadingButton extends StatelessWidget {
  const _SaveToReadingButton({required this.pickedBook});

  final Book pickedBook;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _addBook(
        context,
        pickedBook,
        BookState.reading,
      ),
      color: Theme.of(context).colorScheme.secondary,
      icon: const Icon(Icons.book),
    );
  }
}

class _SaveForLaterButton extends StatelessWidget {
  const _SaveForLaterButton({required this.pickedBook});

  final Book pickedBook;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _addBook(
        context,
        pickedBook,
        BookState.readLater,
      ),
      color: Theme.of(context).colorScheme.secondary,
      icon: const Icon(Icons.bookmark),
    );
  }
}

void _addBook(
  BuildContext context,
  Book pickedBook,
  BookState bookState,
) {
  final selectedTags = context.selectedTags();
  context.addBook(pickedBook, bookState, selectedTags);
  context.clearPickedBook();
  context.clearSharedBook();
  context.clearSelectedTags();
}
