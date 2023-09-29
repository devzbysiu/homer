import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:homer/core/book/domain/entity/book_entity.dart';
import 'package:homer/core/book/domain/use_case/list_books/books_bloc.dart';
import 'package:homer/core/utils/extensions.dart';
import 'package:swipeable_tile/swipeable_tile.dart';

// ignore: must_be_immutable
class SwipeableCard extends StatelessWidget {
  const SwipeableCard({super.key, required this.child, required this.book});

  final Widget child;

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return SwipeableTile.swipeToTriggerCard(
      color: Colors.white,
      shadow: BoxShadow(
        color: Colors.black.withOpacity(0.35),
        blurRadius: 4,
        offset: const Offset(2, 2),
      ),
      horizontalPadding: 16,
      verticalPadding: 8,
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
      context.emitBooksEvt(BookSwipedRight(book));
    } else if (_swipingToLeft(direction) && _canSwipeLeft()) {
      _showSnackbarOnLeftSwipe(context);
      context.emitBooksEvt(BookSwipedLeft(book));
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
        _showSnackbar(context, 'Book moved to Reading!', Colors.blue);
        return;
      case BookState.reading:
        _showSnackbar(context, 'Book moved to Read!', Colors.amber);
        return;
      case BookState.read:
        return;
    }
  }

  void _showSnackbar(BuildContext context, String msg, Color color) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        color: color,
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
        _showSnackbar(context, 'Book moved to Read Later!', Colors.green);
        return;
      case BookState.read:
        _showSnackbar(context, 'Book moved to Reading!', Colors.blue);
        return;
    }
  }

  Widget _animatedBackground(BuildContext _,
      SwipeDirection direction,
      AnimationController progress,) {
    return _AnimatedBackground(
      progress: progress,
      direction: direction,
      currentState: book.state,
    );
  }
}

class _AnimatedBackground extends StatelessWidget {
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
          return _animateRightSwipe();
        }
        return _animateLeftSwipe();
      },
    );
  }

  bool _swipingToRight() {
    return direction == SwipeDirection.startToEnd;
  }

  Widget _animateRightSwipe() {
    switch (currentState) {
      case BookState.readLater:
        return _animateToReadingRight();
      case BookState.reading:
        return _animateToRead();
      case BookState.read:
        return Container();
    }
  }

  Widget _animateToReadingRight() {
    return _animateTo(
      Icons.book,
      progress,
      MainAxisAlignment.start,
      const EdgeInsets.only(left: 30),
      Colors.blue,
    );
  }

  Widget _animateTo(
    IconData icon,
    AnimationController progress,
    MainAxisAlignment alignment,
    EdgeInsets padding,
    Color color,
  ) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      color: progress.value > 0.3 ? color : Colors.white,
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

  Widget _animateToRead() {
    return _animateTo(
      Icons.done,
      progress,
      MainAxisAlignment.start,
      const EdgeInsets.only(left: 30),
      Colors.amber,
    );
  }

  Widget _animateLeftSwipe() {
    switch (currentState) {
      case BookState.readLater:
        return Container();
      case BookState.reading:
        return _animateToForLater();
      case BookState.read:
        return _animateToReadingLeft();
    }
  }

  Widget _animateToForLater() {
    return _animateTo(
      Icons.bookmark,
      progress,
      MainAxisAlignment.end,
      const EdgeInsets.only(right: 30),
      Colors.green,
    );
  }

  Widget _animateToReadingLeft() {
    return _animateTo(
      Icons.book,
      progress,
      MainAxisAlignment.end,
      const EdgeInsets.only(right: 30),
      Colors.blue,
    );
  }
}
