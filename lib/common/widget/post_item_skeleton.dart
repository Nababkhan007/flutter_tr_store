import 'package:flutter/material.dart';
import 'package:tr_store/common/constant/constants.dart';

class PostItemSkeleton extends StatelessWidget {
  final double? height, width;

  const PostItemSkeleton({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(AppDefaults.padding / 2),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDefaults.padding),
        ),
      ),
    );
  }
}
