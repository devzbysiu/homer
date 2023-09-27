import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homer/feature/navigation/bloc/app_tab_bloc.dart';
import 'package:swipeable_tile/swipeable_tile.dart';

class SwipeableCard extends StatelessWidget {
  SwipeableCard({super.key, required this.child});

  final Widget child;

  late AppTab _onTab;

  @override
  Widget build(BuildContext context) {
    _onTab = context.select((AppTabBloc bloc) => bloc.state.currentTab);
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

  Widget _animatedBackground(
    BuildContext _,
    SwipeDirection direction,
    AnimationController progress,
  ) {
    return AnimatedBuilder(
      animation: progress,
      builder: (_, __) {
        if (_swipingToRight(direction)) {
          switch (_onTab) {
            case AppTab.readLater:
              return _animateToReadingRight(progress);
            case AppTab.reading:
              return _animateToRead(progress);
            case AppTab.read:
              return Container();
          }
        }
        // swiping to left
        switch (_onTab) {
          case AppTab.readLater:
            return Container();
          case AppTab.reading:
            return _animateToForLater(progress);
          case AppTab.read:
            return _animateToReadingLeft(progress);
        }
      },
    );
  }

  bool _swipingToRight(SwipeDirection direction) {
    return direction == SwipeDirection.startToEnd;
  }

  Widget _animateToReadingRight(AnimationController progress) {
    return _animateTo(
      Icons.book,
      progress,
      MainAxisAlignment.start,
      const EdgeInsets.only(left: 30),
      Colors.blue,
    );
  }

  Widget _animateToReadingLeft(AnimationController progress) {
    return _animateTo(
      Icons.book,
      progress,
      MainAxisAlignment.end,
      const EdgeInsets.only(right: 30),
      Colors.blue,
    );
  }

  Widget _animateToForLater(AnimationController progress) {
    return _animateTo(
      Icons.bookmark,
      progress,
      MainAxisAlignment.end,
      const EdgeInsets.only(right: 30),
      Colors.green,
    );
  }

  Widget _animateToRead(AnimationController progress) {
    return _animateTo(
      Icons.done,
      progress,
      MainAxisAlignment.start,
      const EdgeInsets.only(left: 30),
      Colors.amber,
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

  void _onSwiped(BuildContext context, SwipeDirection direction) {
    if (_swipingToRight(direction)) {
      switch (_onTab) {
        case AppTab.readLater:
          _showSnackbar(context, 'Book moved to Reading!', Colors.blue);
          return;
        case AppTab.reading:
          _showSnackbar(context, 'Book moved to Read!', Colors.amber);
          return;
        case AppTab.read:
          return;
      }
    }

    // swiping left
    switch (_onTab) {
      case AppTab.readLater:
        return;
      case AppTab.reading:
        _showSnackbar(context, 'Book moved to Read Later!', Colors.green);
        return;
      case AppTab.read:
        _showSnackbar(context, 'Book moved to Reading!', Colors.blue);
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
}
