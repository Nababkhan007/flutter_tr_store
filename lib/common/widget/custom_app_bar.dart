import 'package:flutter/material.dart';
import 'package:tr_store/common/constant/constants.dart';

class CustomAppBar extends StatelessWidget {
  final bool automaticallyImplyLeading, isCenterTitle;
  final Color backgroundColor;
  final double elevation;
  final String title;
  final List<Widget> actions;
  final Widget body;

  const CustomAppBar({
    Key? key,
    this.automaticallyImplyLeading = true,
    this.backgroundColor = AppColors.primary,
    this.elevation = 0.0,
    this.isCenterTitle = false,
    required this.title,
    this.actions = const [],
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: automaticallyImplyLeading,
        elevation: elevation,
        centerTitle: isCenterTitle,
        title: Text(title),
        actions: actions,
      ),
      body: body,
    );
  }
}
