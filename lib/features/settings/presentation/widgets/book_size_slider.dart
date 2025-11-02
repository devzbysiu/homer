import 'package:flutter/material.dart';
import 'package:flutter_multi_slider/flutter_multi_slider.dart';

import '../../../../core/orchestrator/bus_widget.dart';
import '../../../../core/orchestrator/events.dart';
import '../../../../core/utils/theme.dart';
import '../../domain/entities/book_size_limits.dart';
import '../bloc/settings_bloc.dart';

final class BookSizeSlider extends StatefulBusWidget {
  BookSizeSlider({super.key, super.bus});

  @override
  State<BookSizeSlider> createState() => BookSizeSliderState();
}

final class BookSizeSliderState extends State<BookSizeSlider> {
  BookSizeLimits? componentBookSizeLimits;

  @override
  Widget build(BuildContext context) {
    componentBookSizeLimits ??= context.bookSizeLimits();
    return Material(
      child: ListTile(
        contentPadding: const EdgeInsets.only(top: 10, left: 23, right: 25),
        leading: const Icon(Icons.menu_book_rounded),
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text('Book size limits', style: context.headlineSmall),
        ),
        subtitle: MultiSlider(
          activeTrackSize: 6,
          inactiveTrackSize: 6,
          textHeightOffset: -25,
          horizontalPadding: 13,
          indicator: (_) =>
              IndicatorOptions(formatter: (value) => value.toInt().toString()),
          selectedIndicator: (_) =>
              IndicatorOptions(formatter: (value) => value.toInt().toString()),
          thumbColor: context.primary,
          rangeColors: const [Colors.green, Colors.blue, Colors.orange],
          min: 1,
          max: 1244,
          values: componentBookSizeLimits!.asDoubleList(),
          onChanged: (value) => setState(() {
            componentBookSizeLimits = BookSizeLimits.fromDoubleList(value);
          }),
          onChangeEnd: (value) => widget.fire(
            $SizeLimitsChanged(limits: BookSizeLimits.fromDoubleList(value)),
          ),
          divisions: 240,
        ),
      ),
    );
  }
}
