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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _BookRating(rating: rating),
        _ShareButton(shareText: shareText),
        _BookSize(pageCount: pageCount)
      ],
    );
  }
}

class _BookRating extends StatelessWidget {
  const _BookRating({required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Icon(
        Icons.star,
        color: Theme.of(context).colorScheme.primary,
      ),
      const SizedBox(width: 4),
      Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(
          rating.toStringAsFixed(2),
          style: const TextStyle(color: Colors.white),
        ),
      )
    ]);
  }
}

class _ShareButton extends StatelessWidget {
  const _ShareButton({required this.shareText});

  final Option<String> shareText;

  @override
  Widget build(BuildContext context) {
    return shareText.fold(
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
    );
  }
}

class _BookSize extends StatelessWidget {
  const _BookSize({required this.pageCount});

  final int pageCount;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            pageCount.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 10,
          ),
        ),
        _BookSizeLabel(pageCount: pageCount),
      ],
    );
  }
}

class _BookSizeLabel extends StatelessWidget {
  const _BookSizeLabel({required this.pageCount});

  final int pageCount;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SettingsBloc, SettingsState, BookSizeLimits>(
      selector: (state) => state.bookSizeLimits,
      builder: (context, bookSizeLimits) {
        final (sizeLabel, sizeColor) = _sizeProperties(bookSizeLimits);
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(3),
          width: 20,
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
