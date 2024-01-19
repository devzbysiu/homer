import '../../../../core/utils/theme.dart';
import 'package:flutter/material.dart';

final class ChartWrapper extends StatelessWidget {
  const ChartWrapper({super.key, required this.child});

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
