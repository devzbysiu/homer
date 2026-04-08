// This is copy from https://github.com/zeref278/image_card/blob/3c85102539087d5bf9530ec5196f34cd512da105/lib/src/transparent_image_card.dart
import 'package:flutter/material.dart';

final class TransparentImageCard extends StatelessWidget {
  const TransparentImageCard({
    super.key,
    this.width,
    this.height,
    this.contentMarginTop,
    this.borderRadius = 6,
    this.contentPadding,
    required this.imageProvider,
    this.tags,
    this.title,
    this.description,
    this.endColor,
    this.tagSpacing,
    this.tagRunSpacing,
    this.startColor,
    this.footer,
  });

  /// card width
  final double? width;

  /// card height
  final double? height;

  /// padding from top of card to content
  final double? contentMarginTop;

  /// border radius value
  final double borderRadius;

  /// spacing between tag
  final double? tagSpacing;

  /// run spacing between line tag
  final double? tagRunSpacing;

  /// content padding
  final EdgeInsetsGeometry? contentPadding;

  /// image provider
  final ImageProvider imageProvider;

  /// list of widgets
  final List<Widget>? tags;

  /// color gradient start, default [0xff575757] with opacity 0
  final Color? startColor;

  /// color gradient end, default [0xff000000]
  final Color? endColor;

  /// widget title of card
  final Widget? title;

  /// widget description of card
  final Widget? description;

  /// widget footer of card
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    final Widget content = _ImageCardContent(
      contentPadding: contentPadding,
      tags: tags,
      title: title,
      footer: footer,
      description: description,
      tagSpacing: tagSpacing,
      tagRunSpacing: tagRunSpacing,
    );

    return _buildBody(content);
  }

  Widget _buildBody(Widget content) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: ShaderMask(
            shaderCallback: (bound) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  startColor ?? const Color(0xff575757).withValues(alpha: 0),
                  endColor ?? const Color(0xff000000),
                ],
              ).createShader(bound);
            },
            blendMode: BlendMode.srcOver,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Align(alignment: Alignment.bottomCenter, child: content),
        ),
      ],
    );
  }
}

final class _ImageCardContent extends StatelessWidget {
  const _ImageCardContent({
    this.contentPadding,
    this.tags,
    this.title,
    this.description,
    this.footer,
    this.tagSpacing,
    this.tagRunSpacing,
  });

  final EdgeInsetsGeometry? contentPadding;
  final List<Widget>? tags;
  final double? tagSpacing;
  final double? tagRunSpacing;

  final Widget? title;
  final Widget? description;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          contentPadding ??
          const EdgeInsets.only(top: 8, bottom: 12, left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (tags != null)
            Wrap(
              spacing: tagSpacing ?? 12,
              runSpacing: tagRunSpacing ?? 10,
              children: tags!,
            ),
          if (title != null || description != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null) title!,
                  if (title != null && description != null)
                    const SizedBox(height: 2),
                  if (description != null) description!,
                ],
              ),
            ),
          if (footer != null)
            Padding(padding: const EdgeInsets.only(top: 2), child: footer!),
        ],
      ),
    );
  }
}
