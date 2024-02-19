import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tr_store/route/app_route.dart';
import 'package:tr_store/common/util/app_util.dart';
import 'package:tr_store/common/helper/sql_helper.dart';
import 'package:tr_store/model/network/post_model.dart';
import 'package:tr_store/common/constant/app_texts.dart';
import 'package:tr_store/common/constant/constants.dart';

class PostDetailViewModel extends GetxController {
  RxInt activeIndex = 0.obs;
  PageController pageController = PageController();
  PostModel post = PostModel();
  RxInt descriptionMaxLines = 3.obs;
  RxInt cartItemCount = 0.obs;

  @override
  void onInit() {
    _getArguments();
    pageControllerAddListener();
    _getItems();
    super.onInit();
  }

  void goToCartPage() => Get.toNamed(AppRoute.cart);

  Future<void> addCartItem() async {
    final data = await SqlHelper.getItems();
    List<PostModel> posts = postModelFromJson(jsonEncode(data));

    for (final (index, postItem) in posts.indexed) {
      if (postItem.id == post.id) {
        await SqlHelper.createItem(post.id!, post.thumbnail!, post.title!, post.content!, post.userId!, postItem.quantity! + 1);
        AppUtil.showSnackBar(
          AppTexts.success,
          AppTexts.updatedCartItem,
          leftBarIndicatorColor: AppColors.success,
        );
        break;
      } else {
        await SqlHelper.createItem(post.id!, post.thumbnail!, post.title!, post.content!, post.userId!, 1);
        AppUtil.showSnackBar(
          AppTexts.success,
          AppTexts.addedCartItem,
          leftBarIndicatorColor: AppColors.success,
        );
        break;
      }
    }
    _getItems();
  }

  void _getItems() async {
    final data = await SqlHelper.getItems();
    List<PostModel> posts = postModelFromJson(jsonEncode(data));
    cartItemCount.value = posts.length;
  }

  void pageControllerAddListener() {
    pageController.addListener(() {
      activeIndex.value = pageController.page!.round();
    });
  }

  void _getArguments() {
    if (Get.arguments != null) {
      post = Get.arguments["post"] ?? PostModel();
    }
  }
}
