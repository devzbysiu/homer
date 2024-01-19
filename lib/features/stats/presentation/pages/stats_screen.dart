import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/utils/theme.dart';
import '../widgets/books_per_month.dart';
import '../widgets/books_per_year.dart';

final class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [FadeEffect()],
      child: Container(
        color: context.background,
        child: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                BooksPerYear(),
                BooksPerMonth(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
