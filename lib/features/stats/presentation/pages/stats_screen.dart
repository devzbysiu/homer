import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/utils/theme.dart';

final class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [FadeEffect()],
      child: Container(
        color: context.background,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                BooksPerYear(),
                BooksPerYear(),
                BooksPerYear(),
                BooksPerYear(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final class BooksPerYear extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  BooksPerYear({super.key});

  late final List<Color> _gradientColors;

  final List<FlSpot> _spots = [
    const FlSpot(0, 23),
    const FlSpot(1, 73),
    const FlSpot(2, 90),
    const FlSpot(3, 6),
  ];

  @override
  Widget build(BuildContext context) {
    _gradientColors = [context.primary, context.lightPrimary];

    return Center(
      child: Column(
        children: [
          Text('Books per year', style: context.headlineSmall),
          _ChartWrapper(child: LineChart(mainData(context))),
        ],
      ),
    );
  }

  LineChartData mainData(BuildContext context) {
    final lineBarData = LineChartBarData(
      showingIndicators: _spotIndices,
      spots: _spots,
      isCurved: true,
      gradient: LinearGradient(colors: _gradientColors),
      barWidth: 5,
      dotData: const FlDotData(show: true),
      belowBarData: _belowBarStyle(),
    );

    return LineChartData(
      showingTooltipIndicators: _makeSpots(lineBarData),
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

  BarAreaData _belowBarStyle() {
    return BarAreaData(
      show: true,
      gradient: LinearGradient(
        colors: _gradientColors.map((color) => color.withOpacity(0.3)).toList(),
      ),
    );
  }

  List<ShowingTooltipIndicators> _makeSpots(LineChartBarData tooltipsOnBar) {
    return _spotIndices.map((index) {
      return ShowingTooltipIndicators([
        LineBarSpot(tooltipsOnBar, 0, _spots[index]),
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
        getTitlesWidget: (value, meta) => bottomTitleWidgets(
          context,
          value,
          meta,
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(
    BuildContext context,
    double value,
    TitleMeta meta,
  ) {
    final style = context.bodyMedium;

    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('2021', style: style);
        break;
      case 1:
        text = Text('2022', style: style);
        break;
      case 2:
        text = Text('2023', style: style);
        break;
      case 3:
        text = Text('2024', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  AxisTitles _leftTitles(BuildContext context) {
    return AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        interval: 1,
        getTitlesWidget: (value, meta) => leftTitleWidgets(
          context,
          value,
          meta,
        ),
        reservedSize: 42,
      ),
    );
  }

  Widget leftTitleWidgets(BuildContext context, double value, TitleMeta meta) {
    final style = context.bodyMedium;

    String text;
    switch (value.toInt()) {
      case 20:
        text = '20';
        break;
      case 40:
        text = '40';
        break;
      case 60:
        text = '60';
        break;
      case 80:
        text = '80';
        break;
      case 100:
        text = '100';
        break;
      default:
        return Container();
    }

    return Text(
      text,
      style: style,
      textAlign: TextAlign.left,
    );
  }

  FlBorderData _grayBorder() {
    return FlBorderData(
      show: true,
      border: Border.all(color: const Color(0xff37434d)),
    );
  }

  List<int> get _spotIndices => _spots.asMap().keys.toList();
}

final class _ChartWrapper extends StatelessWidget {
  const _ChartWrapper({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400, // Set the width of the chart
      height: 300, // Set the height of the chart
      child: AspectRatio(
        aspectRatio: 2.5,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(18)),
            color: context.background,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18.0,
              left: 12.0,
              top: 24,
              bottom: 12,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
