import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/theme.dart';
import '../../domain/entities/books_per_year.dart';
import '../bloc/stats_bloc.dart';
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
                if (state.bookCounts.isNone() || state.years.isNone()) {
                  return Container();
                }
                final bookCounts = state.bookCounts.toNullable()!;
                final years = state.years.toNullable()!;

                return _LineChartBooksPerYear(
                  bookCounts: bookCounts,
                  years: years,
                );
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
  _LineChartBooksPerYear({required this.bookCounts, required this.years});

  final List<BookCounts> bookCounts;

  final List<Year> years;

  late final List<Color> _gradientColors;

  @override
  Widget build(BuildContext context) {
    _gradientColors = [context.primary, context.lightPrimary];
    return LineChart(mainData(context));
  }

  LineChartData mainData(BuildContext context) {
    final spots = _spotsFromState();

    final lineBarData = LineChartBarData(
      showingIndicators: _spotIndices(spots),
      spots: spots,
      isCurved: true,
      gradient: LinearGradient(colors: _gradientColors),
      barWidth: 5,
      dotData: const FlDotData(show: true),
      belowBarData: _belowBarStyle(),
    );

    return LineChartData(
      showingTooltipIndicators: _makeSpots(lineBarData, spots),
      lineTouchData: _tooltipStyle(context),
      backgroundColor: context.background,
      titlesData: _titlesData(context),
      borderData: _grayBorder(),
      minX: 0,
      maxX: 3,
      minY: 0,
      maxY: 100,
      lineBarsData: [lineBarData],
    );
  }

  List<FlSpot> _spotsFromState() {
    return bookCounts.indexed
        .map((c) => FlSpot(c.$1.toDouble(), c.$2.toDouble()))
        .toList();
  }

  BarAreaData _belowBarStyle() {
    return BarAreaData(
      show: true,
      gradient: LinearGradient(
        colors: _gradientColors.map((color) => color.withOpacity(0.3)).toList(),
      ),
    );
  }

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
      getTouchedSpotIndicator: (_, spotIndexes) => _tooltipAreaStyle(
        context,
        spotIndexes,
      ),
      touchTooltipData: LineTouchTooltipData(
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
          getDotPainter: (_, __, ___, ____) => _areaStyle(context),
        ),
      );
    }).toList();
  }

  FlDotCirclePainter _areaStyle(BuildContext context) {
    return FlDotCirclePainter(
      radius: 8,
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
    if (value < 0 || value > years.length - 1) return Container();

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        '${years[value.toInt()]}',
        style: context.bodyMedium,
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
    final maxReadBooks = bookCounts.last.toDouble();
    if (value < 0 || value > maxReadBooks + 20 || value % 20 != 0) {
      return Container();
    }

    return Text(
      value.toInt().toString(),
      style: context.bodyMedium,
      textAlign: TextAlign.left,
    );
  }

  FlBorderData _grayBorder() {
    return FlBorderData(
      show: true,
      border: Border.all(color: const Color(0xff37434d)),
    );
  }

  List<int> _spotIndices(List<FlSpot> spots) {
    return spots.indexed.map((e) => e.$1).toList();
  }
}
