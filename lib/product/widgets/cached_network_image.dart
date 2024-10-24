import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_oasis/product/constants/project_colors.dart';
import 'package:film_oasis/product/constants/project_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ProjectCachedImage extends StatelessWidget {
  const ProjectCachedImage({
    required this.imageUrl,
    super.key,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.withShadow = true,
    this.isBackdrop = false,
  });

  final String? imageUrl;
  final double? height;
  final double? width;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final bool withShadow;
  final bool isBackdrop;

  static final customCacheManager = CacheManager(
    Config(
      _CacheKey.filmOasisCacheKey.name,
      stalePeriod: const Duration(days: 3),
      maxNrOfCacheObjects: 100,
    ),
  );

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return SizedBox(
        height: height,
        width: width,
        child: const Placeholder(
          color: ProjectColors.grey,
        ),
      );
    }

    final finalImageUrl = '${ProjectStrings.filmImagePath}$imageUrl';
    final imageWidget = ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(5),
      child: CachedNetworkImage(
        imageUrl: finalImageUrl,
        height: height,
        width: width,
        fit: fit,
        cacheManager: customCacheManager,
        fadeInDuration: const Duration(milliseconds: 300),
        fadeOutDuration: const Duration(milliseconds: 300),
        memCacheHeight: (height ?? 300).toInt() * 2,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );

    if (!withShadow) return imageWidget;

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: imageWidget,
    );
  }
}

enum _CacheKey { filmOasisCacheKey }
