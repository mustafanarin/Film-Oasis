import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_oasis/product/constants/enum/app_duration.dart';
import 'package:film_oasis/product/constants/enum/project_radius.dart';
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
    this.color,
    this.isFavoritePage,
  });

  final String? imageUrl;
  final double? height;
  final double? width;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final bool withShadow;
  final bool isBackdrop;
  final Color? color;
  final bool? isFavoritePage;

  static final customCacheManager = CacheManager(
    Config(
      _CacheKey.filmOasisCacheKey.name,
      stalePeriod: Duration(days: AppDuration.three.value),
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
      borderRadius: borderRadius ?? BorderRadius.circular(ProjectRadius.xSmall.value),
      child: CachedNetworkImage(
        color: color,
        imageUrl: finalImageUrl,
        height: height,
        width: width,
        fit: fit,
        cacheManager: customCacheManager,
        fadeInDuration: Duration(milliseconds: AppDuration.smallMilliSeconds.value),
        fadeOutDuration: Duration(milliseconds: AppDuration.smallMilliSeconds.value),
        memCacheHeight: (height ?? 300).toInt() * 2,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );

    if (!withShadow) return imageWidget;

    return (isFavoritePage == null)
        ? Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: ProjectColors.black.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: imageWidget,
          )
        : imageWidget;
  }
}

enum _CacheKey { filmOasisCacheKey }
