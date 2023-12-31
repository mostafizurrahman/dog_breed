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
    final key = imageUrl.split('\/').last;
    return Container(
      decoration: ThemeProvider.circle,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(1000)),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CachedNetworkImage(
            width: dimension,
            height: dimension,
            imageUrl: imageUrl,
            cacheKey: key,
            progressIndicatorBuilder: ThemeProvider.getIndicator,
            errorWidget: ThemeProvider.geErrorView,
          ),
        ),
      ),
    );
  }
}

class NetworkDogImage extends StatelessWidget {
  final String imageUrl;
  final double fixedWidth;
  const NetworkDogImage({
    super.key,
    required this.imageUrl,
    this.fixedWidth = 50,
  });

  @override
  Widget build(BuildContext context) {
    final key = imageUrl.split('\/').last;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6,),
      child: Container(
        decoration: ThemeProvider.shadow,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: SizedBox(
            width: fixedWidth,
            child: CachedNetworkImage(
              cacheKey:  key,
              width: fixedWidth,
              fit: BoxFit.cover,
              imageUrl: imageUrl,
              progressIndicatorBuilder: ThemeProvider.getIndicator,
              errorWidget: ThemeProvider.geErrorView,
            ),
          ),
        ),
      ),
    );
  }


}
