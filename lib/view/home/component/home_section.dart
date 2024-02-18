import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tr_store/common/constant/constants.dart';
import 'package:tr_store/view_model/home_view_model.dart';
import 'package:tr_store/common/widget/custom_app_bar.dart';
import 'package:tr_store/common/widget/custom_progress_bar.dart';
import 'package:tr_store/view/home/component/home_custom_item.dart';

class HomeSection extends GetWidget<HomeViewModel> {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      automaticallyImplyLeading: false,
      title: "TR Store",
      body: Obx(
        () => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.5,
          ),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: controller.posts.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppDefaults.padding, vertical: 10.0),
                  child: HomeCustomItem(
                    post: controller.posts[index],
                    controller: controller,
                  ),
                ),
                controller.isLoading.value ? const CustomProgressBar() : Container(),
              ],
            );
          },
        ),
      ),
    );
  }
}
