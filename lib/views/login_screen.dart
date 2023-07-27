import 'package:dailyexpenses/controllers/auth_controller.dart';
import 'package:dailyexpenses/shared/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../utils/widgets/widget_form.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  AuthController loginController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String email = "";
  String password = "";

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login '),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        children: [
          Container(
            alignment: Alignment.center,
            child: LottieBuilder.network(
              'https://assets5.lottiefiles.com/packages/lf20_XpVCMJTSQt.json',
              height: 250,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Text('Error Loading Animation');
              },
            ),
          ),
          12.height,
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                const Text(
                  'Daily Expenses',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                10.height,
                const Text(
                  "Helping you realize you are spending too much every day for something you don't need.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          16.height,
          formInput(
            formName: 'Email: ',
            controller: emailController,
            hint: 'Email@example.com',
          ),
          formInput(
            formName: 'Password: ',
            controller: passwordController,
            obsecureText: true,
            hint: 'Enter your password',
          ),
          SizedBox(
            width: Get.width,
            child: ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                if (emailController.text.isNotEmpty ||
                    passwordController.text.isNotEmpty) {
                  loginController.login(
                    emailController.text,
                    passwordController.text,
                  );
                } else {
                  Get.snackbar(
                    'Error',
                    'Email atau Password tidak boleh kosong',
                  );
                }
              },
            ),
          ),
          10.height,
          SizedBox(
            width: Get.width,
            child: ElevatedButton(
              child: const Text('Register'),
              onPressed: () {
                Get.to(() => RegisterScreen());
              },
            ),
          ),
        ],
      ),
    );
  }
}
