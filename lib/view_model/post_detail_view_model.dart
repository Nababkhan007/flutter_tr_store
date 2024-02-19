import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tr_store/route/app_route.dart';
import 'package:tr_store/common/util/app_util.dart';
import 'package:tr_store/common/api/api_constants.dart';
import 'package:tr_store/common/helper/sql_helper.dart';
import 'package:tr_store/model/network/post_model.dart';
import 'package:tr_store/common/constant/app_texts.dart';
import 'package:tr_store/common/constant/constants.dart';

class PostDetailViewModel extends GetxController {
  int postId = 0;
  RxInt activeIndex = 0.obs;
  PageController pageController = PageController();
  RxInt descriptionMaxLines = 3.obs;
  RxInt cartItemCount = 0.obs;
  Rx<PostModel> post = PostModel().obs;

  @override
  void onInit() {
    _getArguments();
    _getPostsDetails();
    pageControllerAddListener();
    _getItems();
    super.onInit();
  }

  Future<void> _getPostsDetails() async {
    ApiService().get(
      "${ApiUrls.urlPostsPath}/$postId",
      beforeSend: () => {},
      onSuccess: (onResponse) {
        post.value = postItemModelFromJson(onResponse);
      },
      onError: (onError) {
        AppUtil.showSnackBar(
          AppTexts.error,
          AppTexts.somethingWentWrong,
          leftBarIndicatorColor: AppColors.error,
        );
      },
    );
  }

  void goToCartPage() => Get.toNamed(AppRoute.cart);

  Future<void> addCartItem() async {
    final data = await SqlHelper.getItems();
    List<PostModel> posts = postModelFromJson(jsonEncode(data));

    if (posts.isEmpty) {
      await SqlHelper.createItem(post.value.id!, post.value.thumbnail!, post.value.title!, post.value.content!, post.value.userId!, 1);
      AppUtil.showSnackBar(
        AppTexts.success,
        AppTexts.addedCartItem,
        leftBarIndicatorColor: AppColors.success,
      );
      _getItems();
      return;
    }

    for (final (index, postItem) in posts.indexed) {
      if (postItem.id == post.value.id) {
        await SqlHelper.createItem(
            post.value.id!, post.value.thumbnail!, post.value.title!, post.value.content!, post.value.userId!, postItem.quantity! + 1);
        AppUtil.showSnackBar(
          AppTexts.success,
          AppTexts.updatedCartItem,
          leftBarIndicatorColor: AppColors.success,
        );
        break;
      } else {
        await SqlHelper.createItem(post.value.id!, post.value.thumbnail!, post.value.title!, post.value.content!, post.value.userId!, 1);
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
      postId = Get.arguments["postId"] ?? 0;
    }
  }
}
