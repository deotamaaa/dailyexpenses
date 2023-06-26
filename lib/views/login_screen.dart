import 'package:dailyexpenses/controllers/auth_controller.dart';
import 'package:dailyexpenses/utils/spacers.dart';
import 'package:dailyexpenses/utils/widgets/widget_form.dart';
import 'package:dailyexpenses/views/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        title: const Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Login Screen',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              spaceHeight(),
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
                    loginController.login(
                      emailController.text,
                      passwordController.text,
                    );
                  },
                ),
              ),
              spaceHeight(height: 10.0),
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
        ),
      ),
    );
  }
}
