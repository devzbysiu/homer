import 'package:flutter/material.dart';

import '../../../../core/orchestrator/bus_widget.dart';
import '../../../../core/orchestrator/events.dart';
import 'reading_goal_slider_theme.dart';
import '../../domain/entities/reading_goal.dart';
import '../bloc/settings_bloc.dart';

final class ReadingGoalSlider extends StatefulBusWidget {
  ReadingGoalSlider({super.key, super.bus});

  @override
  State<ReadingGoalSlider> createState() => ReadingGoalSliderState();
}

final class ReadingGoalSliderState extends State<ReadingGoalSlider> {
  ReadingGoal? componentReadingGoal;

  @override
  Widget build(BuildContext context) {
    componentReadingGoal ??= context.readingGoal();
    final t = context.readingGoalSliderTheme;
    return Material(
      child: ListTile(
        contentPadding: EdgeInsets.only(
          top: t.contentPaddingTop,
          left: t.contentPaddingLeft,
          right: t.contentPaddingRight,
        ),
        leading: const Icon(Icons.library_books),
        title: Padding(
          padding: EdgeInsets.only(left: t.titleLeftPadding),
          child: Text(
            'Reading goal: ${componentReadingGoal!.books} / month',
            style: t.headerStyle,
          ),
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: t.sliderTopPadding),
          child: Slider(
            value: componentReadingGoal!.books.toDouble(),
            onChanged: (value) => setState(() {
              componentReadingGoal = ReadingGoal(books: value.toInt());
            }),
            onChangeEnd: (value) => widget.fire(
              $ReadingGoalChanged(goal: ReadingGoal(books: value.toInt())),
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
