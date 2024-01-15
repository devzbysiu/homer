import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fl_chart/fl_chart.dart';

final class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [FadeEffect()],
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 50),
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
  const BooksPerYear({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Books per year',
            style: Theme.of(context).textTheme.headlineSmall!,
          ),
          SizedBox(
            width: 400, // Set the width of the chart
            height: 300, // Set the height of the chart
            child: AspectRatio(
              aspectRatio: 2.5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(18)),
                  color: Theme.of(context).colorScheme.background,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 18.0,
                    left: 12.0,
                    top: 24,
                    bottom: 12,
                  ),
                  child: LineChart(mainData(context)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  LineChartData mainData(BuildContext context) {
    final List<Color> gradientColors = [
      Theme.of(context).colorScheme.primary,
      Theme.of(context).colorScheme.primary.lighten(20),
    ];

    const showingTooltipOnSpots = [0, 1, 2, 3];

    final lineBarsData = [
      LineChartBarData(
        showingIndicators: showingTooltipOnSpots,
        spots: const [
          FlSpot(0, 23),
          FlSpot(1, 73),
          FlSpot(2, 90),
          FlSpot(3, 6),
        ],
        isCurved: true,
        gradient: LinearGradient(colors: gradientColors),
        barWidth: 5,
        dotData: const FlDotData(show: true),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ),
    ];

    final tooltipsOnBar = lineBarsData[0];

    return LineChartData(
      showingTooltipIndicators: showingTooltipOnSpots.map((index) {
        return ShowingTooltipIndicators([
          LineBarSpot(
            tooltipsOnBar,
            lineBarsData.indexOf(tooltipsOnBar),
            tooltipsOnBar.spots[index],
          ),
        ]);
      }).toList(),
      lineTouchData: LineTouchData(
        enabled: true,
        handleBuiltInTouches: false,
        getTouchedSpotIndicator:
            (LineChartBarData barData, List<int> spotIndexes) {
          return spotIndexes.map((index) {
            return TouchedSpotIndicatorData(
              const FlLine(strokeWidth: 0),
              FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) =>
                    FlDotCirclePainter(
                  radius: 8,
                  color: Theme.of(context).colorScheme.primary,
                  strokeWidth: 2,
                  strokeColor: Theme.of(context).colorScheme.primary,
                ),
              ),
            );
          }).toList();
        },
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Theme.of(context).colorScheme.primary,
          tooltipRoundedRadius: 8,
          getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
            return lineBarsSpot.map((lineBarSpot) {
              return LineTooltipItem(
                lineBarSpot.y.floor().toString(),
                Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.background,
                    ),
              );
            }).toList();
          },
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
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
        ),
        leftTitles: AxisTitles(
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
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 3,
      minY: 0,
      maxY: 100,
      lineBarsData: lineBarsData,
    );
  }

  Widget bottomTitleWidgets(
    BuildContext context,
    double value,
    TitleMeta meta,
  ) {
    final style = Theme.of(context).textTheme.bodyMedium!;
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

  Widget leftTitleWidgets(BuildContext context, double value, TitleMeta meta) {
    final style = Theme.of(context).textTheme.bodyMedium!;
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

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}
