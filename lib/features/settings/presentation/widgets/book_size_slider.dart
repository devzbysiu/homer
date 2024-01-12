import 'package:flutter/material.dart';
import 'package:flutter_multi_slider/flutter_multi_slider.dart';

import '../../domain/entities/book_size_limits.dart';
import '../bloc/settings_bloc.dart';

final class BookSizeSlider extends StatefulWidget {
  const BookSizeSlider({super.key});

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
        contentPadding: const EdgeInsets.only(top: 10, left: 15, right: 25),
        leading: const Icon(Icons.menu_book_rounded),
        title: const Text('Book size limits'),
        subtitle: MultiSlider(
          textHeightOffset: -25,
          horizontalPadding: 0,
          indicator: (_) => IndicatorOptions(
            formatter: (value) => value.toInt().toString(),
          ),
          selectedIndicator: (_) => IndicatorOptions(
            formatter: (value) => value.toInt().toString(),
          ),
          rangeColors: const [Colors.green, Colors.blue, Colors.orange],
          min: 1,
          max: 1244,
          values: componentBookSizeLimits!.asDoubleList(),
          onChanged: (value) => setState(() {
            componentBookSizeLimits = BookSizeLimits.fromDoubleList(value);
          }),
          onChangeEnd: (value) => context.bookSizeLimitsChanged(
            BookSizeLimits.fromDoubleList(value),
          ),
          divisions: 240,
        ),
      ),
    );
  }
}
