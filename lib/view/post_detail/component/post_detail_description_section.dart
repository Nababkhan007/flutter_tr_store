import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tr_store/common/constant/app_colors.dart';
import 'package:tr_store/view_model/post_detail_view_model.dart';

class PostDetailDescriptionSection extends GetWidget<PostDetailViewModel> {
  final double padding;

  const PostDetailDescriptionSection({Key? key, required this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      margin: EdgeInsets.only(top: padding),
      decoration: const BoxDecoration(
        color: AppColors.separator,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Icon(
              Icons.drag_handle_rounded,
              color: AppColors.primary,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: padding * 0.5,
              bottom: padding * 0.01,
              left: padding,
              right: padding,
            ),
            child: Obx(
              () => Text(
                controller.post.value.title ?? "",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: padding,
            ),
            child: Obx(
              () => Text(
                controller.post.value.content ?? "",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.placeholder,
                    ),
                maxLines: controller.descriptionMaxLines.value,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Obx(
            () => Padding(
              padding: EdgeInsets.symmetric(
                vertical: padding * .5,
                horizontal: padding,
              ),
              child: GestureDetector(
                onTap: () {
                  if (controller.descriptionMaxLines.value == 3) {
                    controller.descriptionMaxLines.value = 40;
                  } else {
                    controller.descriptionMaxLines.value = 3;
                  }
                },
                child: Text(
                  controller.descriptionMaxLines.value == 3 ? "Show more" : "Show less",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.primary,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
