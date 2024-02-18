import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tr_store/common/constant/app_colors.dart';
import 'package:tr_store/view_model/post_detail_view_model.dart';
import 'package:tr_store/common/widget/custom_slider_indicator.dart';
import 'package:tr_store/view/post_detail/component/post_detail_app_bar.dart';
import 'package:tr_store/view/post_detail/component/post_detail_scrollable_sheet.dart';

class PostDetailSection extends GetWidget<PostDetailViewModel> {
  const PostDetailSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const padding = 24.0;
    final Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.white,
        body: Stack(
          children: [
            SizedBox(
              height: size.height * .6,
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Image.network(
                    controller.post.image ?? "",
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            CustomSliderIndicator(
              padding: padding,
              indicatorLength: 2,
              activeIndex: controller.activeIndex.value,
            ),
            PostDetailAppBar(
              size: size,
              padding: padding,
            ),
            const PostDetailScrollableSheet(),
          ],
        ),
      ),
    );
  }
}
