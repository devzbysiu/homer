import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/theme.dart';
import '../../domain/entities/most_read_info.dart';
import '../../domain/entities/other_stats_data.dart';
import '../bloc/stats_bloc.dart';
import '../bloc/stats_state.dart';
import 'chart_wrapper.dart';

final class OtherStats extends StatelessWidget {
  const OtherStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Other', style: context.headlineSmall),
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
    return Column(
      children: [
        Row(
          children: [
            Text(
              average.toStringAsFixed(1),
              style: context.bodyLarge.copyWith(fontSize: 60),
            ),
          ],
        ),
        Row(children: [Text('books per month', style: context.bodyMedium)]),
      ],
    );
  }
}

class _MostRead extends StatelessWidget {
  const _MostRead(this.mostRead);

  final MostReadInfo mostRead;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              mostRead.booksCount.toString(),
              style: context.bodyLarge.copyWith(fontSize: 60),
            ),
          ],
        ),
        Row(
          children: [
            Text('books in ${mostRead.monthInfo}', style: context.bodyMedium),
          ],
        ),
      ],
    );
  }
}
