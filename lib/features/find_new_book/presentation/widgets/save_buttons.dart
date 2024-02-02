part of 'bottom_drawer_content.dart';

final class _SaveButtons extends StatelessWidget {
  const _SaveButtons({required this.pickedBook});

  final Book pickedBook;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _saveToReadLaterButton(),
        _saveToReadingButton(),
        _saveToReadButton(),
      ],
    );
  }

  _SavingButton _saveToReadLaterButton() {
    return _SavingButton(
      pickedBook: pickedBook,
      bookState: BookState.readLater,
      icon: Icons.bookmark,
    );
  }

  _SavingButton _saveToReadingButton() {
    return _SavingButton(
      pickedBook: pickedBook,
      bookState: BookState.reading,
      icon: Icons.book,
    );
  }

  _SavingButton _saveToReadButton() {
    return _SavingButton(
      pickedBook: pickedBook,
      bookState: BookState.read,
      icon: Icons.done,
    );
  }
}

final class _SavingButton extends StatelessWidget {
  _SavingButton({
    required this.pickedBook,
    required this.bookState,
    required this.icon,
    Bus? eventBus,
  }) : _eventBus = eventBus ?? sl<Bus>();

  final Book pickedBook;

  final BookState bookState;

  final IconData icon;

  final Bus _eventBus;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _addBook(context, pickedBook, bookState),
      color: context.secondary,
      icon: Icon(icon),
    );
  }

  void _addBook(BuildContext context, Book pickedBook, BookState pickedState) {
    final selectedTags = context.selectedTags();
    _eventBus.fire(SaveBookStarted(pickedBook, pickedState, selectedTags));
  }
}
