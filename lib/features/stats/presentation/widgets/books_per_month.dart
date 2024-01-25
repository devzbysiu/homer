import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/theme.dart';
import '../../../settings/domain/entities/reading_goal.dart';
import '../../../settings/presentation/bloc/settings_bloc.dart';
import '../../domain/entities/books_per_month_data.dart';
import '../bloc/stats_bloc.dart';
import 'chart_wrapper.dart';

final class BooksPerMonth extends StatelessWidget {
  const BooksPerMonth({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Books per month', style: context.headlineSmall),
          ChartWrapper(
            child: BlocBuilder<StatsBloc, StatsState>(
              builder: (context, state) {
                if (state.booksPerMonth.isNone()) {
                  return Container();
                }

                final booksPerMonth = state.booksPerMonth.toNullable()!;
                return _LineChartBooksPerMonth(booksPerMonth: booksPerMonth);
              },
            ),
          ),
        ],
      ),
    );
  }
}

final class _LineChartBooksPerMonth extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  _LineChartBooksPerMonth({required this.booksPerMonth});

  final BooksPerMonthData booksPerMonth;

  late final List<Color> _gradientColors;

  @override
  Widget build(BuildContext context) {
    _gradientColors = [context.primary, context.lightPrimary];
    return BlocSelector<SettingsBloc, SettingsState, ReadingGoal>(
      selector: (state) => state.settings.readingGoal,
      builder: (context, readingGoal) => LineChart(mainData(context, readingGoal)),
    );
  }

  LineChartData mainData(BuildContext context, ReadingGoal readingGoal) {
    final spots = _spotsFromData();

    final lineBarData = LineChartBarData(
      showingIndicators: _spotIndices(spots),
      spots: spots,
      isCurved: false,
      gradient: LinearGradient(
        colors: _gradientColors,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      barWidth: 2,
      dotData: const FlDotData(show: true),
      belowBarData: _belowBarStyle(),
    );

    return LineChartData(
      gridData: _noGrid(),
      showingTooltipIndicators: _makeSpots(lineBarData, spots),
      lineTouchData: _tooltipStyle(context),
      backgroundColor: Colors.transparent,
      titlesData: _titlesData(context),
      borderData: _noBorder(),
      minX: 0,
      maxX: booksPerMonth.months().length.toDouble() - 1,
      minY: 0,
      maxY: booksPerMonth.bookCounts().max.toDouble() + 2,
      lineBarsData: [lineBarData],
      extraLinesData: _readingGoal(context, readingGoal),
    );
  }

  List<FlSpot> _spotsFromData() {
    return booksPerMonth
        .bookCounts()
        .indexed
        .map((c) => FlSpot(c.$1.toDouble(), c.$2.toDouble()))
        .toList();
  }

  BarAreaData _belowBarStyle() {
    return BarAreaData(
      show: true,
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: _gradientColors.map((color) => color.withOpacity(0.2)).toList(),
      ),
    );
  }

  FlGridData _noGrid() => const FlGridData(show: false);

  List<ShowingTooltipIndicators> _makeSpots(
    LineChartBarData tooltipsOnBar,
    List<FlSpot> spots,
  ) {
    return _spotIndices(spots).map((index) {
      return ShowingTooltipIndicators([
        LineBarSpot(tooltipsOnBar, 0, spots[index]),
      ]);
    }).toList();
  }

  LineTouchData _tooltipStyle(BuildContext context) {
    return LineTouchData(
      enabled: true,
      handleBuiltInTouches: true,
      getTouchedSpotIndicator: (_, spotIndexes) => _tooltipAreaStyle(
        context,
        spotIndexes,
      ),
      touchTooltipData: LineTouchTooltipData(
        tooltipPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        tooltipBgColor: context.primary,
        tooltipRoundedRadius: 8,
        getTooltipItems: (lineBarsSpot) => _tooltipTextStyle(
          context,
          lineBarsSpot,
        ),
      ),
    );
  }

  List<TouchedSpotIndicatorData> _tooltipAreaStyle(
    BuildContext context,
    List<int> spotIndexes,
  ) {
    return spotIndexes.map((index) {
      return TouchedSpotIndicatorData(
        const FlLine(strokeWidth: 0),
        FlDotData(
          show: true,
          getDotPainter: (_, __, ___, ____) => _pointStyle(context),
        ),
      );
    }).toList();
  }

  FlDotCirclePainter _pointStyle(BuildContext context) {
    return FlDotCirclePainter(
      radius: 3,
      color: context.primary,
      strokeWidth: 2,
      strokeColor: context.primary,
    );
  }

  List<LineTooltipItem> _tooltipTextStyle(
    BuildContext context,
    List<LineBarSpot> lineBarsSpot,
  ) {
    return lineBarsSpot.map((lineBarSpot) {
      return LineTooltipItem(
        lineBarSpot.y.floor().toString(),
        context.bodyMedium.copyWith(color: context.background),
      );
    }).toList();
  }

  FlTitlesData _titlesData(BuildContext context) {
    return FlTitlesData(
      show: true,
      rightTitles: _hide(),
      topTitles: _hide(),
      bottomTitles: _bottomTitles(context),
      leftTitles: _leftTitles(context),
    );
  }

  AxisTitles _hide() {
    return const AxisTitles(
      sideTitles: SideTitles(
        showTitles: false,
      ),
    );
  }

  AxisTitles _bottomTitles(BuildContext context) {
    return AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 30,
        interval: 1,
        getTitlesWidget: (value, meta) => _bottomTitleWidgets(
          context,
          value,
          meta,
        ),
      ),
    );
  }

  Widget _bottomTitleWidgets(
    BuildContext context,
    double value,
    TitleMeta meta,
  ) {
    final months = booksPerMonth.months();
    if (value < 0 || value > months.length - 1) return Container();

    return SideTitleWidget(
      axisSide: meta.axisSide,
      angle: -0.7,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Text(
          '${months[value.toInt()]}',
          style: context.bodySmall,
        ),
      ),
    );
  }

  AxisTitles _leftTitles(BuildContext context) {
    return AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        interval: 1,
        getTitlesWidget: (value, meta) => _leftTitleWidgets(
          context,
          value,
          meta,
        ),
        reservedSize: 42,
      ),
    );
  }

  Widget _leftTitleWidgets(BuildContext context, double value, TitleMeta meta) {
    final bookCounts = booksPerMonth.bookCounts();
    final maxReadBooks = bookCounts.max;
    if (value < 0 || value > maxReadBooks + 2 || value % 2 != 0) {
      return Container();
    }

    return Text(
      value.toInt().toString(),
      style: context.bodySmall,
      textAlign: TextAlign.left,
    );
  }

  ExtraLinesData _readingGoal(BuildContext context, ReadingGoal readingGoal) {
    return ExtraLinesData(
      horizontalLines: [
        HorizontalLine(
          y: readingGoal.books.toDouble(),
          color: context.onBackground,
          strokeWidth: 1,
          dashArray: [10, 4],
          label: HorizontalLineLabel(
            show: true,
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(right: 8),
            style: context.bodyMedium.copyWith(
              color: context.onBackground,
            ),
            labelResolver: (_) => 'goal: ${readingGoal.books}',
          ),
        ),
      ],
    );
  }

  FlBorderData _noBorder() {
    return FlBorderData(show: false);
  }

  List<int> _spotIndices(List<FlSpot> spots) {
    return spots.indexed.map((e) => e.$1).toList();
  }
}
