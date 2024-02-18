import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tr_store/route/app_page.dart';
import 'package:tr_store/view/home/home_view.dart';
import 'package:tr_store/common/core/binding.dart';
import 'package:tr_store/common/theme/app_themes.dart';

void main() {
  runApp(const TRStore());
}

class TRStore extends StatelessWidget {
  const TRStore({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      initialRoute: AppPage.initial,
      getPages: AppPage.routes,
      theme: AppTheme.defaultTheme,
      home: const HomeView(),
    );
  }
}
