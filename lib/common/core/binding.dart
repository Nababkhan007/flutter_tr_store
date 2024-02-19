import 'package:get/get.dart';
import 'package:tr_store/view_model/cart_view_model.dart';
import 'package:tr_store/view_model/home_view_model.dart';
import 'package:tr_store/view_model/post_detail_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeViewModel(), fenix: true);
    Get.lazyPut(() => PostDetailViewModel(), fenix: true);
    Get.lazyPut(() => CartViewModel(), fenix: true);
  }
}
