import 'dart:convert';
import 'package:get/get.dart';
import 'package:tr_store/route/app_route.dart';
import 'package:tr_store/common/util/app_util.dart';
import 'package:tr_store/common/helper/sql_helper.dart';
import 'package:tr_store/common/api/api_constants.dart';
import 'package:tr_store/model/network/post_model.dart';
import 'package:tr_store/common/constant/app_texts.dart';
import 'package:tr_store/common/constant/app_colors.dart';

class HomeViewModel extends GetxController {
  RxBool isLoading = false.obs;
  RxList<PostModel> posts = <PostModel>[].obs;
  RxInt cartItemCount = 0.obs;

  @override
  void onInit() {
    _getPosts();
    super.onInit();
  }

  Future<void> addCartItem(PostModel post) async {
    final data = await SqlHelper.getItems();
    List<PostModel> posts = postModelFromJson(jsonEncode(data));

    if (posts.isEmpty) {
      await SqlHelper.createItem(post.id!, post.thumbnail!, post.title!, post.content!, post.userId!, 1);
      AppUtil.showSnackBar(
        AppTexts.success,
        AppTexts.addedCartItem,
        leftBarIndicatorColor: AppColors.success,
      );
      _getItems();
      return;
    }

    bool isMatched = false;
    for (final (index, postItem) in posts.indexed) {
      if (postItem.id == post.id) {
        isMatched = true;
        await SqlHelper.createItem(post.id!, post.thumbnail!, post.title!, post.content!, post.userId!, postItem.quantity! + 1);
        AppUtil.showSnackBar(
          AppTexts.success,
          AppTexts.updatedCartItem,
          leftBarIndicatorColor: AppColors.success,
        );
      }
    }

    if (!isMatched) {
      await SqlHelper.createItem(post.id!, post.thumbnail!, post.title!, post.content!, post.userId!, 1);
      AppUtil.showSnackBar(
        AppTexts.success,
        AppTexts.addedCartItem,
        leftBarIndicatorColor: AppColors.success,
      );
    }
    _getItems();
  }

  void _getItems() async {
    final data = await SqlHelper.getItems();
    List<PostModel> posts = postModelFromJson(jsonEncode(data));
    cartItemCount.value = posts.length;
  }

  void goToCartPage() => Get.toNamed(AppRoute.cart);

  void postItemOnTap(PostModel post) => Get.toNamed(AppRoute.postDetail, arguments: {"postId": post.id});

  Future<void> _getPosts() async {
    isLoading.value = true;
    ApiService().get(
      ApiUrls.urlPostsPath,
      beforeSend: () => {},
      onSuccess: (onResponse) {
        posts.value = postModelFromJson(onResponse);
        isLoading.value = false;
      },
      onError: (onError) {
        AppUtil.showSnackBar(
          AppTexts.error,
          AppTexts.somethingWentWrong,
          leftBarIndicatorColor: AppColors.error,
        );
        isLoading.value = false;
      },
    );
  }
}
