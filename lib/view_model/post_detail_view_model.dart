import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tr_store/model/network/post_model.dart';

class PostDetailViewModel extends GetxController {
  RxInt activeIndex = 0.obs;
  PageController pageController = PageController();
  PostModel post = PostModel();
  RxInt descriptionMaxLines = 3.obs;

  @override
  void onInit() {
    _getArguments();
    pageControllerAddListener();
    super.onInit();
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
