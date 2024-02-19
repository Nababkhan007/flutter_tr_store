import 'package:flutter/material.dart';
import 'package:tr_store/common/widget/skeleton.dart';
import 'package:tr_store/common/constant/constants.dart';

class HomePostItemSkeleton extends StatelessWidget {
  const HomePostItemSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: 100,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(AppDefaults.padding / 1.1),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 0.1, color: AppColors.placeholder),
              borderRadius: AppDefaults.borderRadius,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: AppDefaults.padding),
                    child: Skeleton(height: 120.0, width: 120.0),
                  ),
                ),
                SizedBox(height: AppDefaults.padding / 2),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Skeleton(),
                ),
                SizedBox(height: AppDefaults.padding / 2),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Skeleton(),
                ),
                SizedBox(height: AppDefaults.padding / 2),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Skeleton(),
                ),
                SizedBox(height: AppDefaults.padding / 2),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Skeleton(width: 80.0),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
