import 'package:dailyexpenses/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());
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
        child: Column(children: [
          const Text('Login Screen'),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              hintText: 'Email',
            ),
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            obscuringCharacter: "*",
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
          ),
          ElevatedButton(
            child: const Text('Login'),
            onPressed: () {
              loginController.login(
                emailController.text,
                passwordController.text,
              );
            },
          ),
        ]),
      ),
    );
  }
}
