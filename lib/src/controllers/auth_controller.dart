import 'dart:convert';

import 'package:dailyexpenses/src/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../models/login_model.dart';
import '../services/auth/auth_services.dart';
import '../views/login_screen.dart';

class AuthController extends GetxController {
  final AuthServices services;

  AuthController({required this.services});

  var isLoading = false.obs;
  var loginModel = Rxn<LoginModel>();

  final authForm = FormGroup({
    'email': FormControl<String>(
      validators: [Validators.required, Validators.email],
    ),
    'password': FormControl<String>(
      validators: [
        Validators.required,
        Validators.minLength(6),
        Validators.maxLength(20)
      ],
    ),
  });

  Future<void> login() async {
    try {
      await services.login(
        authForm.control('email').value,
        authForm.control('password').value,
      );

      Get.to(() => const HomeScreen());
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
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
      debugPrint(res.toString());
      if (res['status'] == "Succes") {
        Get.to(() => LoginScreen());
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
