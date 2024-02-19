import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tr_store/common/constant/constants.dart';
import 'package:tr_store/view/cart/component/cart_custom_item.dart';
import 'package:tr_store/view_model/cart_view_model.dart';
import 'package:tr_store/common/widget/custom_app_bar.dart';
import 'package:tr_store/common/widget/custom_progress_bar.dart';
import 'package:tr_store/view/home/component/home_custom_item.dart';

class CartSection extends GetWidget<CartViewModel> {
  const CartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomAppBar(
        title: "Cart",
        body: Stack(
          children: [
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.85,
              ),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: controller.posts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppDefaults.padding, vertical: 10.0),
                  child: CartCustomItem(
                    post: controller.posts[index],
                    controller: controller,
                  ),
                );
              },
            ),
            controller.isLoading.value ? const CustomProgressBar() : Container(),
          ],
        ),
      ),
    );
  }
}
