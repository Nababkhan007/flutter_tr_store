import 'package:flutter/material.dart';
import 'package:tr_store/common/constant/app_colors.dart';
import 'package:flutter_slider_indicator/flutter_slider_indicator.dart';

class CustomSliderIndicator extends StatelessWidget {
  const CustomSliderIndicator({
    Key? key,
    required this.padding,
    required this.indicatorLength,
    required this.activeIndex,
  }) : super(key: key);

  final double padding;
  final int indicatorLength;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(
          top: padding * 2,
        ),
        child: SliderIndicator(
          length: indicatorLength,
          activeIndex: activeIndex,
          indicator: const Icon(
            Icons.radio_button_unchecked,
            color: AppColors.primary,
          ),
          activeIndicator: const Icon(
            Icons.fiber_manual_record,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
