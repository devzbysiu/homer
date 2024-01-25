import '../../../../core/utils/theme.dart';
import 'package:flutter/material.dart';

final class ChartWrapper extends StatelessWidget {
  const ChartWrapper({super.key, required this.child, this.height});

  final Widget child;

  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          width: 400, // Set the width of the chart
          height: height ?? 300, // Set the height of the chart
          child: AspectRatio(
            aspectRatio: 2.5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(18)),
                color: context.background,
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
