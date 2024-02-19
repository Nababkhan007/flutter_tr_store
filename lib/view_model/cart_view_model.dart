import 'dart:convert';
import 'package:get/get.dart';
import 'package:tr_store/route/app_route.dart';
import 'package:tr_store/common/util/app_util.dart';
import 'package:tr_store/common/helper/sql_helper.dart';
import 'package:tr_store/model/network/post_model.dart';
import 'package:tr_store/common/constant/app_texts.dart';
import 'package:tr_store/common/constant/constants.dart';

class CartViewModel extends GetxController {
  RxBool isLoading = false.obs;
  RxList<PostModel> posts = <PostModel>[].obs;
  RxInt cartItemCount = 0.obs;

  @override
  void onInit() {
    _getItems();
    super.onInit();
  }

  void goToCartPage() => Get.toNamed(AppRoute.cart);

  void deleteItem(int id) async {
    await SqlHelper.deleteItem(id);
    AppUtil.showSnackBar(
      AppTexts.success,
      AppTexts.deletedCartItem,
      leftBarIndicatorColor: AppColors.success,
    );
    _getItems();
  }

  void _getItems() async {
    isLoading.value = true;
    final data = await SqlHelper.getItems();
    posts.value = postModelFromJson(jsonEncode(data));
    cartItemCount.value = posts.length;
    isLoading.value = false;
  }
}
