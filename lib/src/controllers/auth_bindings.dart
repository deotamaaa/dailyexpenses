import 'package:dailyexpenses/src/controllers/auth_controller.dart';
import 'package:get/get.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(
        services: Get.find(),
      ),
    );
  }
}
