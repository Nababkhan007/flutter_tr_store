import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tr_store/common/constant/constants.dart';
import 'package:tr_store/view_model/post_detail_view_model.dart';

class PostDetailAppBar extends GetWidget<PostDetailViewModel> {
  final Size size;
  final double padding;

  const PostDetailAppBar({
    Key? key,
    required this.size,
    required this.padding,
  }) : super(key: key);

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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32.0),
            color: AppColors.primary,
          ),
          child: Obx(
            () => Badge(
              label: Text("${controller.cartItemCount}"),
              child: IconButton(
                onPressed: () => controller.goToCartPage(),
                icon: const Icon(
                  Icons.shopping_bag,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
