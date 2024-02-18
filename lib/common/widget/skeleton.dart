import 'package:flutter/material.dart';
import 'package:tr_store/common/constant/constants.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({Key? key, this.height, this.width, this.layer = 1}) : super(key: key);

  final double? height, width;
  final int layer;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(AppDefaults.padding / 2),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04 * layer),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDefaults.radius),
        ),
      ),
    );
  }
}

class CircleSkeleton extends StatelessWidget {
  const CircleSkeleton({Key? key, this.size = 24.0}) : super(key: key);

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.04),
        shape: BoxShape.circle,
      ),
    );
  }
}
