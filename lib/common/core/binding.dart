import 'package:get/get.dart';
import 'package:tr_store/view_model/home_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeViewModel(), fenix: true);
  }
}
