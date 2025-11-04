import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../settings/domain/entities/reading_goal.dart';
import '../../../settings/presentation/bloc/settings_bloc.dart';
import '../../../settings/presentation/bloc/settings_state.dart';
import '../../domain/entities/books_per_month_data.dart';
import '../bloc/stats_bloc.dart';
import '../bloc/stats_state.dart';
import 'books_per_month_theme.dart';
import 'chart_wrapper.dart';

final class BooksPerMonth extends StatelessWidget {
  const BooksPerMonth({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Books per month',
            style: context.booksPerMonthTheme.headlineStyle,
          ),
          ChartWrapper(
            child: BlocBuilder<StatsBloc, StatsState>(
              builder: (context, state) {
                if (state.booksPerMonth.isNone()) {
                  return const SizedBox.shrink();
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
    final theme = context.booksPerMonthTheme;
    _gradientColors = [theme.chartColor, theme.chartColorLight];
    return BlocSelector<SettingsBloc, SettingsState, ReadingGoal>(
      selector: (state) => state.settings.readingGoal,
      builder: (context, readingGoal) {
        return LineChart(mainData(context, readingGoal));
      },
    );
  }

  LineChartData mainData(BuildContext context, ReadingGoal readingGoal) {
    final theme = context.booksPerMonthTheme;
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
      maxX: booksPerMonth.months().length.toDouble() - 1,
      minY: 0,
      maxY: booksPerMonth.bookCounts().max.toDouble() + 2,
      lineBarsData: [lineBarData],
      extraLinesData: _readingGoal(theme, readingGoal),
    );
  }

  List<FlSpot> _spotsFromData() {
    return booksPerMonth
        .bookCounts()
        .indexed
        .map((c) => FlSpot(c.$1.toDouble(), c.$2.toDouble()))
        .toList();
  }

  BarAreaData _belowBarStyle(BooksPerMonthTheme theme) {
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

  LineTouchData _tooltipStyle(BooksPerMonthTheme theme) {
    return LineTouchData(
      enabled: true,
      handleBuiltInTouches: true,
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
    BooksPerMonthTheme theme,
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

  FlDotCirclePainter _pointStyle(BooksPerMonthTheme theme) {
    return FlDotCirclePainter(
      radius: theme.dotRadius,
      color: theme.chartColor,
      strokeWidth: theme.dotStrokeWidth,
      strokeColor: theme.chartColor,
    );
  }

  List<LineTooltipItem> _tooltipTextStyle(
    BooksPerMonthTheme theme,
    List<LineBarSpot> lineBarsSpot,
  ) {
    return lineBarsSpot.map((lineBarSpot) {
      return LineTooltipItem(
        lineBarSpot.y.floor().toString(),
        theme.tooltipStyle.copyWith(color: theme.fillColor),
      );
    }).toList();
  }

  FlTitlesData _titlesData(BooksPerMonthTheme theme) {
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

  AxisTitles _bottomTitles(BooksPerMonthTheme theme) {
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
    BooksPerMonthTheme theme,
    double value,
    TitleMeta meta,
  ) {
    final months = booksPerMonth.months();
    if (value < 0 || value > months.length - 1) return const SizedBox.shrink();

    return SideTitleWidget(
      meta: meta,
      angle: theme.bottomAxisLabelAngle,
      child: Padding(
        padding: EdgeInsets.only(right: theme.bottomAxisLabelRightPadding),
        child: Text('${months[value.toInt()]}', style: theme.axisLabelStyle),
      ),
    );
  }

  AxisTitles _leftTitles(BooksPerMonthTheme theme) {
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
    BooksPerMonthTheme theme,
    double value,
    TitleMeta meta,
  ) {
    final bookCounts = booksPerMonth.bookCounts();
    final maxReadBooks = bookCounts.max;
    if (value < 0 || value > maxReadBooks + 2 || value % 2 != 0) {
      return const SizedBox.shrink();
    }

    return Text(
      value.toInt().toString(),
      style: theme.axisLabelStyle,
      textAlign: TextAlign.left,
    );
  }

  ExtraLinesData _readingGoal(
    BooksPerMonthTheme theme,
    ReadingGoal readingGoal,
  ) {
    return ExtraLinesData(
      horizontalLines: [
        HorizontalLine(
          y: readingGoal.books.toDouble(),
          color: theme.goalLineColor,
          strokeWidth: theme.goalLineStrokeWidth,
          dashArray: [theme.goalLineDashLength, theme.goalLineDashGap],
          label: HorizontalLineLabel(
            show: true,
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(right: theme.goalLabelRightPadding),
            style: theme.goalLabelStyle,
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
