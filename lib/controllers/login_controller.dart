import 'dart:convert';

import 'package:dailyexpenses/models/login_model.dart';
import 'package:dailyexpenses/services/login_services.dart';
import 'package:dailyexpenses/views/Homepage/home/home_screen.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var loginModel = Rxn<LoginModel>();

  login(email, password) async {
    try {
      var response = await LoginServices.login("login", {
        "email": email,
        "password": password,
      });
      var res = jsonDecode(response.body);

      if (res['status'] == 'Succes') {
        Get.offAll(() => const HomeScreen());
      } else {
        return null;
      }
    } catch (e) {
      // TODO: HANDLE IF ERROR
      throw Exception(e);
    }
  }
}
