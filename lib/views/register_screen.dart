import 'package:dailyexpenses/controllers/auth_controller.dart';
import 'package:dailyexpenses/utils/spacers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/widgets/widget_form.dart';

class RegisterScreen extends StatelessWidget {
  AuthController loginController = Get.put(AuthController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String name = "";
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Register Screen',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              spaceHeight(),
              formInput(
                formName: 'Name: ',
                controller: nameController,
                hint: 'e.g: John Doe',
              ),
              formInput(
                formName: 'Email:',
                controller: emailController,
                hint: 'e.g: example@email.com',
              ),
              formInput(
                formName: 'Password: ',
                controller: passwordController,
                obsecureText: true,
                hint: 'enter your password',
              ),
              SizedBox(
                width: Get.width,
                child: ElevatedButton(
                  child: const Text('Register'),
                  onPressed: () {
                    loginController.register(
                      nameController.text,
                      emailController.text,
                      passwordController.text,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
