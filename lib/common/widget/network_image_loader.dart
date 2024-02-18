import 'package:flutter/material.dart';
import 'package:tr_store/common/widget/skeleton.dart';
import 'package:tr_store/common/constant/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NetworkImageLoader extends StatelessWidget {
  final BoxFit fit;

  const NetworkImageLoader(
    this.src, {
    Key? key,
    this.fit = BoxFit.cover,
    this.radius = AppDefaults.radius,
    this.borderRadius,
  }) : super(key: key);

  final String src;
  final double radius;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(radius)),
      child: CachedNetworkImage(
        fit: fit,
        imageUrl: src,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: fit,
            ),
          ),
        ),
        placeholder: (context, url) => const Skeleton(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
