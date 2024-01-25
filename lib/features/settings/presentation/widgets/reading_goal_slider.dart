import 'package:flutter/material.dart';

import '../../../../core/utils/theme.dart';
import '../../domain/entities/reading_goal.dart';
import '../bloc/settings_bloc.dart';

final class ReadingGoalSlider extends StatefulWidget {
  const ReadingGoalSlider({super.key});

  @override
  State<ReadingGoalSlider> createState() => ReadingGoalSliderState();
}

final class ReadingGoalSliderState extends State<ReadingGoalSlider> {
  ReadingGoal? componentReadingGoal;

  @override
  Widget build(BuildContext context) {
    componentReadingGoal ??= context.readingGoal();
    return Material(
      child: ListTile(
        contentPadding: const EdgeInsets.only(top: 10, left: 23, right: 25),
        leading: const Icon(Icons.library_books),
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'Reading goal: ${componentReadingGoal!.books} / month',
            style: context.headlineSmall,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 13),
          child: Slider(
            value: componentReadingGoal!.books.toDouble(),
            onChanged: (value) => setState(() {
              componentReadingGoal = ReadingGoal(books: value.toInt());
            }),
            onChangeEnd: (value) => context.readingGoalChanged(
              ReadingGoal(books: value.toInt()),
            ),
            min: 0,
            max: 30,
            divisions: 30,
          ),
        ),
      ),
    );
  }
}
