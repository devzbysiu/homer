// This is copy of https://github.com/mtiziano/drop_cap_text/blob/2c1c7eee913e03650ff2c5f52d83fa24068f5ba2/lib/drop_cap_text.dart
// Heavily modified (striped out of useless stuff).
import 'package:flutter/material.dart';

class DropCap extends StatelessWidget {
  const DropCap({
    Key? key,
    required this.child,
    required this.width,
    required this.height,
  }) : super(key: key);

  final Widget child;

  final double width;

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width, height: height, child: child);
  }
}

class DropCapText extends StatelessWidget {
  const DropCapText({
    Key? key,
    required this.text,
    required this.dropCap,
    this.dropCapPadding = EdgeInsets.zero,
    this.overflow = TextOverflow.clip,
  }) : super(key: key);

  final String text;

  final TextAlign textAlign = TextAlign.start;

  final DropCap dropCap;

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
