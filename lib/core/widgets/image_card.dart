import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';

import '../../features/tags_manager/domain/entities/tag.dart';
import '../utils/color_mapper.dart';
import '../utils/fallback_img.dart';

final class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.title,
    required this.authors,
    required this.rating,
    required this.pageCount,
    this.tags,
    this.thumbnailAddress,
  });

  final String title;

  final List<String> authors;

  final double rating;

  final int pageCount;

  final String? thumbnailAddress;

  final Set<Tag>? tags;

  @override
  Widget build(BuildContext context) {
    return TransparentImageCard(
      imageProvider: _imageProvider() as ImageProvider<Object>,
      tags: _tags(),
      title: _BookTitle(title: title),
      description: _BookAuthors(authorNames: authors),
      footer: _BookCardFooter(
        rating: rating,
        pageCount: pageCount,
      ),
    );
  }

  Object _imageProvider() {
    return thumbnailAddress == null
        ? coverFallbackAssetImage()
        : CachedNetworkImageProvider(thumbnailAddress!);
  }

  List<Widget> _tags() {
    return tags == null ? [] : tags!.map((tag) => _Tag(tag: tag)).toList();
  }
}

final class _BookTitle extends StatelessWidget {
  const _BookTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}

final class _BookAuthors extends StatelessWidget {
  const _BookAuthors({required this.authorNames});

  final List<String> authorNames;

  @override
  Widget build(BuildContext context) {
    return Text(
      authorNames.join(', '),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}

final class _BookCardFooter extends StatelessWidget {
  const _BookCardFooter({required this.rating, required this.pageCount});

  final double rating;

  final int pageCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        const SizedBox(
          width: 4,
        ),
        Expanded(
          child: Text(
            rating.toStringAsFixed(2),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Text(
          pageCount.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 10,
          ),
        ),
        const Icon(
          Icons.menu_book_outlined,
          color: Colors.white,
        )
      ],
    );
  }
}

final class _Tag extends StatelessWidget {
  const _Tag({required this.tag});

  final Tag tag;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: toFlutterColor(tag.color),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 2,
        ),
        child: Text(
          tag.name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
