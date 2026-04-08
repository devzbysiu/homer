import 'package:flutter/cupertino.dart';
import 'package:homer/core/utils/fallback_img.dart';
import 'package:test/test.dart';

void main() {
  group('fallbackThumbnail', () {
    test('should return Image', () {
      // when
      final Widget thumbnail = fallbackThumbnail();

      // then
      expect(thumbnail is Image, true);
    });
  });

  group('thumbnailFallbackAssetImage', () {
    test('should return AssetImage with thumbnail fallback', () {
      // when
      final assetImage = thumbnailFallbackAssetImage();

      // then
      expect(assetImage.assetName, 'assets/book-thumbnail-fallback.png');
    });
  });

  group('coverFallbackAssetImage', () {
    test('should return AssetImage with book cover fallback', () {
      // when
      final assetImage = coverFallbackAssetImage();

      // then
      expect(assetImage.assetName, 'assets/book-cover-fallback.webp');
    });
  });
}
