part of 'books_list.dart';

final class _SwipeableCard extends StatelessWidget {
  _SwipeableCard({required this.child, required this.book, Bus? eventBus})
      : _eventBus = eventBus ?? sl<Bus>();

  final Widget child;

  final Book book;

  final Bus _eventBus;

  @override
  Widget build(BuildContext context) {
    return SwipeableTile.swipeToTriggerCard(
      color: context.card,
      shadow: const BoxShadow(),
      horizontalPadding: 10,
      verticalPadding: 10,
      borderRadius: 8,
      direction: SwipeDirection.horizontal,
      onSwiped: (direction) => _onSwiped(context, direction),
      backgroundBuilder: _animatedBackground,
      key: UniqueKey(),
      child: child,
    );
  }

  void _onSwiped(BuildContext context, SwipeDirection direction) {
    if (_swipingToRight(direction) && _canSwipeRight()) {
      _showSnackbarOnRightSwipe(context);
      final movedBook = book.moveRight();
      _eventBus.fire(BookSwipedRight(movedBook));
      // Update stats
      if (movedBook.state == BookState.read) {
        _eventBus.fire(BookFinished(movedBook));
      } else if (movedBook.state == BookState.reading) {
        _eventBus.fire(BookStarted());
      }
    } else if (_swipingToLeft(direction) && _canSwipeLeft()) {
      _showSnackbarOnLeftSwipe(context);
      final movedBook = book.moveLeft();
      _eventBus.fire(BookSwipedLeft(movedBook));
      // Update stats
      if (movedBook.state == BookState.reading) {
        // so it was in `read` state before
        // need to use `book` with set `endDate` (not `movedBook`)
        _eventBus.fire(BookUnfinished(book));
      } else if (movedBook.state == BookState.readLater) {
        // so it was in `reading` state before
        _eventBus.fire(BookUnstarted());
      }
    }
  }

  bool _swipingToRight(SwipeDirection direction) {
    return direction == SwipeDirection.startToEnd;
  }

  bool _swipingToLeft(SwipeDirection direction) {
    return direction == SwipeDirection.endToStart;
  }

  bool _canSwipeRight() {
    return book.state != BookState.read;
  }

  bool _canSwipeLeft() {
    return book.state != BookState.readLater;
  }

  void _showSnackbarOnRightSwipe(BuildContext context) {
    switch (book.state) {
      case BookState.readLater:
        _showSnackbar(context, 'Book moved to Reading!');
        return;
      case BookState.reading:
        _showSnackbar(context, 'Book moved to Read!');
        return;
      case BookState.read:
        return;
    }
  }

  void _showSnackbar(BuildContext context, String msg) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        color: context.primaryContainer,
        messageFontSize: 18,
        title: 'Yay!',
        message: msg,
        contentType: ContentType.success,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void _showSnackbarOnLeftSwipe(BuildContext context) {
    switch (book.state) {
      case BookState.readLater:
        return;
      case BookState.reading:
        _showSnackbar(context, 'Book moved to Read Later!');
        return;
      case BookState.read:
        _showSnackbar(context, 'Book moved to Reading!');
        return;
    }
  }

  Widget _animatedBackground(
    BuildContext _,
    SwipeDirection direction,
    AnimationController progress,
  ) {
    return _AnimatedBackground(
      progress: progress,
      direction: direction,
      currentState: book.state,
    );
  }
}

final class _AnimatedBackground extends StatelessWidget {
  const _AnimatedBackground({
    required this.progress,
    required this.direction,
    required this.currentState,
  });

  final AnimationController progress;

  final SwipeDirection direction;

  final BookState currentState;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (_, __) {
        if (_swipingToRight()) {
          return _animateRightSwipe(context);
        }
        return _animateLeftSwipe(context);
      },
    );
  }

  bool _swipingToRight() {
    return direction == SwipeDirection.startToEnd;
  }

  Widget _animateRightSwipe(BuildContext context) {
    switch (currentState) {
      case BookState.readLater:
        return _animateToReadingRight(context);
      case BookState.reading:
        return _animateToRead(context);
      case BookState.read:
        return Container();
    }
  }

  Widget _animateToReadingRight(BuildContext context) {
    return _animateTo(
      Icons.book,
      progress,
      MainAxisAlignment.start,
      const EdgeInsets.only(left: 30),
    );
  }

  Widget _animateTo(
    IconData icon,
    AnimationController progress,
    MainAxisAlignment alignment,
    EdgeInsets padding,
  ) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: alignment,
        children: [
          Padding(
            padding: padding,
            child: Icon(icon),
          ),
        ],
      ),
    );
  }

  Widget _animateToRead(BuildContext context) {
    return _animateTo(
      Icons.done,
      progress,
      MainAxisAlignment.start,
      const EdgeInsets.only(left: 30),
    );
  }

  Widget _animateLeftSwipe(BuildContext context) {
    switch (currentState) {
      case BookState.readLater:
        return Container();
      case BookState.reading:
        return _animateToReadLater(context);
      case BookState.read:
        return _animateToReadingLeft(context);
    }
  }

  Widget _animateToReadLater(BuildContext context) {
    return _animateTo(
      Icons.bookmark,
      progress,
      MainAxisAlignment.end,
      const EdgeInsets.only(right: 30),
    );
  }

  Widget _animateToReadingLeft(BuildContext context) {
    return _animateTo(
      Icons.book,
      progress,
      MainAxisAlignment.end,
      const EdgeInsets.only(right: 30),
    );
  }
}
