import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tr_store/common/constant/constants.dart';
import 'package:tr_store/view_model/home_view_model.dart';
import 'package:tr_store/common/widget/custom_app_bar.dart';
import 'package:tr_store/view/home/component/home_custom_item.dart';
import 'package:tr_store/view/home/component/home_post_item_skeleton.dart';

class HomeSection extends GetWidget<HomeViewModel> {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomAppBar(
        automaticallyImplyLeading: false,
        title: "TR Store",
        actions: [
          IconButton(
            onPressed: () => controller.goToCartPage(),
            icon: const Icon(Icons.shopping_bag),
          ),
        ],
        body: Stack(
          children: [
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: controller.isLoading.value ? 1 / 1.5 : 1 / 1.5,
              ),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: controller.posts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppDefaults.padding, vertical: 10.0),
                  child: HomeCustomItem(
                    post: controller.posts[index],
                    controller: controller,
                  ),
                );
              },
            ),
            controller.isLoading.value ? const HomePostItemSkeleton() : Container(),
          ],
        ),
      ),
    );
  }
}
