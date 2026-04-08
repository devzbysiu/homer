import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/book.dart';
import '../../domain/entities/books_per_state_data.dart';
import '../bloc/stats_bloc.dart';
import '../bloc/stats_state.dart';
import 'books_per_state_theme.dart';
import 'chart_wrapper.dart';

final class BooksPerState extends StatelessWidget {
  const BooksPerState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Books', style: context.booksPerStateTheme.headlineStyle),
          ChartWrapper(
            height: 100,
            child: BlocBuilder<StatsBloc, StatsState>(
              builder: (context, state) {
                if (state.booksPerMonth.isNone()) {
                  return const SizedBox.shrink();
                }

                final booksPerState = state.booksPerState.toNullable()!;
                return _BarChartBooksPerState(booksPerState: booksPerState);
              },
            ),
          ),
        ],
      ),
    );
  }
}

final class _BarChartBooksPerState extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  _BarChartBooksPerState({required this.booksPerState});

  final BooksPerStateData booksPerState;

  @override
  Widget build(BuildContext context) {
    // `RotatedBox` here and there is a workaround for horizontal bar chart:
    // https://github.com/imaNNeo/fl_chart/issues/552#issuecomment-775812719
    return RotatedBox(
      quarterTurns: 1,
      child: Row(
        children: [
          Expanded(child: BarChart(mainData(context))),
          RotatedBox(
            quarterTurns: -1,
            child: _ChartLegend(booksPerState: booksPerState),
          ),
        ],
      ),
    );
  }

  BarChartData mainData(BuildContext context) {
    final barGroups = _barGroupsFromData(context);
    return BarChartData(
      barGroups: barGroups,
      titlesData: const FlTitlesData(show: false),
      gridData: const FlGridData(show: false),
      borderData: FlBorderData(show: false),
    );
  }

  List<BarChartGroupData> _barGroupsFromData(BuildContext context) {
    final theme = context.booksPerStateTheme;
    final forLaterCount = booksPerState[BookState.readLater];
    final readingCount = booksPerState[BookState.reading];
    final readCount = booksPerState[BookState.read];

    final forLaterBar = BarChartRodStackItem(
      0,
      forLaterCount.toDouble(),
      theme.waitingColor,
    );
    final readingBar = BarChartRodStackItem(
      forLaterCount.toDouble(),
      forLaterCount.toDouble() + readingCount.toDouble(),
      theme.inProgressColor,
    );
    final readBar = BarChartRodStackItem(
      forLaterCount.toDouble() + readingCount.toDouble(),
      forLaterCount.toDouble() + readingCount.toDouble() + readCount.toDouble(),
      theme.readColor,
    );

    final group = BarChartGroupData(
      x: 0,
      barRods: [
        BarChartRodData(
          width: theme.barWidth,
          toY:
              forLaterCount.toDouble() +
              readingCount.toDouble() +
              readCount.toDouble(),
          rodStackItems: [forLaterBar, readingBar, readBar],
        ),
      ],
    );

    return [group];
  }
}

final class _ChartLegend extends StatelessWidget {
  const _ChartLegend({required this.booksPerState});

  final BooksPerStateData booksPerState;

  @override
  Widget build(BuildContext context) {
    final theme = context.booksPerStateTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _LegendTile(color: theme.waitingColor, text: _waiting()),
        _LegendTile(color: theme.inProgressColor, text: _inProgress()),
        _LegendTile(color: theme.readColor, text: _read()),
      ],
    );
  }

  String _waiting() {
    final count = booksPerState[BookState.readLater];
    return '${count.toString()} waiting';
  }

  String _inProgress() {
    final count = booksPerState[BookState.reading];
    return '${count.toString()} in progress';
  }

  String _read() {
    final count = booksPerState[BookState.read];
    return '${count.toString()} read';
  }
}

final class _LegendTile extends StatelessWidget {
  const _LegendTile({required this.color, required this.text});

  final Color color;

  final String text;

  @override
  Widget build(BuildContext context) {
    final t = context.booksPerStateTheme;
    return Row(
      children: [
        Container(
          width: t.legendSwatchSize,
          height: t.legendSwatchSize,
          color: color,
        ),
        SizedBox(width: t.legendSwatchSpacing),
        Text(text, style: t.legendStyle),
        SizedBox(width: t.legendItemSpacing),
      ],
    );
  }
}
