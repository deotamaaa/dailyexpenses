import 'dart:convert';

import '../models/login_model.dart';
import '../services/auth/auth_services.dart';
import '../views/login_screen.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var loginModel = Rxn<LoginModel>();

  login(email, password) async {
    try {
      // var response = await AuthServices.login("login", {
      //   "email": email,
      //   "password": password,
      // });
      // var res = jsonDecode(response.body);

      // if (res['status'] == 'Succes') {
      //   Get.dialog(const Center(child: CircularProgressIndicator()));
      //   final storage = GetStorage();
      //   storage.write('token', res['token']);
      //   storage.write('name', res['data']['nama']);
      //   storage.write('id', res['data']['id']);
      //   Get.back();
      //   Get.offAll(() => const HomeScreen());
      // } else {
      //   Get.dialog(const Center(child: CircularProgressIndicator()));
      //   Get.back();
      //   Get.dialog(const Center(
      //     child: Text('Login Gagal'),
      //   ));
      //   return null;
      // }
    } catch (e) {
      print(e);
    }
  }

  register(String name, String email, String password) async {
    try {
      var response = await AuthServices.register(
        "register",
        {
          "name": name,
          "email": email,
          "password": password,
        },
      );
      var res = jsonDecode(response.body);
      print(res);
      if (res['status'] == "Succes") {
        Get.to(() => LoginScreen());
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }
}
