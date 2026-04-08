import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

import '../../../features/settings/domain/entities/book_size_limits.dart';
import '../../../features/settings/presentation/bloc/settings_bloc.dart';
import '../../../features/settings/presentation/bloc/settings_state.dart';
import 'card_footer_theme.dart';

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
        Expanded(child: _BookRating(rating: rating)),
        Expanded(child: _ShareButton(shareText: shareText)),
        Expanded(
          flex: 1,
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: _BookSize(pageCount: pageCount),
            ),
          ),
        ),
      ],
    );
  }
}

final class _BookRating extends StatelessWidget {
  const _BookRating({required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    final t = context.cardFooterTheme;
    return Wrap(
      children: [
        Icon(Icons.star, color: t.ratingIconColor),
        SizedBox(width: t.ratingIconSpacing),
        Padding(
          padding: EdgeInsets.only(top: t.ratingTopPadding),
          child: Text(
            rating.toStringAsFixed(2),
            style: TextStyle(color: t.ratingTextColor),
          ),
        ),
      ],
    );
  }
}

final class _ShareButton extends StatelessWidget {
  const _ShareButton({required this.shareText});

  final Option<String> shareText;

  @override
  Widget build(BuildContext context) {
    return shareText.fold(
      () => const SizedBox.shrink(),
      (text) => Padding(
        padding: EdgeInsets.only(
          right: context.cardFooterTheme.shareRightPadding,
        ),
        child: GestureDetector(
          child: Icon(
            Icons.share,
            size: context.cardFooterTheme.shareIconSize,
            color: context.cardFooterTheme.shareIconColor,
          ),
          onTap: () => SharePlus.instance.share(ShareParams(text: text)),
        ),
      ),
    );
  }
}

final class _BookSize extends StatelessWidget {
  const _BookSize({required this.pageCount});

  final int pageCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: context.cardFooterTheme.pageCountTopPadding,
          ),
          child: Text(
            pageCount.toString(),
            style: TextStyle(color: context.cardFooterTheme.sizeLabelTextColor),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: context.cardFooterTheme.pageCountSpacing,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: context.cardFooterTheme.sizeLabelTopPadding,
          ),
          child: _BookSizeLabel(pageCount: pageCount),
        ),
      ],
    );
  }
}

final class _BookSizeLabel extends StatelessWidget {
  const _BookSizeLabel({required this.pageCount});

  final int pageCount;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SettingsBloc, SettingsState, BookSizeLimits>(
      selector: (state) => state.bookSizeLimits,
      builder: (context, bookSizeLimits) {
        final t = context.cardFooterTheme;
        final (sizeLabel, sizeColor) = _sizeProperties(bookSizeLimits, t);
        return Container(
          alignment: Alignment.center,
          width: t.sizeLabelSize,
          height: t.sizeLabelSize,
          decoration: BoxDecoration(
            color: sizeColor,
            borderRadius: BorderRadius.circular(t.sizeLabelBorderRadius),
            border: Border.all(color: sizeColor),
          ),
          child: Text(sizeLabel, style: TextStyle(color: t.sizeLabelTextColor)),
        );
      },
    );
  }

  (String, Color) _sizeProperties(BookSizeLimits limits, CardFooterTheme t) {
    if (limits.isShort(pageCount)) {
      return ('S', t.shortBookColor);
    } else if (limits.isMedium(pageCount)) {
      return ('M', t.mediumBookColor);
    } else {
      return ('L', t.longBookColor);
    }
  }
}
