part of 'bottom_drawer_content.dart';

final class _SavableBookWithSummary extends StatelessWidget {
  const _SavableBookWithSummary();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final sharedBook = context.select(
        (ShareBookBloc bloc) => bloc.state.sharedBook,
      );
      final pickedBook = context.select(
        (PickSuggestionBloc bloc) => bloc.state.pickedBook,
      );
      final bookCandidate = pickedBook.orElse(() => sharedBook);
      return bookCandidate.fold(
        () => Container(),
        (book) => _showBookCandidate(book, context),
      );
    });
  }

  Padding _showBookCandidate(Book book, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: Stack(
        children: [
          _BookWithSummary(pickedBook: book),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 60,
            child: const Padding(
              padding: EdgeInsets.only(right: 18.0),
              child: _Tags(),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 10,
            child: _SaveButtons(pickedBook: book),
          )
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
    return Container(
      padding: const EdgeInsets.only(left: 9, right: 9),
      child: _DropCapText(
        // NOTE: mapper takes care of mapping null summary to default 'No description'
        text: pickedBook.summary.toNullable()!,
        overflow: TextOverflow.ellipsis,
        dropCap: _DropCap(
          width: 150,
          height: 220,
          child: _RemoteBookCard(book: pickedBook),
        ),
        dropCapPadding: const EdgeInsets.only(
          bottom: 5,
          right: 15,
        ),
      ),
    );
  }
}

// This is copy of https://github.com/mtiziano/drop_cap_text/blob/2c1c7eee913e03650ff2c5f52d83fa24068f5ba2/lib/drop_cap_text.dart
// Heavily modified (striped out of useless stuff).
class _DropCap extends StatelessWidget {
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
    return SizedBox(
      width: width,
      height: height,
      child: child,
    );
  }
}

class _DropCapText extends StatelessWidget {
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
      style: Theme.of(context).textTheme.bodyLarge,
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
        int charIndex =
            textPainter.getPositionForOffset(Offset(0, yPos)).offset;
        textPainter.maxLines = rows;
        textPainter.layout(maxWidth: boundsWidth);
        if (textPainter.didExceedMaxLines) charIndexEnd = charIndex;
      }

      return SizedBox(
        height: 340,
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
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

final class _RemoteBookCard extends StatelessWidget {
  const _RemoteBookCard({required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return TransparentImageCard(
      contentMarginTop: 183,
      height: 280,
      imageProvider: _imageProvider() as ImageProvider<Object>,
      tags: const [],
      title: BookTitle(title: book.title),
      endColor: Colors.black,
      description: BookAuthors(authorNames: book.authors),
      footer: BookCardFooter(
        rating: book.rating,
        pageCount: book.pageCount,
      ),
    );
  }

  Object _imageProvider() {
    return book.thumbnailAddress.fold(
      () => coverFallbackAssetImage(),
      (thumbnail) => CachedNetworkImageProvider(thumbnail.toString()),
    );
  }
}
