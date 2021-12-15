import 'package:abc_food_app/business/network_controller.dart';
import 'package:abc_food_app/business/controllers/auth_controller.dart';
import 'package:abc_food_app/business/controllers/cart_controller.dart';
import 'package:abc_food_app/business/controllers/home_controller.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel);
    Get.lazyPut(() => HomeViewModel);
    Get.put(CartViewModel());
    Get.lazyPut(() => NetworkViewModel);
  }
}
