import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/most_read_info.dart';
import '../../domain/entities/other_stats_data.dart';
import '../bloc/stats_bloc.dart';
import '../bloc/stats_state.dart';
import 'chart_wrapper.dart';
import 'other_stats_theme.dart';

final class OtherStats extends StatelessWidget {
  const OtherStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Other', style: context.otherStatsTheme.headlineStyle),
          ChartWrapper(
            height: 150,
            child: BlocBuilder<StatsBloc, StatsState>(
              builder: (context, state) {
                if (state.otherStats.isNone()) {
                  return const SizedBox.shrink();
                }

                final otherStats = state.otherStats.toNullable()!;
                return _AverageAndMostRead(otherStats: otherStats);
              },
            ),
          ),
        ],
      ),
    );
  }
}

final class _AverageAndMostRead extends StatelessWidget {
  const _AverageAndMostRead({required this.otherStats});

  final OtherStatsData otherStats;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [_Average(otherStats.average), _MostRead(otherStats.mostRead)],
    );
  }
}

class _Average extends StatelessWidget {
  const _Average(this.average);

  final double average;

  @override
  Widget build(BuildContext context) {
    final theme = context.otherStatsTheme;
    return Column(
      children: [
        Row(
          children: [
            Text(
              average.toStringAsFixed(1),
              style: theme.valueStyle.copyWith(fontSize: theme.valueFontSize),
            ),
          ],
        ),
        Row(children: [Text('books per month', style: theme.labelStyle)]),
      ],
    );
  }
}

class _MostRead extends StatelessWidget {
  const _MostRead(this.mostRead);

  final MostReadInfo mostRead;

  @override
  Widget build(BuildContext context) {
    final theme = context.otherStatsTheme;
    return Column(
      children: [
        Row(
          children: [
            Text(
              mostRead.booksCount.toString(),
              style: theme.valueStyle.copyWith(fontSize: theme.valueFontSize),
            ),
          ],
        ),
        Row(
          children: [
            Text('books in ${mostRead.monthInfo}', style: theme.labelStyle),
          ],
        ),
      ],
    );
  }
}
