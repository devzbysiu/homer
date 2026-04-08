import 'package:flutter/material.dart';
import 'package:flutter_multi_slider/flutter_multi_slider.dart';

import '../../../../core/orchestrator/bus_widget.dart';
import '../../../../core/orchestrator/events.dart';
import 'book_size_slider_theme.dart';
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
    final t = context.bookSizeSliderTheme;
    return Material(
      child: ListTile(
        contentPadding: EdgeInsets.only(
          top: t.contentPaddingTop,
          left: t.contentPaddingLeft,
          right: t.contentPaddingRight,
        ),
        leading: const Icon(Icons.menu_book_rounded),
        title: Padding(
          padding: EdgeInsets.only(left: t.titleLeftPadding),
          child: Text('Book size limits', style: t.headerStyle),
        ),
        subtitle: MultiSlider(
          activeTrackSize: t.activeTrackSize,
          inactiveTrackSize: t.inactiveTrackSize,
          textHeightOffset: t.textHeightOffset,
          horizontalPadding: t.sliderHorizontalPadding,
          indicator: (_) =>
              IndicatorOptions(formatter: (value) => value.toInt().toString()),
          selectedIndicator: (_) =>
              IndicatorOptions(formatter: (value) => value.toInt().toString()),
          thumbColor: t.thumbColor,
          rangeColors: [
            t.shortRangeColor,
            t.mediumRangeColor,
            t.longRangeColor,
          ],
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
