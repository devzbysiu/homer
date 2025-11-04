import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/books_per_year_data.dart';
import '../bloc/stats_bloc.dart';
import '../bloc/stats_state.dart';
import 'books_per_year_theme.dart';
import 'chart_wrapper.dart';

final class BooksPerYear extends StatelessWidget {
  const BooksPerYear({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Books per year',
            style: context.booksPerYearTheme.headlineStyle,
          ),
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
    final theme = context.booksPerYearTheme;
    _gradientColors = [theme.chartColor, theme.chartColorLight];
    return LineChart(mainData(context));
  }

  LineChartData mainData(BuildContext context) {
    final theme = context.booksPerYearTheme;
    final spots = _spotsFromData();

    final lineBarData = LineChartBarData(
      showingIndicators: _spotIndices(spots),
      spots: spots,
      isCurved: true,
      preventCurveOverShooting: true,
      gradient: LinearGradient(colors: _gradientColors),
      barWidth: theme.lineWidth,
      dotData: const FlDotData(show: true),
      belowBarData: _belowBarStyle(theme),
    );

    return LineChartData(
      gridData: _noGrid(),
      showingTooltipIndicators: _makeSpots(lineBarData, spots),
      lineTouchData: _tooltipStyle(theme),
      backgroundColor: theme.chartBackgroundColor,
      titlesData: _titlesData(theme),
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

  BarAreaData _belowBarStyle(BooksPerYearTheme theme) {
    return BarAreaData(
      show: true,
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [theme.fillColor, theme.fillColorFaded],
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

  LineTouchData _tooltipStyle(BooksPerYearTheme theme) {
    return LineTouchData(
      enabled: true,
      handleBuiltInTouches: false,
      getTouchedSpotIndicator: (_, spotIndexes) =>
          _tooltipAreaStyle(theme, spotIndexes),
      touchTooltipData: LineTouchTooltipData(
        tooltipPadding: EdgeInsets.symmetric(
          horizontal: theme.tooltipHorizontalPadding,
          vertical: theme.tooltipVerticalPadding,
        ),
        getTooltipColor: (_) => theme.tooltipBgColor,
        getTooltipItems: (lineBarsSpot) =>
            _tooltipTextStyle(theme, lineBarsSpot),
      ),
    );
  }

  List<TouchedSpotIndicatorData> _tooltipAreaStyle(
    BooksPerYearTheme theme,
    List<int> spotIndexes,
  ) {
    return spotIndexes.map((index) {
      return TouchedSpotIndicatorData(
        const FlLine(strokeWidth: 0),
        FlDotData(
          show: true,
          getDotPainter: (_, _, _, _) => _pointStyle(theme),
        ),
      );
    }).toList();
  }

  FlDotCirclePainter _pointStyle(BooksPerYearTheme theme) {
    return FlDotCirclePainter(
      radius: theme.dotRadius,
      color: theme.chartColor,
      strokeWidth: theme.dotStrokeWidth,
      strokeColor: theme.chartColor,
    );
  }

  List<LineTooltipItem> _tooltipTextStyle(
    BooksPerYearTheme theme,
    List<LineBarSpot> lineBarsSpot,
  ) {
    return lineBarsSpot.map((lineBarSpot) {
      return LineTooltipItem(
        lineBarSpot.y.floor().toString(),
        theme.tooltipStyle.copyWith(color: theme.fillColor),
      );
    }).toList();
  }

  FlTitlesData _titlesData(BooksPerYearTheme theme) {
    return FlTitlesData(
      show: true,
      rightTitles: _hide(),
      topTitles: _hide(),
      bottomTitles: _bottomTitles(theme),
      leftTitles: _leftTitles(theme),
    );
  }

  AxisTitles _hide() {
    return const AxisTitles(sideTitles: SideTitles(showTitles: false));
  }

  AxisTitles _bottomTitles(BooksPerYearTheme theme) {
    return AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: theme.bottomAxisReservedSize,
        interval: 1,
        getTitlesWidget: (value, meta) =>
            _bottomTitleWidgets(theme, value, meta),
      ),
    );
  }

  Widget _bottomTitleWidgets(
    BooksPerYearTheme theme,
    double value,
    TitleMeta meta,
  ) {
    final years = booksPerYear.years;
    if (value < 0 || value > years.length - 1) return const SizedBox.shrink();

    return SideTitleWidget(
      meta: meta,
      child: Text('${years[value.toInt()]}', style: theme.axisLabelStyle),
    );
  }

  AxisTitles _leftTitles(BooksPerYearTheme theme) {
    return AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        interval: 1,
        getTitlesWidget: (value, meta) => _leftTitleWidgets(theme, value, meta),
        reservedSize: theme.leftAxisReservedSize,
      ),
    );
  }

  Widget _leftTitleWidgets(
    BooksPerYearTheme theme,
    double value,
    TitleMeta meta,
  ) {
    final maxReadBooks = booksPerYear.bookCounts.max;
    if (value < 0 || value > maxReadBooks + 20 || value % 20 != 0) {
      return const SizedBox.shrink();
    }

    return Text(
      value.toInt().toString(),
      style: theme.axisLabelStyle,
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
