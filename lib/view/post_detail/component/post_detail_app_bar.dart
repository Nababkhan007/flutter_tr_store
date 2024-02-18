import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tr_store/common/constant/app_texts.dart';
import 'package:tr_store/common/constant/constants.dart';
import 'package:tr_store/view_model/post_detail_view_model.dart';

class PostDetailAppBar extends GetWidget<PostDetailViewModel> {
  const PostDetailAppBar({
    Key? key,
    required this.size,
    required this.padding,
  }) : super(key: key);

  final Size size;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(padding, padding * 2, padding, 0.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32.0),
            color: AppColors.primary,
          ),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(padding, padding * 2, padding, 0.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(32.0),
              right: Radius.circular(32.0),
            ),
            color: AppColors.primary,
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: padding, vertical: 8.0),
            child: Text(
              "${AppTexts.taka}${controller.post.userId}",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.white),
            ),
          ),
        ),
      ],
    );
  }
}
