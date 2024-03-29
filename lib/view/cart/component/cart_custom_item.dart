import 'package:flutter/material.dart';
import 'package:tr_store/model/network/post_model.dart';
import 'package:tr_store/common/constant/constants.dart';
import 'package:tr_store/common/constant/app_texts.dart';
import 'package:tr_store/view_model/cart_view_model.dart';
import 'package:tr_store/common/widget/network_image_loader.dart';

class CartCustomItem extends StatelessWidget {
  final PostModel post;
  final CartViewModel controller;

  const CartCustomItem({
    Key? key,
    required this.post,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.scaffoldBackground,
      borderRadius: AppDefaults.borderRadius,
      child: InkWell(
        onTap: () {},
        borderRadius: AppDefaults.borderRadius,
        child: Container(
          padding: const EdgeInsets.all(AppDefaults.padding),
          decoration: BoxDecoration(
            border: Border.all(width: 0.1, color: AppColors.placeholder),
            borderRadius: AppDefaults.borderRadius,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: NetworkImageLoader(
                    post.thumbnail ?? "",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                post.title ?? "",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                post.content ?? "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8.0),
              Text(
                "${AppTexts.taka}${post.userId}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Text(
                    "${post.quantity} pcs",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () => controller.deleteItem(post.id!),
                      icon: const Icon(Icons.delete, color: AppColors.error),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
