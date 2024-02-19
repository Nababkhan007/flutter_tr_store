import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tr_store/common/constant/app_texts.dart';
import 'package:tr_store/common/constant/app_colors.dart';
import 'package:tr_store/view_model/post_detail_view_model.dart';
import 'package:tr_store/view/post_detail/component/post_detail_description_section.dart';

class PostDetailScrollableSheet extends GetWidget<PostDetailViewModel> {
  const PostDetailScrollableSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const padding = 24.0;
    return DraggableScrollableSheet(
      initialChildSize: .5,
      maxChildSize: .6,
      minChildSize: .45,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              const PostDetailDescriptionSection(padding: padding),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: padding,
                  ),
                  child: FloatingActionButton(
                    onPressed: null,
                    backgroundColor: AppColors.primary,
                    child: Text(
                      "${AppTexts.taka}${controller.post.userId}",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
