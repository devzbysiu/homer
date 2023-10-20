import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../books_listing/presentation/widgets/book_cover.dart';
import '../../../books_listing/presentation/widgets/swipeable_card.dart';
import '../../domain/entities/local_book.dart';

const _noSummaryText = 'No summary.';

final class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key, required this.book});

  final LocalBook book;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [
        FlipEffect(
          direction: Axis.horizontal,
        ),
      ],
      child: SwipeableCard(
        book: book,
        child: Blur(
          colorOpacity: 1.0,
          blur: 0.0,
          overlay: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Text(
                book.summary.fold(
                  () => _noSummaryText,
                  (summary) => summary.isEmpty ? _noSummaryText : summary,
                ),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          blurColor: Theme.of(context).colorScheme.background,
          child: BookCover(book: book),
        ),
      ),
    );
  }
}
