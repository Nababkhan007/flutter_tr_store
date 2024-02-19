import 'package:get/get.dart';
import 'package:tr_store/route/app_route.dart';
import 'package:tr_store/view/cart/cart_view.dart';
import 'package:tr_store/view/home/home_view.dart';
import 'package:tr_store/view/post_detail/post_detail_view.dart';

abstract class AppPage {
  static const initial = AppRoute.home;

  static final routes = [
    GetPage(
      name: AppRoute.home,
      page: () => const HomeView(),
    ),
    GetPage(
      name: AppRoute.postDetail,
      page: () => const PostDetailView(),
    ),
    GetPage(
      name: AppRoute.cart,
      page: () => const CartView(),
    ),
  ];
}
