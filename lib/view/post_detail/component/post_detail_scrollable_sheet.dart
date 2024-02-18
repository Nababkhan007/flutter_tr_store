import 'package:flutter/material.dart';
import 'package:tr_store/common/constant/app_colors.dart';
import 'package:tr_store/view/post_detail/component/post_detail_description_section.dart';

class PostDetailScrollableSheet extends StatelessWidget {
  const PostDetailScrollableSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const padding = 24.0;
    return DraggableScrollableSheet(
      initialChildSize: .5,
      maxChildSize: .6,
      minChildSize: .45,
      builder: (context, controller) {
        return SingleChildScrollView(
          controller: controller,
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              const PostDetailDescriptionSection(padding: padding),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: padding,
                  ),
                  child: FloatingActionButton(
                    backgroundColor: AppColors.primary,
                    onPressed: () {},
                    child: const Icon(
                      Icons.shopping_bag,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
