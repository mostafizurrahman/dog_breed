import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_breed/ui/widgets/theme_provider.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  static const String image =
      'https://icons.iconarchive.com/icons/iconarchive/cute-animal/512/Cute-Dog-icon.png';
  final String imageUrl;
  final double dimension;
  const ImageView({
    super.key,
    this.imageUrl = image,
    this.dimension = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ThemeProvider.circle,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(dimension / 2)),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CachedNetworkImage(
            width: dimension,
            height: dimension,
            imageUrl: image,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
