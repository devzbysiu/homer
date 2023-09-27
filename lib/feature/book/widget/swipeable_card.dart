import 'package:flutter/material.dart';
import 'package:swipeable_tile/swipeable_tile.dart';

class SwipeableCard extends StatelessWidget {
  const SwipeableCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SwipeableTile.card(
      color: Colors.white,
      shadow: BoxShadow(
        color: Colors.black.withOpacity(0.35),
        blurRadius: 4,
        offset: const Offset(2, 2),
      ),
      horizontalPadding: 16,
      verticalPadding: 8,
      direction: SwipeDirection.horizontal,
      onSwiped: (_) {},
      backgroundBuilder: _animatedBackground,
      key: UniqueKey(),
      child: child,
    );
  }

  Widget _animatedBackground(
    BuildContext context,
    SwipeDirection direction,
    AnimationController progress,
  ) {
    return AnimatedBuilder(
      animation: progress,
      builder: (_, __) {
        if (direction == SwipeDirection.startToEnd) {
          return _animateToReading(progress);
        }
        return _animateToForLater(progress);
      },
    );
  }

  Widget _animateToReading(AnimationController progress) {
    return _animateTo(
      Icons.book,
      progress,
      MainAxisAlignment.start,
      const EdgeInsets.only(left: 30),
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
      duration: const Duration(milliseconds: 200),
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
}
