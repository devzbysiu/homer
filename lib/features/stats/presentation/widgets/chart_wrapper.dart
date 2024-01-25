import 'package:flutter/material.dart';

final class ChartWrapper extends StatelessWidget {
  const ChartWrapper({super.key, required this.child, this.height});

  final Widget child;

  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.only(bottom: 12.0, top: 8.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18),
        child: SizedBox(
          width: 400, // Set the width of the chart
          height: height ?? 300, // Set the height of the chart
          child: child,
        ),
      ),
    );
  }
}
