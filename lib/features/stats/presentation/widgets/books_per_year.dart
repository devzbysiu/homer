import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/theme.dart';
import '../../domain/entities/books_per_year_data.dart';
import '../bloc/stats_bloc.dart';
import '../bloc/stats_state.dart';
import 'chart_wrapper.dart';

final class BooksPerYear extends StatelessWidget {
  const BooksPerYear({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Books per year', style: context.headlineSmall),
          ChartWrapper(
            child: BlocBuilder<StatsBloc, StatsState>(
              builder: (context, state) {
                if (state.booksPerYear.isNone()) {
                  return const SizedBox.shrink();
                }

                final booksPerYear = state.booksPerYear.toNullable()!;
                return _LineChartBooksPerYear(booksPerYear: booksPerYear);
              },
            ),
          ),
        ],
      ),
    );
  }
}

final class _LineChartBooksPerYear extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  _LineChartBooksPerYear({required this.booksPerYear});

  final BooksPerYearData booksPerYear;

  late final List<Color> _gradientColors;

  @override
  Widget build(BuildContext context) {
    _gradientColors = [context.primary, context.lightPrimary];
    return LineChart(mainData(context));
  }

  LineChartData mainData(BuildContext context) {
    final spots = _spotsFromData();

    final lineBarData = LineChartBarData(
      showingIndicators: _spotIndices(spots),
      spots: spots,
      isCurved: true,
      preventCurveOverShooting: true,
      gradient: LinearGradient(colors: _gradientColors),
      barWidth: 2,
      dotData: const FlDotData(show: true),
      belowBarData: _belowBarStyle(context),
    );

    return LineChartData(
      gridData: _noGrid(),
      showingTooltipIndicators: _makeSpots(lineBarData, spots),
      lineTouchData: _tooltipStyle(context),
      backgroundColor: Colors.transparent,
      titlesData: _titlesData(context),
      borderData: _noBorder(),
      minX: 0,
      maxX: booksPerYear.years.length.toDouble() - 1,
      minY: 0,
      maxY: booksPerYear.bookCounts.max.toDouble() + 20,
      lineBarsData: [lineBarData],
    );
  }

  List<FlSpot> _spotsFromData() {
    return booksPerYear.bookCounts.indexed
        .map((c) => FlSpot(c.$1.toDouble(), c.$2.toDouble()))
        .toList();
  }

  BarAreaData _belowBarStyle(BuildContext context) {
    return BarAreaData(
      show: true,
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [context.background, context.background.withValues(alpha: 0.2)],
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
      handleBuiltInTouches: false,
      getTouchedSpotIndicator: (_, spotIndexes) =>
          _tooltipAreaStyle(context, spotIndexes),
      touchTooltipData: LineTouchTooltipData(
        tooltipPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        getTooltipColor: (_) => context.primary,
        getTooltipItems: (lineBarsSpot) =>
            _tooltipTextStyle(context, lineBarsSpot),
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
          getDotPainter: (_, _, _, _) => _pointStyle(context),
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
    return const AxisTitles(sideTitles: SideTitles(showTitles: false));
  }

  AxisTitles _bottomTitles(BuildContext context) {
    return AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 30,
        interval: 1,
        getTitlesWidget: (value, meta) =>
            _bottomTitleWidgets(context, value, meta),
      ),
    );
  }

  Widget _bottomTitleWidgets(
    BuildContext context,
    double value,
    TitleMeta meta,
  ) {
    final years = booksPerYear.years;
    if (value < 0 || value > years.length - 1) return const SizedBox.shrink();

    return SideTitleWidget(
      meta: meta,
      child: Text('${years[value.toInt()]}', style: context.bodySmall),
    );
  }

  AxisTitles _leftTitles(BuildContext context) {
    return AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        interval: 1,
        getTitlesWidget: (value, meta) =>
            _leftTitleWidgets(context, value, meta),
        reservedSize: 42,
      ),
    );
  }

  Widget _leftTitleWidgets(BuildContext context, double value, TitleMeta meta) {
    final maxReadBooks = booksPerYear.bookCounts.max;
    if (value < 0 || value > maxReadBooks + 20 || value % 20 != 0) {
      return const SizedBox.shrink();
    }

    return Text(
      value.toInt().toString(),
      style: context.bodySmall,
      textAlign: TextAlign.left,
    );
  }

  FlBorderData _noBorder() {
    return FlBorderData(show: false);
  }

  List<int> _spotIndices(List<FlSpot> spots) {
    return spots.indexed.map((e) => e.$1).toList();
  }
}
