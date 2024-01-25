import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/utils/theme.dart';
import '../widgets/books_per_month.dart';
import '../widgets/books_per_state.dart';
import '../widgets/books_per_year.dart';

final class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [FadeEffect()],
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              context.primaryContainer,
              context.lightPrimaryContainer,
            ],
          ),
        ),
        child: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                _StatsSection(child: BooksPerState()),
                _StatsSection(child: BooksPerYear()),
                _StatsSection(child: BooksPerMonth()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatsSection extends StatelessWidget {
  const _StatsSection({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: context.background,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: child,
    );
  }
}
