part of 'bottom_drawer_content.dart';

final class _SavableBookWithSummary extends StatelessWidget {
  const _SavableBookWithSummary();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final sharedBook = context.select(
          (ShareBookBloc bloc) => bloc.state.sharedBook,
        );
        final pickedBook = context.select(
          (BookSearchBloc bloc) => bloc.state.pickedBook,
        );
        final bookCandidate = pickedBook.orElse(() => sharedBook);
        return bookCandidate.fold(
          () => const SizedBox.shrink(),
          (book) => _showBookCandidate(book, context),
        );
      },
    );
  }

  Padding _showBookCandidate(Book book, BuildContext context) {
    final t = context.bottomDrawerTheme;
    return Padding(
      padding: EdgeInsets.only(top: t.bookAreaTopPadding),
      child: Stack(
        children: [
          _BookWithSummary(pickedBook: book),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: t.tagsRowBottomPosition,
            child: Padding(
              padding: EdgeInsets.only(right: t.tagsRowRightPadding),
              child: const _Tags(),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: t.saveButtonsBottomPosition,
            child: _SaveButtons(pickedBook: book),
          ),
        ],
      ),
    );
  }
}

final class _BookWithSummary extends StatelessWidget {
  const _BookWithSummary({required this.pickedBook});

  final Book pickedBook;

  @override
  Widget build(BuildContext context) {
    final t = context.bottomDrawerTheme;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: t.bookContainerHorizontalPadding,
      ),
      child: _DropCapText(
        // NOTE: mapper takes care of mapping null summary to default 'No description'
        text: pickedBook.summary.toNullable()!,
        overflow: TextOverflow.ellipsis,
        dropCap: _DropCap(
          width: t.dropCapWidth,
          height: t.dropCapHeight,
          child: WithSavedCheckMark(
            book: pickedBook,
            width: t.savedMarkOverlayWidth,
            height: t.savedMarkOverlayHeight,
            iconSize: t.savedMarkIconSize,
            child: _RemoteBookCard(book: pickedBook),
          ),
        ),
        dropCapPadding: EdgeInsets.only(
          bottom: t.dropCapBottomPadding,
          right: t.dropCapRightPadding,
        ),
      ),
    );
  }
}

// This is copy of https://github.com/mtiziano/drop_cap_text/blob/2c1c7eee913e03650ff2c5f52d83fa24068f5ba2/lib/drop_cap_text.dart
// Heavily modified (striped out of useless stuff).
final class _DropCap extends StatelessWidget {
  const _DropCap({
    required this.child,
    required this.width,
    required this.height,
  });

  final Widget child;

  final double width;

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width, height: height, child: child);
  }
}

final class _DropCapText extends StatelessWidget {
  const _DropCapText({
    required this.text,
    required this.dropCap,
    this.dropCapPadding = EdgeInsets.zero,
    this.overflow = TextOverflow.clip,
  });

  final String text;

  final TextAlign textAlign = TextAlign.start;

  final _DropCap dropCap;

  final EdgeInsets dropCapPadding;

  final TextDirection textDirection = TextDirection.ltr;

  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    double capWidth, capHeight;

    // custom DropCap
    capWidth = dropCap.width;
    capHeight = dropCap.height;

    // compute drop cap padding
    capWidth += dropCapPadding.left + dropCapPadding.right;
    capHeight += dropCapPadding.top + dropCapPadding.bottom;

    TextSpan textSpan = TextSpan(
      text: text,
      style: context.bottomDrawerTheme.summaryStyle,
    );

    TextPainter textPainter = TextPainter(
      textDirection: textDirection,
      text: textSpan,
      textAlign: textAlign,
    );
    double lineHeight = textPainter.preferredLineHeight;

    int rows = (capHeight / lineHeight).ceil();

    // BUILDER
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double boundsWidth = constraints.maxWidth - capWidth;
        if (boundsWidth < 1) boundsWidth = 1;

        int charIndexEnd = text.length;

        if (rows > 0) {
          textPainter.layout(maxWidth: boundsWidth);
          double yPos = rows * lineHeight;
          int charIndex = textPainter
              .getPositionForOffset(Offset(0, yPos))
              .offset;
          textPainter.maxLines = rows;
          textPainter.layout(maxWidth: boundsWidth);
          if (textPainter.didExceedMaxLines) charIndexEnd = charIndex;
        }

        return SizedBox(
          height: context.bottomDrawerTheme.summaryBoxHeight,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  textDirection: textDirection,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: dropCapPadding, child: dropCap),
                    Flexible(
                      child: SizedBox(
                        width: boundsWidth,
                        height: lineHeight * rows,
                        child: RichText(
                          textDirection: textDirection,
                          textAlign: textAlign,
                          text: textSpan,
                        ),
                      ),
                    ),
                  ],
                ),
                RichText(
                  textAlign: textAlign,
                  textDirection: textDirection,
                  text: TextSpan(
                    text: text.substring(charIndexEnd),
                    style: context.bottomDrawerTheme.summaryStyle,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

final class _RemoteBookCard extends StatelessWidget {
  const _RemoteBookCard({required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    final t = context.bottomDrawerTheme;
    return TransparentImageCard(
      contentMarginTop: t.remoteBookCardContentMarginTop,
      height: t.remoteBookCardHeight,
      imageProvider: _imageProvider() as ImageProvider<Object>,
      tags: const [],
      title: BookTitleAndTagTile(book: book),
      endColor: t.remoteBookCardEndColor,
      description: BookAuthors(authorNames: book.authors),
      footer: BookCardFooter(rating: book.rating, pageCount: book.pageCount),
    );
  }

  Object _imageProvider() {
    return book.thumbnailAddress.fold(
      () => coverFallbackAssetImage(),
      (thumbnail) => CachedNetworkImageProvider(thumbnail.toString()),
    );
  }
}
