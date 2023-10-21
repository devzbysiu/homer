import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_tile/swipeable_tile.dart';

import '../../../../core/utils/extensions/books_context_ext.dart';
import '../../../book_summary/domain/entities/local_book.dart';

final class SwipeableCard extends StatelessWidget {
  const SwipeableCard({super.key, required this.child, required this.book});

  final Widget child;

  final LocalBook book;

  @override
  Widget build(BuildContext context) {
    return SwipeableTile.swipeToTriggerCard(
      color: Theme.of(context).cardColor,
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
      context.bookSwipedRight(book);
    } else if (_swipingToLeft(direction) && _canSwipeLeft()) {
      _showSnackbarOnLeftSwipe(context);
      context.bookSwipedLeft(book);
    }
  }

  bool _swipingToRight(SwipeDirection direction) {
    return direction == SwipeDirection.startToEnd;
  }

  bool _swipingToLeft(SwipeDirection direction) {
    return direction == SwipeDirection.endToStart;
  }

  bool _canSwipeRight() {
    return book.state != LocalBookState.read;
  }

  bool _canSwipeLeft() {
    return book.state != LocalBookState.readLater;
  }

  void _showSnackbarOnRightSwipe(BuildContext context) {
    switch (book.state) {
      case LocalBookState.readLater:
        _showSnackbar(context, 'Book moved to Reading!');
        return;
      case LocalBookState.reading:
        _showSnackbar(context, 'Book moved to Read!');
        return;
      case LocalBookState.read:
        return;
    }
  }

  void _showSnackbar(BuildContext context, String msg) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        color: Theme.of(context).colorScheme.primaryContainer,
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
      case LocalBookState.readLater:
        return;
      case LocalBookState.reading:
        _showSnackbar(context, 'Book moved to Read Later!');
        return;
      case LocalBookState.read:
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

  final LocalBookState currentState;

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
      case LocalBookState.readLater:
        return _animateToReadingRight(context);
      case LocalBookState.reading:
        return _animateToRead(context);
      case LocalBookState.read:
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
      case LocalBookState.readLater:
        return Container();
      case LocalBookState.reading:
        return _animateToForLater(context);
      case LocalBookState.read:
        return _animateToReadingLeft(context);
    }
  }

  Widget _animateToForLater(BuildContext context) {
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
