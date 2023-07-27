import 'dart:convert';

import 'package:dailyexpenses/models/login_model.dart';
import 'package:dailyexpenses/services/auth_services.dart';
import 'package:dailyexpenses/utils/widgets/modal_dialog.dart';
import 'package:dailyexpenses/views/home/home_screen.dart';
import 'package:dailyexpenses/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var loginModel = Rxn<LoginModel>();

  login(email, password) async {
    try {
      var response = await AuthServices.login("login", {
        "email": email,
        "password": password,
      });
      var res = jsonDecode(response.body);

      if (res['status'] == 'Succes') {
        Get.dialog(const Center(child: CircularProgressIndicator()));
        final storage = GetStorage();
        storage.write('token', res['token']);
        storage.write('name', res['data']['nama']);
        storage.write('id', res['data']['id']);
        Get.back();
        Get.offAll(() => const HomeScreen());
      } else {
        Get.dialog(const Center(child: CircularProgressIndicator()));
        Get.back();
        Get.dialog(modalDialogFailed(res['message']));
        return null;
      }
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
