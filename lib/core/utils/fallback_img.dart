import 'package:flutter/material.dart';

Widget fallbackThumbnail() {
  return Image(image: thumbnailFallbackAssetImage());
}

AssetImage thumbnailFallbackAssetImage() {
  return const AssetImage('assets/book-thumbnail-fallback.png');
}

Widget fallbackCover() {
  return Image(image: coverFallbackAssetImage());
}

AssetImage coverFallbackAssetImage() {
  return const  AssetImage('assets/book-cover-fallback.webp');
}
