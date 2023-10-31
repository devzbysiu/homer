import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

import '../../features/settings/domain/entities/book_size_limits.dart';
import '../../features/settings/presentation/bloc/settings_bloc.dart';

final class BookCardFooter extends StatelessWidget {
  const BookCardFooter({
    super.key,
    required this.rating,
    required this.pageCount,
    this.shareText = const None(),
  });

  final double rating;

  final int pageCount;

  final Option<String> shareText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(
          width: 4,
        ),
        Expanded(
          child: Text(
            rating.toStringAsFixed(2),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        shareText.fold(
          () => const SizedBox.shrink(),
          (text) => Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              child: const Icon(
                Icons.share,
                size: 20,
                color: Colors.white,
              ),
              onTap: () => Share.share(text),
            ),
          ),
        ),
        Text(
          pageCount.toString(),
          style: const TextStyle(color: Colors.white),
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 10,
          ),
        ),
        _PagesIcon(pageCount: pageCount)
      ],
    );
  }
}

class _PagesIcon extends StatelessWidget {
  const _PagesIcon({required this.pageCount});

  final int pageCount;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SettingsBloc, SettingsState, BookSizeLimits>(
      selector: (state) => state.bookSizeLimits,
      builder: (context, bookSizeLimits) {
        final (sizeLabel, sizeColor) = _sizeProperties(bookSizeLimits);
        return Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: sizeColor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: sizeColor),
          ),
          child: Text(
            sizeLabel,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  (String, Color) _sizeProperties(BookSizeLimits limits) {
    if (limits.isShort(pageCount)) {
      return ('S', Colors.green);
    } else if (limits.isMedium(pageCount)) {
      return ('M', Colors.blue);
    } else {
      return ('L', Colors.orange);
    }
  }
}
