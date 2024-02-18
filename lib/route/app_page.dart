import 'package:get/get.dart';
import 'package:tr_store/route/app_route.dart';
import 'package:tr_store/view/home/home_view.dart';

abstract class AppPage {
  static const initial = AppRoute.home;

  static final routes = [
    GetPage(
      name: AppRoute.home,
      page: () => const HomeView(),
    ),
  ];
}
