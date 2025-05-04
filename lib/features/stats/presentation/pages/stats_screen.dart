import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/utils/theme.dart';
import '../widgets/books_per_month.dart';
import '../widgets/books_per_state.dart';
import '../widgets/books_per_year.dart';
import '../widgets/other_stats.dart';

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
            colors: [context.primaryContainer, context.lightPrimaryContainer],
          ),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              const BooksPerState().animate(effects: _effects),
              spaceBetween(50),
              const BooksPerYear().animate(effects: _effects),
              spaceBetween(50),
              const BooksPerMonth().animate(effects: _effects),
              spaceBetween(50),
              const OtherStats().animate(effects: _effects),
            ],
          ),
        ),
      ),
    );
  }

  List<Effect<dynamic>> get _effects {
    return [
      const SlideEffect(duration: Duration(milliseconds: 700)),
      const FadeEffect(duration: Duration(milliseconds: 700)),
    ];
  }
}
