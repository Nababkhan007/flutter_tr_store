import 'package:flutter/material.dart';
import 'package:tr_store/common/constant/constants.dart';

class CustomProgressBar extends StatelessWidget {
  final Color color;

  const CustomProgressBar({
    Key? key,
    this.color = AppColors.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: color),
    );
  }
}
