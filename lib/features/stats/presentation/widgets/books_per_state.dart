import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/utils/theme.dart';
import '../../domain/entities/books_per_state_data.dart';
import '../bloc/stats_bloc.dart';
import 'chart_wrapper.dart';

final class BooksPerState extends StatelessWidget {
  const BooksPerState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Books', style: context.headlineSmall),
          ChartWrapper(
            height: 100,
            child: BlocBuilder<StatsBloc, StatsState>(
              builder: (context, state) {
                if (state.booksPerMonth.isNone()) {
                  return Container();
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
    final forLaterCount = booksPerState[BookState.readLater];
    final readingCount = booksPerState[BookState.reading];
    final readCount = booksPerState[BookState.read];

    final forLaterBar = BarChartRodStackItem(
      0,
      forLaterCount.toDouble(),
      context.primary,
    );
    final readingBar = BarChartRodStackItem(
      forLaterCount.toDouble(),
      forLaterCount.toDouble() + readingCount.toDouble(),
      context.secondary,
    );
    final readBar = BarChartRodStackItem(
      forLaterCount.toDouble() + readingCount.toDouble(),
      forLaterCount.toDouble() + readingCount.toDouble() + readCount.toDouble(),
      Colors.green,
    );

    final group = BarChartGroupData(
      x: 0,
      barRods: [
        BarChartRodData(
          width: 30,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _LegendTile(color: context.primary, text: _waiting()),
        _LegendTile(color: context.secondary, text: _inProgress()),
        _LegendTile(color: Colors.green, text: _read()),
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
    return Row(
      children: [
        Container(width: 20, height: 20, color: color),
        const SizedBox(width: 5),
        Text(text, style: context.titleSmall),
        const SizedBox(width: 20),
      ],
    );
  }
}
