import 'package:get/get.dart';
import 'package:tr_store/route/app_route.dart';
import 'package:tr_store/common/util/app_util.dart';
import 'package:tr_store/common/api/api_constants.dart';
import 'package:tr_store/model/network/post_model.dart';
import 'package:tr_store/common/constant/app_texts.dart';
import 'package:tr_store/common/constant/app_colors.dart';

class HomeViewModel extends GetxController {
  RxBool isLoading = false.obs;
  RxList<PostModel> posts = <PostModel>[].obs;

  @override
  void onInit() {
    _getPosts();
    super.onInit();
  }

  void postItemOnTap(PostModel post) => Get.toNamed(AppRoute.postDetail, arguments: {"post": post});

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
